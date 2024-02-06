//
//  Laser.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 30/01/2024.
//

#import <Foundation/Foundation.h>
#import "Retronator.Uncaught.classes.h"
#import "Retronator.Xni.Framework.h"
#import "IPosition.h"


NS_ASSUME_NONNULL_BEGIN

@interface Laser : NSObject <IPosition> {
    Vector2 *position;
    float width;
    float height;
    
    CGRect boundingBox;
    
    Trigger *trigger;
    
    // Laser state
    BOOL on;
}

@property (nonatomic, assign) CGRect boundingBox;
@property (nonatomic, assign) BOOL on;
@property (nonatomic, assign) Trigger *trigger;

- (void) turnOn;
- (void) turnOff;
- (void) restartTrigger;

- (BOOL) collidesWithPlayer:(Fighter *)player;

@end

NS_ASSUME_NONNULL_END
