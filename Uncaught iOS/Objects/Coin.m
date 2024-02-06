//
//  Coin.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 09/12/2023.
//

#import "Coin.h"
#import "Retronator.Uncaught.h"

@implementation Coin

- (id)init {
    self = [super init];
    if (self) {
        position = [[Vector2 alloc] init];
        collected = NO;
        boundingBox = CGRectMake(0, 0, 50, 50);
    }
    return self;
}

- (BOOL)collidesWithPlayer:(Fighter *)player {
    if (!collected) {
        
        // Check for collision only if the coin is not already collected
        CGRect playerBoundingBox = CGRectMake(player.position.x - (player.boundingBox.size.width / 2), player.position.y - (player.boundingBox.size.height / 2), player.boundingBox.size.width, player.boundingBox.size.height);
        CGRect coinBoundingBox = CGRectMake(position.x - (boundingBox.size.width / 2), position.y - (boundingBox.size.height / 2), boundingBox.size.width, boundingBox.size.height);

        return CGRectIntersectsRect(playerBoundingBox, coinBoundingBox);
    }

    return NO;
}

- (void)collectedByPlayer:(id)player {
    collected = YES;
}

- (int)getRandomXPosition {
    int randomXPosition = arc4random_uniform(1880) + 320;
        
    return randomXPosition;
}

@synthesize position, collected, boundingBox;

- (void)dealloc {
    [position release];
    [super dealloc];
}

@end
