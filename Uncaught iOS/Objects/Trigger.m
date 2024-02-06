//
//  Trigger.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 04/02/2024.
//

#import "Trigger.h"
#import "Retronator.Uncaught.h"

@implementation Trigger

- (id) init
{
    self = [super init];
    if (self != nil) {
        
        boundingBox = CGRectMake(0, 0, 20, 100);
        position = [[Vector2 alloc] init];
        triggered = NO;
        trigg = NO;
    }
    return self;
}

- (void) triggeredByFighter:(Fighter *)player {
    CGRect playerBoundingBox = CGRectMake(player.position.x - (player.boundingBox.size.width / 2), player.position.y - (player.boundingBox.size.height / 2), player.boundingBox.size.width, player.boundingBox.size.height);
    CGRect triggerBoundingBox = CGRectMake(position.x - (boundingBox.size.width / 2), 830 - (boundingBox.size.height / 2), boundingBox.size.width, boundingBox.size.height);

    if (CGRectIntersectsRect(playerBoundingBox, triggerBoundingBox)) {
        triggered = YES;
    } else {
        triggered = NO;
    }
}


@synthesize position, triggered, boundingBox, trigg;

@end
