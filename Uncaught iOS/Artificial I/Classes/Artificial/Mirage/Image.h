//
//  Image.h
//  Artificial I
//
//  Created by Matej Jan on 21.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Uncaught.classes.h"
#import "Retronator.Xni.Framework.h"
#import "MirageEnums.h"

@interface Image : NSObject {
	Texture2D *texture;
	Rectangle *sourceRectangle;
	
	Color *color;
	
	Vector2 *position;
	Vector2 *origin;
	Vector2 *scale;
	
	float rotation;
	float layerDepth;
}

- (id) initWithTexture:(Texture2D*)theTexture position:(Vector2*)thePosition;

@property (nonatomic, retain) Texture2D *texture;
@property (nonatomic, retain) Rectangle *sourceRectangle;

@property (nonatomic, retain) Color *color;

@property (nonatomic, retain) Vector2 *position;
@property (nonatomic, retain) Vector2 *origin;
@property (nonatomic, retain) Vector2 *scale;

@property (nonatomic) float rotation;
@property (nonatomic) float layerDepth;

- (void) setScaleUniform:(float)value;

@end
