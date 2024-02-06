//
//  Level1.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/11/2023.
//

#import "Retronator.Uncaught.h"

@implementation Level1

- (id) initWithGame:(Game *)theGame
{
    self = [super initWithGame:theGame];
    if (self != nil) {
        // Spawn points
        fighterSpawn.x = 275;
        fighterSpawn.y = 830;
        
        enemySpawn.x = 2300;
        enemySpawn.y = 830;
        
        // add extra scene objects
    }
    
    return self;
}

@end
