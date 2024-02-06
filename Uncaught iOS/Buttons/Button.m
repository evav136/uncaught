//
//  Button.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 17/12/2023.
//

#import "Button.h"

@implementation Button 

@synthesize isTouched, button, position;

- (id)initWithX:(int)x y:(int)y width:(int)width height:(int)height {
    self = [super initWithX:x y:y width:width height:height];
    if (self) {
        isTouched = NO;
    }
    return self;
}

- (BOOL)buttonTouchedX:(int)x y:(int)y
{
    return [self containsX:x y:y];
}


@end
