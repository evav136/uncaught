//
//  Player.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 01/12/2023.
//

#import "GameComponent.h"
#import "Retronator.Uncaught.classes.h"
#import "IScene.h"

NS_ASSUME_NONNULL_BEGIN

@interface Player : GameComponent {
    Fighter *fighter;
    BOOL paused;
    // id<IScene> scene;
}

@property (nonatomic, assign) BOOL paused;

- (id) initWithGame:(Game*)theGame Fighter:(Fighter*)theFighter;

- (void) updateWithGameTime:(GameTime*)gameTime;

- (void) movePlayerLeft;
- (void) movePlayerRight;


@end

NS_ASSUME_NONNULL_END
