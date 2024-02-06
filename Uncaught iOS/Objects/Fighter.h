//
//  Fighter.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 01/12/2023.
//

#import <Foundation/Foundation.h>
#import "Retronator.Uncaught.classes.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "IPosition.h"


NS_ASSUME_NONNULL_BEGIN

@interface Fighter : NSObject <IPosition> {
    Vector2 *position;
    Vector2 *velocity;
    
    CGRect boundingBox;
    float mass;
    
    BOOL isMoving;
    BOOL movingBack;
    
    int pickedCoins;
}

@property (nonatomic, retain) Vector2 *position;
@property (nonatomic, strong) Vector2 *velocity;
@property (nonatomic) CGRect boundingBox;
@property (nonatomic, assign) float mass;
@property (nonatomic, assign) BOOL isMoving;
@property (nonatomic, assign) BOOL movingBack;
@property (nonatomic, assign) int pickedCoins;

@end

NS_ASSUME_NONNULL_END
