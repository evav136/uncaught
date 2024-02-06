//
//  Enemy.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/11/2023.
//

#import "Enemy.h"
#import "Retronator.Uncaught.h"


@implementation Enemy {
    NSTimer *turnTimer;
}

- (id) init
{
    self = [super init];
    if (self != nil) {
        position = [[Vector2 alloc] init];
        facingBack = NO;
        faster = NO;
        stopped = NO;
        [self startRandomTurning];
    }
    return self;
}

- (void)startRandomTurning {
    if (!stopped) {
        [self stopTurning];

        NSTimeInterval delay = [self randomInterval];

        // Use GCD to execute the turnAround method after the specified delay
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self turnAround];
        });
    }
}

- (void)stopTurning {
    [turnTimer invalidate];
    turnTimer = nil;
}

- (NSTimeInterval)randomInterval {
    //Generate a random interval.
    if (!faster) {
        if (facingBack) {
            watchingTime = 2.0 + (arc4random_uniform(3) * 1.0);
            
        } else {
            watchingTime = 3.0 + (arc4random_uniform(5) * 1.0);
        }
    } else {
        if (facingBack) {
            watchingTime = 2.0 + (arc4random_uniform(3) * 1.0);
            
        } else {
            watchingTime = 3.0 + (arc4random_uniform(4) * 1.0);
        }
    }
    
    return watchingTime;
}

- (void)turnAround {
    [SoundEngine play:SoundEffectTypeTurn];
    facingBack = !facingBack;
    
    // After turning, start the process again
    [self startRandomTurning];
}

@synthesize position, facingBack, watchingTime, delay, faster;

- (void) dealloc
{
    // NSLog(@"enemy deallocated");
    [self stopTurning];
    [position release];
    [super dealloc];
}

@end
