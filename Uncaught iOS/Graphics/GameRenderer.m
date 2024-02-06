//
//  GameRenderer.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/11/2023.
//

#import "GameRenderer.h"
#import "Retronator.Uncaught.h"
#import "Scene.h"
#import "Express.Scene.Objects.h"
#import "Fighter.h"
#import "AnimatedSpriteFrame.h"
#import "AnimatedSprite.h"

@implementation GameRenderer

- (id) initWithGame:(Game *)theGame gamePlay:(GamePlay*)theGamePlay level:(Level *)theLevel {
    if (self = [super initWithGame:theGame]) {
        gamePlay = theGamePlay;
        displayFasterSprite = NO;
        
        fasterSpriteTimer = nil;
        gameIsOver = NO;
        
        movingBack = NO;
        
        if ([level isKindOfClass:[Level1 class]]) {
            showTimer = YES;
        }
        
    }
    return self;
}

- (void) initialize {

    // [self.game.services addService:self ofType:@protocol(IProjector)];
    [super initialize];
}

- (void) loadContent {
    // We create our sprite batch which we will use for drawing the sprites.
    spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
    characterTexture = [self.game.content load:@"characters"];
    signTexture = [self.game.content load:@"sign"];
    iconTexture = [self.game.content load:@"icons"];
    
    // We initialize the sprites themselves.
    
    laserOn = [[Sprite alloc] init];
    laserOn.texture = iconTexture;
    laserOn.sourceRectangle = [Rectangle rectangleWithX:1568 y:0 width:80 height:960];
    laserOn.origin = [Vector2 vectorWithX:40 y:480];
    
    laserOff = [[Sprite alloc] init];
    laserOff.texture = iconTexture;
    laserOff.sourceRectangle = [Rectangle rectangleWithX:1648 y:0 width:80 height:960];
    laserOff.origin = [Vector2 vectorWithX:40 y:480];
    
    trigger = [[Sprite alloc] init];
    trigger.texture = iconTexture;
    trigger.sourceRectangle = [Rectangle rectangleWithX:1736 y:0 width:32 height:24];
    trigger.origin = [Vector2 vectorWithX:16 y:12];
    
    timerSpace = [[Sprite alloc] init];
    timerSpace.texture = iconTexture;
    timerSpace.sourceRectangle = [Rectangle rectangleWithX:0 y:1688 width:272 height:136];
    timerSpace.origin = [Vector2 vectorWithX:136 y:68];
    
    // Timer Animation
    timer1 = [[Sprite alloc] init];
    timer1.texture = iconTexture;
    timer1.sourceRectangle = [Rectangle rectangleWithX:0 y:168 width:152 height:152];
    timer1.origin = [Vector2 vectorWithX:76 y:76];
    
    timer2 = [[Sprite alloc] init];
    timer2.texture = iconTexture;
    timer2.sourceRectangle = [Rectangle rectangleWithX:152 y:168 width:152 height:152];
    timer2.origin = [Vector2 vectorWithX:76 y:67];
    
    timer3 = [[Sprite alloc] init];
    timer3.texture = iconTexture;
    timer3.sourceRectangle = [Rectangle rectangleWithX:304 y:168 width:152 height:152];
    timer3.origin = [Vector2 vectorWithX:76 y:76];
    
    timer4 = [[Sprite alloc] init];
    timer4.texture = iconTexture;
    timer4.sourceRectangle = [Rectangle rectangleWithX:456 y:168 width:152 height:152];
    timer4.origin = [Vector2 vectorWithX:76 y:76];
    
    timer5 = [[Sprite alloc] init];
    timer5.texture = iconTexture;
    timer5.sourceRectangle = [Rectangle rectangleWithX:608 y:168 width:152 height:152];
    timer5.origin = [Vector2 vectorWithX:76 y:76];
    
    timer6 = [[Sprite alloc] init];
    timer6.texture = iconTexture;
    timer6.sourceRectangle = [Rectangle rectangleWithX:760 y:168 width:152 height:152];
    timer6.origin = [Vector2 vectorWithX:76 y:76];
    
    timer7 = [[Sprite alloc] init];
    timer7.texture = iconTexture;
    timer7.sourceRectangle = [Rectangle rectangleWithX:912 y:168 width:152 height:152];
    timer7.origin = [Vector2 vectorWithX:76 y:76];
    
    timer8 = [[Sprite alloc] init];
    timer8.texture = iconTexture;
    timer8.sourceRectangle = [Rectangle rectangleWithX:1064 y:168 width:152 height:152];
    timer8.origin = [Vector2 vectorWithX:76 y:76];
    
    timer9 = [[Sprite alloc] init];
    timer9.texture = iconTexture;
    timer9.sourceRectangle = [Rectangle rectangleWithX:1216 y:168 width:152 height:152];
    timer9.origin = [Vector2 vectorWithX:76 y:76];
    
    timer10 = [[Sprite alloc] init];
    timer10.texture = iconTexture;
    timer10.sourceRectangle = [Rectangle rectangleWithX:0 y:320 width:152 height:152];
    timer10.origin = [Vector2 vectorWithX:76 y:76];
    
    timer11 = [[Sprite alloc] init];
    timer11.texture = iconTexture;
    timer11.sourceRectangle = [Rectangle rectangleWithX:152 y:320 width:152 height:152];
    timer11.origin = [Vector2 vectorWithX:76 y:76];
    
    timer12 = [[Sprite alloc] init];
    timer12.texture = iconTexture;
    timer12.sourceRectangle = [Rectangle rectangleWithX:304 y:320 width:152 height:152];
    timer12.origin = [Vector2 vectorWithX:76 y:76];
    
    timer13 = [[Sprite alloc] init];
    timer13.texture = iconTexture;
    timer13.sourceRectangle = [Rectangle rectangleWithX:456 y:320 width:152 height:152];
    timer13.origin = [Vector2 vectorWithX:76 y:76];
    
    timer14 = [[Sprite alloc] init];
    timer14.texture = iconTexture;
    timer14.sourceRectangle = [Rectangle rectangleWithX:608 y:320 width:152 height:152];
    timer14.origin = [Vector2 vectorWithX:76 y:76];
    
    timer15 = [[Sprite alloc] init];
    timer15.texture = iconTexture;
    timer15.sourceRectangle = [Rectangle rectangleWithX:760 y:320 width:152 height:152];
    timer15.origin = [Vector2 vectorWithX:76 y:76];
    
    timer16 = [[Sprite alloc] init];
    timer16.texture = iconTexture;
    timer16.sourceRectangle = [Rectangle rectangleWithX:912 y:320 width:152 height:152];
    timer16.origin = [Vector2 vectorWithX:76 y:76];
    
    timer17 = [[Sprite alloc] init];
    timer17.texture = iconTexture;
    timer17.sourceRectangle = [Rectangle rectangleWithX:1064 y:320 width:152 height:152];
    timer17.origin = [Vector2 vectorWithX:76 y:76];
    
    timer18 = [[Sprite alloc] init];
    timer18.texture = iconTexture;
    timer18.sourceRectangle = [Rectangle rectangleWithX:1216 y:320 width:152 height:152];
    timer18.origin = [Vector2 vectorWithX:76 y:76];
        
    // Sprites for Player
    standSprite1 = [[Sprite alloc] init];
    standSprite1.texture = characterTexture;
    standSprite1.sourceRectangle = [Rectangle rectangleWithX:0 y:1218 width:84 height:174];
    standSprite1.origin = [Vector2 vectorWithX:42 y:87];
    
    standSprite2 = [[Sprite alloc] init];
    standSprite2.texture = characterTexture;
    standSprite2.sourceRectangle = [Rectangle rectangleWithX:84 y:1218 width:84 height:174];
    standSprite2.origin = [Vector2 vectorWithX:42 y:87];
    
    runSprite1 = [[Sprite alloc] init];
    runSprite1.texture = characterTexture;
    runSprite1.sourceRectangle = [Rectangle rectangleWithX:174 y:1218 width:132 height:174];
    runSprite1.origin = [Vector2 vectorWithX:66 y:87];
    
    runSprite2 = [[Sprite alloc] init];
    runSprite2.texture = characterTexture;
    runSprite2.sourceRectangle = [Rectangle rectangleWithX:300 y:1218 width:132 height:174];
    runSprite2.origin = [Vector2 vectorWithX:66 y:87];
    
    runSprite3 = [[Sprite alloc] init];
    runSprite3.texture = characterTexture;
    runSprite3.sourceRectangle = [Rectangle rectangleWithX:426 y:1218 width:132 height:174];
    runSprite3.origin = [Vector2 vectorWithX:66 y:87];
    
    runSprite4 = [[Sprite alloc] init];
    runSprite4.texture = characterTexture;
    runSprite4.sourceRectangle = [Rectangle rectangleWithX:300 y:1218 width:132 height:174];
    runSprite4.origin = [Vector2 vectorWithX:66 y:87];
    
    runningAnimation = [[AnimatedSprite alloc] initWithDuration:0.19];
    runningAnimation.looping = NO;
        
    for (int i = 1; i <= 4; i++) {
        Sprite *sprite = [self valueForKey:[NSString stringWithFormat:@"runSprite%d", i]];
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:sprite start:runningAnimation.duration * (float)(i - 1) / 4];
        [runningAnimation addFrame:frame];
    }
    
    runningAnimation.looping = YES;
    
    standingAnimation = [[AnimatedSprite alloc] initWithDuration:0.18];
    standingAnimation.looping = NO;
    
    for (int i = 1; i <= 2; i++) {
        Sprite *sprite = [self valueForKey:[NSString stringWithFormat:@"standSprite%d", i]];
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:sprite start:standingAnimation.duration * (float)(i - 1) / 2];
        [standingAnimation addFrame:frame];
    }
    
    standingAnimation.looping = YES;
    
    // Sprite for Enemy back
    enemySprite1 = [[Sprite alloc] init];
    enemySprite1.texture = characterTexture;
    enemySprite1.sourceRectangle = [Rectangle rectangleWithX:0 y:858 width:294 height:294];
    enemySprite1.origin = [Vector2 vectorWithX:147 y:147];
    
    // Sprite for Enemy front
    enemySprite2 = [[Sprite alloc] init];
    enemySprite2.texture = characterTexture;
    enemySprite2.sourceRectangle = [Rectangle rectangleWithX:342 y:858 width:294 height:294];
    enemySprite2.origin = [Vector2 vectorWithX:147 y:147];
    
    bgSprite = characterTexture;
    
    // Sprites for buttons
    buttonJump1 = [[Sprite alloc] init];
    buttonJump1.texture = iconTexture;
    buttonJump1.sourceRectangle = [Rectangle rectangleWithX:400 y:1288 width:200 height:200];
    buttonJump1.origin = [Vector2 vectorWithX:100 y:100];
    
    buttonLeft1 = [[Sprite alloc] init];
    buttonLeft1.texture = iconTexture;
    buttonLeft1.sourceRectangle = [Rectangle rectangleWithX:0 y:1288 width:200 height:200];
    buttonLeft1.origin = [Vector2 vectorWithX:100 y:100];
    
    buttonRight1 = [[Sprite alloc] init];
    buttonRight1.texture = iconTexture;
    buttonRight1.sourceRectangle = [Rectangle rectangleWithX:200 y:1288 width:200 height:200];
    buttonRight1.origin = [Vector2 vectorWithX:100 y:100];
    
    buttonJump2 = [[Sprite alloc] init];
    buttonJump2.texture = iconTexture;
    buttonJump2.sourceRectangle = [Rectangle rectangleWithX:400 y:1488 width:200 height:200];
    buttonJump2.origin = [Vector2 vectorWithX:100 y:100];
    
    buttonLeft2 = [[Sprite alloc] init];
    buttonLeft2.texture = iconTexture;
    buttonLeft2.sourceRectangle = [Rectangle rectangleWithX:0 y:1488 width:200 height:200];
    buttonLeft2.origin = [Vector2 vectorWithX:100 y:100];
    
    buttonRight2 = [[Sprite alloc] init];
    buttonRight2.texture = iconTexture;
    buttonRight2.sourceRectangle = [Rectangle rectangleWithX:200 y:1488 width:200 height:200];
    buttonRight2.origin = [Vector2 vectorWithX:100 y:100];
    
    pointBounds = [[Rectangle alloc] initWithX:1024 y:0 width:80 height:80];
    
    // Sprites for Coins
    coin1 = [[Sprite alloc] init];
    coin1.texture = iconTexture;
    coin1.sourceRectangle = [Rectangle rectangleWithX:0 y:80 width:80 height:80];
    coin1.origin = [Vector2 vectorWithX:40 y:40];
    
    coin2 = [[Sprite alloc] init];
    coin2.texture = iconTexture;
    coin2.sourceRectangle = [Rectangle rectangleWithX:88 y:80 width:80 height:80];
    coin2.origin = [Vector2 vectorWithX:40 y:40];
    
    coin3 = [[Sprite alloc] init];
    coin3.texture = iconTexture;
    coin3.sourceRectangle = [Rectangle rectangleWithX:173 y:80 width:96 height:80];
    coin3.origin = [Vector2 vectorWithX:48 y:40];
    
    coin4 = [[Sprite alloc] init];
    coin4.texture = iconTexture;
    coin4.sourceRectangle = [Rectangle rectangleWithX:272 y:80 width:80 height:80];
    coin4.origin = [Vector2 vectorWithX:40 y:40];
    
    coin5 = [[Sprite alloc] init];
    coin5.texture = iconTexture;
    coin5.sourceRectangle = [Rectangle rectangleWithX:360 y:80 width:80 height:80];
    coin5.origin = [Vector2 vectorWithX:40 y:40];
    
    coinAnimation = [[AnimatedSprite alloc] initWithDuration:0.2];
    coinAnimation.looping = NO;
        
    for (int i = 1; i <= 5; i++) {
        Sprite *sprite = [self valueForKey:[NSString stringWithFormat:@"coin%d", i]];
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:sprite start:coinAnimation.duration * (float)(i - 1) / 5];
        [coinAnimation addFrame:frame];
    }
    
    coinAnimation.looping = YES;
    
    // Faster sign
    faster = [[Sprite alloc] init];
    faster.texture = signTexture;
    faster.sourceRectangle = [Rectangle rectangleWithX:0 y:184 width:440 height:140];
    faster.origin = [Vector2 vectorWithX:220 y:66];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
    
    // Clear the background with some color.
    [self.graphicsDevice clearWithColor:[Color maroon]];
    
    // Start the sprite batch.
    [spriteBatch beginWithSortMode:SpriteSortModeBackToFront BlendState:nil];
    
    [spriteBatch draw:bgSprite to:[Vector2 vectorWithX:0 y:-40] fromRectangle:nil tintWithColor:[Color white] rotation:0 origin:[Vector2 zero] scaleUniform:1.5 effects:SpriteEffectsNone layerDepth:0.9];
    
    [spriteBatch draw:buttonLeft1.texture
                   to:[Vector2 vectorWithX:250 y:1070]
        fromRectangle:buttonLeft1.sourceRectangle
        tintWithColor:[Color white]
             rotation:0
               origin:buttonLeft1.origin
         scaleUniform:1
              effects:SpriteEffectsNone
           layerDepth:0];
    
    [spriteBatch draw:buttonRight1.texture
                   to:[Vector2 vectorWithX:2300 y:1070]
        fromRectangle:buttonRight1.sourceRectangle
        tintWithColor:[Color white]
             rotation:0
               origin:buttonRight1.origin
         scaleUniform:1
              effects:SpriteEffectsNone
           layerDepth:0];
    
