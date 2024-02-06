//
//  Level2.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 03/02/2024.
//

#import "Retronator.Uncaught.h"

@implementation Level2

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
        Laser *laser;
        
        laser = [[[Laser alloc] init] autorelease];
        laser.position.x = 600;
        laser.position.y = 473;
        [scene addItem:laser];
        
        laser.trigger.position.x = 500;
        laser.trigger.position.y = 940;
        
        [scene addItem:laser.trigger];
        
        laser = [[[Laser alloc] init] autorelease];
        laser.position.x = 1600;
        laser.position.y = 473;
        [scene addItem:laser];
        
        laser.trigger.position.x = 1500;
        laser.trigger.position.y = 940;
        [scene addItem:laser.trigger];
    }
    
    return self;
}

@end
