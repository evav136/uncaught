//
//  HumanPlayer.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 01/12/2023.
//

#import "HumanPlayer.h"
#import "Rectangle.h"
#import "Retronator.Xni.Framework.Input.Touch.h"
#import "Retronator.Uncaught.h"
#import "Fighter.h"
#import "Menu.h"


@implementation HumanPlayer


- (id) initWithGame:(Game *)theGame Fighter:(Fighter *)theFighter
{
    self = [super initWithGame:theGame Fighter:theFighter];
    
    if (self != nil) {
        theGameH = theGame;
        
        // areas
//        jump = [[Button alloc] initWithX:2250 y:1020 width:100 height:100];
//        jump.position = [Vector2 vectorWithX:2300 y:1070];;
        
        right = [[Button alloc] initWithX:2250 y:1020 width:100 height:100];
        right.position = [Vector2 vectorWithX:2300 y:1070];;
        
        left = [[Button alloc] initWithX:200 y:1020 width:100 height:100];
        left.position = [Vector2 vectorWithX:250 y:1070];
        
//        right = [[Button alloc] initWithX:550 y:1020 width:100 height:100];
//        right.position = [Vector2 vectorWithX:600 y:1070];
        
        caught = NO;
                
    }
    return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    TouchCollection *touches = [[TouchPanel getInstance] getState];
    fighter.isMoving = fighter.movingBack = NO;
        
    for (TouchLocation *touch in touches) {
        if ([left buttonTouchedX:touch.position.x y:touch.position.y]) {
            // Move the player left
            
            fighter.isMoving = fighter.movingBack = YES;
            [self movePlayerLeft];
            
        } else if ([right buttonTouchedX:touch.position.x y:touch.position.y]) {
            // Move the player right
            
            fighter.isMoving = YES;
            [self movePlayerRight];
            
        }
        
//        else if ([jump buttonTouchedX:touch.position.x y:touch.position.y]) {
//            
//            fighter.isMoving = YES;
//            NSLog(@"Jump hihi");
//        }
    }
}

- (void) dealloc
{
    [jump release];
    [left release];
    [right release];
    [super dealloc];
}

@end
