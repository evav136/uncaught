//
//  Sprite.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 25/11/2023.
//

#import <Foundation/Foundation.h>
#import "Retronator.Uncaught.classes.h"
#import "Retronator.Xni.Framework.h"

/**
 Represents a part of an image, usually a sprite on a sprite sheet.
 */
@interface Sprite : NSObject {
    Texture2D *texture;
    Rectangle *sourceRectangle;
    Vector2 *origin;
}

/**
 Which texture to use for drawing this sprite.
 */
@property (nonatomic, retain) Texture2D *texture;
 
/**
 The part of the texture that holds the desired sprite.
 */
@property (nonatomic, retain) Rectangle *sourceRectangle;

/**
 What is the reference point within the source rectangle, relative to which the sprite is positioned.
 */
@property (nonatomic, retain) Vector2 *origin;

@end
