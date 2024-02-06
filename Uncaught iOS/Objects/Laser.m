//
//  Laser.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 30/01/2024.
//

#import "Laser.h"
#import "Retronator.Uncaught.h"

@implementation Laser

- (id) init
{
    self = [super init];
    if (self != nil) {
        position = [[Vector2 alloc] init];
        on = NO;
        boundingBox = CGRectMake(0, 0, 50, 1000);
        
        trigger = [[Trigger alloc] init];
    }
    return self;
}

- (void)turnOn {
    if (!on && trigger.triggered && !trigger.trigg) {
        int randomValue = arc4random_uniform(2);
        if (randomValue == 0) {
            trigger.trigg = YES;
            on = YES;
            [self performSelector:@selector(turnOff) withObject:nil afterDelay:2.0];
        }
        [self performSelector:@selector(restartTrigger) withObject:nil afterDelay:5.0];
    }
}

- (void) turnOff {
    on = NO;
}

- (void) restartTrigger {
    trigger.trigg = NO;
}

- (BOOL)collidesWithPlayer:(Fighter *)player {
    if (on) {
        CGRect playerBoundingBox = CGRectMake(player.position.x - (player.boundingBox.size.width / 2), player.position.y - (player.boundingBox.size.height / 2), player.boundingBox.size.width, player.boundingBox.size.height);
        CGRect laserBoundingBox = CGRectMake(position.x - (boundingBox.size.width / 2), position.y - (boundingBox.size.height / 2), boundingBox.size.width, boundingBox.size.height);

        return CGRectIntersectsRect(playerBoundingBox, laserBoundingBox);
    } else {
        return NO;
    }
}

@synthesize position, boundingBox, on, trigger;

- (void) dealloc
{
    [position release];
    [trigger release];
    [super dealloc];
}

@end
