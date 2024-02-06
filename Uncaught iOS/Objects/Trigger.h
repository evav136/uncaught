//
//  Trigger.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 04/02/2024.
//

#import <Foundation/Foundation.h>
#import "Retronator.Uncaught.classes.h"
#import "Retronator.Xni.Framework.h"
#import "IPosition.h"

NS_ASSUME_NONNULL_BEGIN

@interface Trigger : NSObject <IPosition> {
    Vector2 *position;
    BOOL triggered;
    BOOL trigg;
    
    CGRect boundingBox;
}

@property (nonatomic, assign) BOOL triggered;
@property (nonatomic, assign) BOOL trigg;
@property (nonatomic, assign) CGRect boundingBox;

- (void) triggeredByFighter:(Fighter *)player;


@end

NS_ASSUME_NONNULL_END

// Runaway
