//
//  PhysicsEngine.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/11/2023.
//

#import "PhysicsEngine.h"
#import "Retronator.Uncaught.h"


@implementation PhysicsEngine

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
    if (self = [super initWithGame:theGame]) {
        level = theLevel;
    }
    return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // First we apply friction to the player and move it.
    float gravity = level.gravity;
    Fighter *fighter = level.fighter;
    // Update the velocity of the player based on gravity

    // Update the velocity of the player based on gravity
    fighter.velocity.y += level.gravity * gameTime.elapsedGameTime;
    
    // Update the position of the player based on its velocity
    fighter.position.y += fighter.velocity.y * gameTime.elapsedGameTime;

}

@end