//    [spriteBatch draw:buttonJump1.texture
//                   to:[Vector2 vectorWithX:2300 y:1070]
//        fromRectangle:buttonJump1.sourceRectangle
//        tintWithColor:[Color white]
//             rotation:0
//               origin:buttonJump1.origin
//         scaleUniform:1
//              effects:SpriteEffectsNone
//           layerDepth:0];
    
    [spriteBatch draw:timerSpace.texture
                   to:[Vector2 vectorWithX:2120 y:85]
        fromRectangle:timerSpace.sourceRectangle
        tintWithColor:[Color white]
             rotation:0
               origin:timerSpace.origin
         scaleUniform:1.1
              effects:SpriteEffectsNone
           layerDepth:0];
    
    [spriteBatch draw:iconTexture to:[Vector2 vectorWithX:275 y:60] fromRectangle:pointBounds tintWithColor:[Color white] rotation:0 origin:[Vector2 vectorWithX:pointBounds.width/2 y:pointBounds.height/2] scaleUniform:1 effects:SpriteEffectsNone layerDepth:0];

    // Go over the whole scene
    for (id item in gamePlay.level.scene) {
        
        // See if the current item has a position.
        id<IPosition> itemWithPosition = [item conformsToProtocol:@protocol(IPosition)] ? item : nil;
        
        
        // Determine which sprite should be drawn, depending on the type of the item.
        Sprite *sprite = nil;
        
        if ([item isKindOfClass:[Laser class]]) {
            Laser *laser = (Laser *)item;
            
            if (laser.on) {
                sprite = laserOn;
            } else {
                sprite = laserOff;
            }
            
        } else if ([item isKindOfClass:[Trigger class]]) {
            sprite = trigger;
            
        } else if ([item isKindOfClass:[Fighter class]]) {
            Fighter *fighter = (Fighter *)item;
            
            movingBack = fighter.movingBack;
            
            if (fighter.isMoving) {
                sprite = [runningAnimation spriteAtTime:gameTime.totalGameTime];
            } else {
                sprite = [standingAnimation spriteAtTime:gameTime.totalGameTime];
            }
            
            character = YES;
            
            if (fighter.pickedCoins == 6) {
                
                displayFasterSprite = YES;
                [self startFasterSpriteTimer];
            }
            
        } else if ([item isKindOfClass:[Enemy class]]) {
            Enemy *enemy = (Enemy *)item;
            
            character = YES;
                        
            if (enemy.facingBack) {
                sprite = enemySprite2;
                watchingDuration = enemy.watchingTime;
                watching = YES;
                                
            } else {
                sprite = enemySprite1;
                watching = NO;
            }
                        
        } else if ([item isKindOfClass:[Coin class]]) {
            sprite = [coinAnimation spriteAtTime:gameTime.totalGameTime];
        }
        
        // If the item has both position and a valid sprite is set, proceed with drawing.
        if (itemWithPosition && sprite) {
            if (character && !movingBack) {
                
                [spriteBatch draw:sprite.texture
                               to:itemWithPosition.position
                    fromRectangle:sprite.sourceRectangle
                    tintWithColor:[Color white]
                         rotation:0
                           origin:sprite.origin
                     scaleUniform:1.5
                          effects:SpriteEffectsNone
                       layerDepth:0];
                
                character = NO;
                
            } else if (character && movingBack) {
                
                [spriteBatch draw:sprite.texture
                               to:itemWithPosition.position
                    fromRectangle:sprite.sourceRectangle
                    tintWithColor:[Color white]
                         rotation:0
                           origin:sprite.origin
                     scaleUniform:1.5
                          effects:SpriteEffectsFlipHorizontally
                       layerDepth:0];
                
                character = movingBack = NO;
                
            } else {

                [spriteBatch draw:sprite.texture
                               to:itemWithPosition.position
                    fromRectangle:sprite.sourceRectangle
                    tintWithColor:[Color white]
                         rotation:0
                           origin:sprite.origin
                     scaleUniform:1
                          effects:SpriteEffectsNone
                       layerDepth:0];
            }
        }
    }
    
