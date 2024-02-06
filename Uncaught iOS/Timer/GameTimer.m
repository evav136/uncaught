//
//  GameTimer.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 27/01/2024.
//

#import "GameTimer.h"
#import "Retronator.Uncaught.h"

@implementation GameTimer {
    NSTimer *timer;
    NSTimeInterval pausedTimeRemaining;
}

@synthesize paused, outOfTime, remainingTime;

- (instancetype)initWithTime:(NSTimeInterval)time {
    self = [super init];
    if (self) {
        
        outOfTime = NO;
        remainingTime = time; // Start with 20 seconds
        paused = NO;
    }
    return self;
}

- (void)startTimer {
    
    if (!timer) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        paused = NO;
    }
}

- (void)pauseTimer {
    if (!self.isPaused) {
        [self stopTimer];
        pausedTimeRemaining = remainingTime;
    }
}

- (void)resumeTimer {
    if (pausedTimeRemaining > 0) {
        remainingTime = pausedTimeRemaining;
        [self startTimer];
        }
}

- (void)addTime:(NSTimeInterval)timeToAdd {
    if (!self.paused) {
        remainingTime += timeToAdd;
    }
}

- (void)updateTimer {
    if (!self.isPaused && remainingTime > 0) {

        remainingTime -= 1;
        
        if (remainingTime == 0) {
            outOfTime = YES;
            [self stopTimer];
        }
    }
}

- (void)stopTimer {
    [timer invalidate];
    timer = nil;
    paused = YES;
}

- (void) dealloc {
    [self stopTimer];
    // [timer release];
    [super dealloc];
}

@end
