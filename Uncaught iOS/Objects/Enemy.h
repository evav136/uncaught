//
//  Enemy.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/11/2023.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.h"
#import "IPosition.h"

NS_ASSUME_NONNULL_BEGIN

@interface Enemy : NSObject <IPosition> {
    Vector2 *position;
    BOOL facingBack;
    BOOL faster;
    BOOL stopped;
}

@property (nonatomic, retain) Vector2 *position;
@property (nonatomic, assign) NSTimeInterval watchingTime;
@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, assign) BOOL facingBack;
@property (nonatomic, assign) BOOL faster;


- (void)startRandomTurning;
- (void)stopTurning;

@end

NS_ASSUME_NONNULL_END