//    if (!watching) {
//        // New timer everytime the enemy turns.
//
//        timerAnimation = [[AnimatedSprite alloc] initWithDuration:watchingDuration];
//        timerAnimation.looping = NO;
//
//        for (int i = 1; i <= 18; i++) {
//            Sprite *sprite = [self valueForKey:[NSString stringWithFormat:@"timer%d", i]];
//            AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:sprite start:timerAnimation.duration * (float)(i - 1) / 18];
//            [timerAnimation addFrame:frame];
//        }
//
//        Sprite *sprite = [timerAnimation spriteAtTime:gameTime.totalGameTime];
//
//        [spriteBatch draw:sprite.texture
//                       to:[Vector2 vectorWithX:2300 y:600]
//            fromRectangle:sprite.sourceRectangle
//            tintWithColor:[Color white]
//                 rotation:0
//                   origin:sprite.origin
//             scaleUniform:1
//                  effects:SpriteEffectsNone
//               layerDepth:0];
//    }
    
    if (displayFasterSprite) {
        [spriteBatch draw:faster.texture
                       to:[Vector2 vectorWithX:960 y:500]
            fromRectangle:faster.sourceRectangle
            tintWithColor:[Color white]
                 rotation:0
                   origin:[Vector2 zero]
             scaleUniform:1.5
                  effects:SpriteEffectsNone
               layerDepth:0];
    }
            
    [spriteBatch end];
}

