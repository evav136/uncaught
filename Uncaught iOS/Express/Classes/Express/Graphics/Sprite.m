//
//  Sprite.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 25/11/2023.
//

#import "Sprite.h"
#import <Foundation/Foundation.h>
#import "Retronator.Uncaught.classes.h"

@implementation Sprite

@synthesize texture;
@synthesize sourceRectangle;
@synthesize origin;

- (void) dealloc
{
    [texture release];
    [sourceRectangle release];
    [origin release];
    [super dealloc];
}

@end
