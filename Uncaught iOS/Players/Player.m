//
//  Player.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 01/12/2023.
//

#import "Player.h"
#import "Retronator.Uncaught.h"

@implementation Player

@synthesize paused;

- (id) initWithGame:(Game *)theGame Fighter:(Fighter *)theFighter
{
    self = [super initWithGame:theGame];
    if (self != nil) {
        fighter = theFighter;
    }
    return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {}

- (void) movePlayerLeft {
    fighter.position.x -= 15;
}

- (void) movePlayerRight {
    fighter.position.x += 15;
}

- (void) reset {}

@end
