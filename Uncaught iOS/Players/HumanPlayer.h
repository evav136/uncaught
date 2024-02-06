//
//  HumanPlayer.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 01/12/2023.
//

#import "Player.h"
#import "Retronator.Uncaught.h"
#import "Button.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HumanPlayer : Player {
    Button *jump;
    Button *left;
    Button *right;
    
    Game *theGameH;
    
    Button *pause;
    BOOL caught;
}

- (id)initWithGame:(id)theGame Fighter:(Fighter *)theFighter;


@end

NS_ASSUME_NONNULL_END
