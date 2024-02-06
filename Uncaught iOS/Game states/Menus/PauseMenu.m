//
//  PauseMenu.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/12/2023.
//

#import "PauseMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Uncaught.h"


@implementation PauseMenu

// @synthesize exited;

- (void) initialize {
    [super initialize];
    
    NSLog(@"pause created");
    
    // exited = NO;
            
    // Background
    Texture2D *bgTexture = [[self.game.content load:@"icons"] autorelease];
    menuBg = [[Image alloc] initWithTexture:bgTexture position:[Vector2 vectorWithX:-60 y:-130]];
    menuBg.sourceRectangle = [[Rectangle alloc] initWithX:664 y:1336 width:1100 height:750];
    [menuBg setScaleUniform: 2.5];
    [scene addItem:menuBg];
    
    // Text
    title = [[Label alloc] initWithFont:retrotype text:@"Pause" position:[Vector2 vectorWithX:1300 y:100]];
    title.horizontalAlign = HorizontalAlignCenter;
    [title setScaleUniform:5];
    [scene addItem:title];
    
    // Buttons
    cont = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1110 y:330 width:216 height:128]
                                                background:buttonBackground
                                                      font:retrotype
                                                      text:@"Play on"
                                                sourceRect:sourceRectangle];
    [cont.backgroundImage setScaleUniform:2];
    [scene addItem:cont];
    
    exit = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1110 y:530 width:216 height:128]
                                               background:buttonBackground
                                                     font:retrotype
                                                     text:@"  Exit"
                                               sourceRect:sourceRectangle];
    [exit.backgroundImage setScaleUniform:2];
    [scene addItem:exit];    
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    if (cont.wasReleased) {
        // return back to the game
        
        if (uncaught.soundOn) {
            [SoundEngine play:SoundEffectTypeButton];
        }
        
        [uncaught popState];
    
    } else if (exit.wasReleased) {
        
        if (uncaught.soundOn) {
            [SoundEngine play:SoundEffectTypeButton];
        }
        
        [uncaught popState];
    }
}

- (void) dealloc
{
    [menuBg release];
    [title release];
    [cont release];
    [exit release];
    
    [super dealloc];
}

@end
