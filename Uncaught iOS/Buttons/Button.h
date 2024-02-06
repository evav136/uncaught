//
//  Button.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 17/12/2023.
//

#import "Rectangle.h"
#import "IPosition.h"

NS_ASSUME_NONNULL_BEGIN

@interface Button : Rectangle <IPosition> {
    BOOL isTouched;
    Vector2 *position;
    
    Rectangle *button;
    int *buttons;
}

@property (nonatomic, assign) BOOL isTouched;
@property (nonatomic, assign) Rectangle *button;

- (BOOL) buttonTouchedX:(int)x y:(int)y;

@end

NS_ASSUME_NONNULL_END
