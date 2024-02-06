//
//  GamePlay.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/11/2023.
//

#import "GamePlay.h"
#import "Retronator.Uncaught.h"
#import "GameRenderer.h"
#import "GameComponentCollection.h"
#import "HumanPlayer.h"


@interface GamePlay ()

- (void) startInitWithLevelClass:(Class)levelClass;
- (void) finishInit;
- (void) playerPoint;
- (void) powerUp;

@end

@implementation GamePlay {
    int highScore;
}


- (id) initSinglePlayerWithGame:(Game *)theGame levelClass:(Class)levelClass
{
    self = [super initWithGame:theGame];
    if (self != nil) {
                // Allocate and initialize a new level and add it to components.
        [self startInitWithLevelClass:levelClass];
        
//        enemy = level.enemy;
//        fighter = level.fighter;
        
        humanPlayer = [[HumanPlayer alloc] initWithGame:self.game Fighter:level.fighter];
        
        [self finishInit];
    }
    
    return self;
}

@synthesize level, timer;

- (void) startInitWithLevelClass:(Class)levelClass
{
    // Allocate and initialize a new level and add it to components.
    level = [[levelClass alloc] initWithGame:self.game];
}

- (void) finishInit
{
    // Create a physics engine and add it to components.
    
    // Create a new renderer for the new level and add it to components.
    renderer = [[GameRenderer alloc] initWithGame:self.game gamePlay:self level:level];
    
    // Create a timer
    timer = [[GameTimer alloc] initWithTime:30];
    [self.game.components addComponent:timer];
    
    // Create a hud and a renderer for the hud.
    hud = [[GameHud alloc] initWithGame:self.game];
    
    hudRenderer = [[GuiRenderer alloc] initWithGame:self.game scene:hud.scene];
    hudRenderer.drawOrder = 1;
   
    // Setup correct update order.
    humanPlayer.updateOrder = 0;
    level.updateOrder = 1;
    level.scene.updateOrder = 2;
    self.updateOrder = 3;
    
    [timer startTimer];
}

- (void) activate {
    
    // [self.game.components addComponent:timer];
    [self.game.components addComponent:level];
    [self.game.components addComponent:hud];
    [self.game.components addComponent:hudRenderer];
    [self.game.components addComponent:renderer];
    [self.game.components addComponent:humanPlayer];
    
}

- (void) deactivate {
    
    [self.game.components removeComponent:timer];
    [self.game.components removeComponent:hud];
    [self.game.components removeComponent:hudRenderer];
    [self.game.components removeComponent:level];
    [self.game.components removeComponent:renderer];
    [self.game.components removeComponent:humanPlayer];
    
}

- (void) initialize {
    [super initialize];

    score = 0;
    [level resetLevelWithCoins];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // Game rules
    [humanPlayer updateWithGameTime:gameTime];
    
    GameLost *gameLost = [[[GameLost alloc] initWithGame:self.game] autorelease];
    
    NSMutableArray *removeCoins = [[NSMutableArray alloc] init];
    
    
    // Check for collisions and collect coins
    for (id item in level.scene) {
        
        if ([item isKindOfClass:[Trigger class]]) {
            Trigger *trigger = (Trigger*) item;
            [trigger triggeredByFighter:level.fighter];
        }
        
        if ([item isKindOfClass:[Laser class]]) {
            Laser *laser = (Laser*) item;
            if (laser.trigger.triggered) {
                [laser turnOn];
            }
                        
            if ([laser collidesWithPlayer:level.fighter]) {
                [uncaught popState];
                [uncaught pushState:gameLost];
            }
        }
        
        Coin *coin = [item isKindOfClass:[Coin class]] ? item:nil;
        
        if (!coin.collected && [coin collidesWithPlayer:level.fighter]) {
            [coin collectedByPlayer:level.fighter];
            
            // Coin picked by player
            level.fighter.pickedCoins++;
            [self playerPoint];
            
            [removeCoins addObject:coin];
            
            // add a new coin
            Coin *coin1 = [[[Coin alloc] init] autorelease];
            coin1.position.x = coin.getRandomXPosition;
            coin1.position.y = 850;
            
            [level.scene addItem:coin1];
        }
    }
    

    // Remove collected coins from the array and the scene
    for (Coin *coin in removeCoins) {
        [level.scene removeItem:coin];
    }
    
    [removeCoins release];
        
    if ((level.enemy.facingBack && level.fighter.isMoving) || timer.outOfTime) {
        
        // [self performSelector:@selector(popGameState:) withObject:gameLost afterDelay:4.0];
        
        [uncaught popState];
        [uncaught pushState:gameLost];
    
    } else {
        [hud updateWithGameTime:gameTime];
    }
}

- (void) popGameState:(GameState*)gameState {
    [uncaught popState];
    [uncaught pushState:gameState];
}

- (void) playerPoint {
    [SoundEngine play:SoundEffectTypePoint];
    score++;
    
    [hud changePlayerScore:score];
    
    if (score >= [Constants winScore]) {
        // check if remaining time is better than high score
        NSTimeInterval remainingTime = timer.remainingTime;
        
        // WinScreen
        // [self performSelector:@selector(popGameState) withObject:nil afterDelay:4.0];
        
        GameWon *gameWon = [[[GameWon alloc] initWithGame:self.game] autorelease];
        
        // [self performSelector:@selector(popGameState:) withObject:gameWon afterDelay:2.0];
        
        [uncaught popState];
        [uncaught pushState:gameWon];
    }
}

- (void) powerUp {
    
}

- (void) dealloc
{
    
    [hud release];
    [hudRenderer release];
    [level release];
    [renderer release];
    [humanPlayer release];
    [timer release];
    //[physics release];
    
    [super dealloc];
}

@end
