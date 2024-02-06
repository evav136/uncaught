//
//  GameRenderer.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/11/2023.
//

#import "DrawableGameComponent.h"
#import <Foundation/Foundation.h>
#import "ContentManager.h"
#import "Retronator.Uncaught.classes.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Express.Graphics.h"
#import "AnimatedSprite.h"
#import "AnimatedSpriteFrame.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameRenderer : DrawableGameComponent {
    // Resources
    ContentManager *content;
    
    // Here we have the sprites used to render scene objects. One sprite for each scene object type.
    Sprite *runSprite1, *runSprite2, *runSprite3, *runSprite4, *standSprite1, *standSprite2;
    Sprite *enemySprite1, *enemySprite2;
    Sprite *buttonJump1, *buttonJump2;
    Sprite *buttonLeft1, *buttonLeft2;
    Sprite *buttonRight1, *buttonRight2;
    Sprite *timerSpace, *faster;
    
    Sprite *laserOn, *laserOff;
    Sprite *trigger;
    
    Vector2 *buttonPosition;
        
    Sprite *coin1, *coin2, *coin3, *coin4, *coin5;
    Sprite *timer1, *timer2, *timer3, *timer4, *timer5, *timer6, *timer7, *timer8, *timer9, *timer10, *timer11, *timer12, *timer13, *timer14, *timer15, *timer16, *timer17, *timer18;

    Texture2D *bgSprite, *characterTexture, *iconTexture, *signTexture;

    Rectangle *pointBounds;
    
    AnimatedSprite *runningAnimation;
    AnimatedSprite *standingAnimation;
    AnimatedSprite *coinAnimation;
    AnimatedSprite *timerAnimation;
    
    BOOL displayFasterSprite;
    BOOL showTimer;
    
    NSTimer *fasterSpriteTimer;
    NSTimeInterval watchingDuration;
    
    // Graphics objects
    // We use sprite batch to draw sprites.
    SpriteBatch *spriteBatch;
    
    // Level
    // This is the level we will be rendering.
    Level *level;
    GamePlay *gamePlay;
    
    BOOL watching, moving, character, movingBack;
    BOOL gameIsOver;
    
}

// - (id) initWithGame:(Game *)theGame level:(Level *)theLevel;
- (id) initWithGame:(Game*)theGame gamePlay:(GamePlay*)theGamePlay level:(Level *)theLevel;


@end

NS_ASSUME_NONNULL_END
