//
//  GameTimer.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 27/01/2024.
//

#import "GameComponent.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameTimer : GameComponent {
    NSTimeInterval remainingTime;
    BOOL paused;
    BOOL outOfTime;
}

@property (nonatomic, assign) NSTimeInterval remainingTime;
@property (nonatomic, getter=isPaused) BOOL paused;
@property (nonatomic, assign) BOOL outOfTime;

- (instancetype)initWithTime:(NSTimeInterval)time;
- (void)startTimer;
- (void)stopTimer;
- (void)pauseTimer;
- (void)resumeTimer;
- (void)addTime:(NSTimeInterval)timeToAdd;

@end

NS_ASSUME_NONNULL_END
