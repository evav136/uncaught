//
//  GameLost.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 03/02/2024.
//

#import "GameLost.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Uncaught.h"

@implementation GameLost

- (void) initialize {
    [super initialize];
                
    // Background
    Texture2D *bgTexture = [[self.game.content load:@"endscreens"] autorelease];
    menuBg = [[Image alloc] initWithTexture:bgTexture position:[Vector2 vectorWithX:-70 y:-100]];
    menuBg.sourceRectangle = [[Rectangle alloc] initWithX:360 y:1080 width:1100 height:750];
    [menuBg setScaleUniform: 2.5];
    [scene addItem:menuBg];
    
    // 1080
    
    // Button
    exit = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1100 y:800 width:216 height:128]
                                               background:buttonBackground
                                                     font:retrotype
                                                     text:@"  Exit"
                                               sourceRect:sourceRectangle];
    [exit.backgroundImage setScaleUniform:2];
    [scene addItem:exit];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    if (exit.wasReleased) {
        [uncaught popState];
    }
}

@end