- (void) unloadContent
{
    [spriteBatch release];
    [characterTexture release];
    [iconTexture release];
    [signTexture release];
    [runSprite1 release];
    [runSprite2 release];
    [runSprite2 release];
    [standSprite1 release];
    [standSprite2 release];
    [enemySprite1 release];
    [enemySprite2 release];
    [laserOn release];
    [laserOff release];
    
    [trigger release];
    
    for (int i = 1; i <= 5; i++) {
        [[NSString stringWithFormat:@"coin%d", i] release];
    }
    
    for (int i = 1; i <= 5; i++) {
        [[NSString stringWithFormat:@"timer%d", i] release];
    }
    
    [buttonJump1 release];
    [buttonLeft1 release];
    [buttonRight1 release];
}

- (void) dealloc
{
    [super dealloc];
}

- (void)startFasterSpriteTimer {
    // Invalidate the existing timer if any
    [fasterSpriteTimer invalidate];

    // Start a new timer to hide the "Faster" sprite after a few seconds
    fasterSpriteTimer = [NSTimer scheduledTimerWithTimeInterval:0.9
                                                         target:self
                                                       selector:@selector(hideFasterSprite)
                                                       userInfo:nil
                                                        repeats:NO];
}

- (void)hideFasterSprite {
    // Hide the "Faster" sprite
    displayFasterSprite = NO;
}

@end
