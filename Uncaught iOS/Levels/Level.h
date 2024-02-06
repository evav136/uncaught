//
//  Level.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 25/11/2023.
//

#import <Foundation/Foundation.h>

#import "Retronator.Uncaught.classes.h"
#import "Express.Scene.h"

NS_ASSUME_NONNULL_BEGIN

@interface Level : GameComponent {
    // Scene
    Scene *scene;
    
    Fighter *fighter;
    Enemy *enemy;
    
    GameTimer *timer;
    
    Vector2 *fighterSpawn;
    Vector2 *enemySpawn;
            
    float gravity;
    int coinsCount;
}

@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, readonly) Fighter *fighter;
@property (nonatomic, readonly) Enemy *enemy;

@property (nonatomic, readonly) int coinsCount;
@property (nonatomic, assign) float gravity;


- (void)initialize;

// resets the level to its initial conditions
- (void)resetLevelWithCoins;

@end

NS_ASSUME_NONNULL_END
