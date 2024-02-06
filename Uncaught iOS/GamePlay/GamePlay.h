//
//  GamePlay.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/11/2023.
//

// #import "GameComponent.h"

#import <Foundation/Foundation.h>
#import "Retronator.Uncaught.classes.h"
#import "GameState.h"

NS_ASSUME_NONNULL_BEGIN

@interface GamePlay : GameState {
    Level *level;
    GameHud *hud;
    
    Player *humanPlayer;
//    Enemy *enemy;
//    Fighter *fighter;
    
    int score;
    
    GameRenderer *renderer;
    GuiRenderer *hudRenderer;
    // PhysicsEngine *physics;
    
    ButtonButton *pause;
    GameTimer *timer;
    
    BOOL help;
}

@property (nonatomic, readonly) Level *level;
@property (nonatomic, strong) GameTimer *timer;

- (id) initSinglePlayerWithGame:(Game*)theGame levelClass:(Class)levelClass;

@end

NS_ASSUME_NONNULL_END
