//
//  GameState.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/12/2023.
//

#import "GameState.h"
#import "Retronator.Uncaught.h"

@implementation GameState

- (id)initWithGame:(Game *)theGame {
    self = [super initWithGame:theGame];
    
    if (self != nil) {
        
        // Preko te spremenljivke dostopamo do igre 
        uncaught = (Uncaught *)self.game;
    }
    
    return self;
}

- (void)activate {}

- (void)deactivate {}

@end
