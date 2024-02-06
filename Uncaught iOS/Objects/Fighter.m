//
//  Fighter.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 01/12/2023.
//

#import "Fighter.h"

@implementation Fighter

- (id) init
{
    self = [super init];
    if (self != nil) {
        position = [[Vector2 alloc] init];
        velocity = [[Vector2 alloc] init];
        boundingBox = CGRectMake(0, 0, 120, 120);
        mass = 2;
        pickedCoins = 0;
        
    }
    return self;
}

@synthesize position, velocity, mass, boundingBox, isMoving, movingBack, pickedCoins;

- (void) dealloc
{
    [velocity release];
    [position release];
    [super dealloc];
}

@end
