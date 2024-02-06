//
//  PhysicsEngine.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/11/2023.
//

// #import "GameComponent.h"
// #import "Level.h"

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhysicsEngine : GameComponent {
    Level *level;
    
}

- (id) initWithGame:(Game*)theGame level:(Level*)theLevel;


@end

NS_ASSUME_NONNULL_END
