//
//  Coin.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 09/12/2023.
//

#import <Foundation/Foundation.h>
#import "Retronator.Uncaught.classes.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "IPosition.h"

NS_ASSUME_NONNULL_BEGIN

@interface Coin : NSObject <IPosition> {
    Vector2 *position;
    BOOL collected;
    CGRect boundingBox;
    // NSArray *collection;
}

@property (nonatomic, retain) Vector2 *position;
@property (nonatomic) BOOL collected;
@property (nonatomic, assign) CGRect boundingBox;
// @property (nonatomic, assign) NSArray *collection;

- (BOOL)collidesWithPlayer:(Fighter *)player;
- (void)collectedByPlayer:(id)player;
- (int)getRandomXPosition;

@end

NS_ASSUME_NONNULL_END
