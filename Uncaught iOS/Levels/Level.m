//
//  Level.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 25/11/2023.
//


#import "Retronator.Uncaught.h"
#import "ICustomUpdate.h"

@interface Level ()

- (void) reset;

@end

@implementation Level

@synthesize fighter, enemy, scene, gravity, coinsCount;

- (id) initWithGame:(Game *)theGame
{
    self = [super initWithGame:theGame];
    
    if (self != nil) {
        // Create the scene.
        scene = [[Scene alloc] initWithGame:self.game];
        
        // Create common scene items.
        fighter = [[Fighter alloc] init];
        
        enemy = [[Enemy alloc] init];
        
        [scene addItem:fighter];
        [scene addItem:enemy];
                
        fighterSpawn = [[Vector2 alloc] init];
        enemySpawn = [[Vector2 alloc] init];
    }
    return self;
}

- (void) initialize {
    [super initialize];
    
    [self.game.components addComponent:scene];
}

- (void) resetLevelWithCoins {
    [self reset];
    
    [fighter.position set:fighterSpawn];
    
    if (enemy) {
        [enemy.position set:enemySpawn];
    }
        
    coinsCount = 0;
    
    // add 4 coins
    for (int i = 0; i < 4; i++) {
        Coin *coin = [[[Coin alloc] init] autorelease];
        coin.position.x = coin.getRandomXPosition;
        coin.position.y = 850;
                
        [scene addItem:coin];
        coinsCount++;
    }
}

- (void) reset {
    [fighter.position set:fighterSpawn];
    
    if (enemy) {
        [enemy.position set: enemySpawn];
    }
    // [enemy.position set: enemySpawn];
}

- (void)updateWithGameTime:(GameTime *)gameTime {
    for (id item in scene) {
        id<ICustomUpdate> updatable = [item conformsToProtocol:@protocol(ICustomUpdate)] ? item : nil;
        
        if (updatable) {
            [updatable updateWithGameTime:gameTime];
        }
    }
}

- (void) dealloc
{
    
    NSLog(@"Unloading level.");
    [self.game.components removeComponent:scene];
    
    [fighterSpawn release];
    [enemySpawn release];
    [scene release];
    [super dealloc];
}

@end


