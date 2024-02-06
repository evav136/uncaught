//
//  MainMenu.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 31/12/2023.
//

#import "MainMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Uncaught.h"

@implementation MainMenu

- (void) initialize {
    [super initialize];
        
    // Background
    Texture2D *bgTexture = [[self.game.content load:@"icons"] autorelease];
    menuBg = [[Image alloc] initWithTexture:bgTexture position:[Vector2 vectorWithX:-70 y:-100]];
    menuBg.sourceRectangle = [[Rectangle alloc] initWithX:664 y:1336 width:1100 height:750];
    [menuBg setScaleUniform: 2.5];
    [scene addItem:menuBg];
    
    // Text
    title = [[Label alloc] initWithFont:retrotype text:@"Uncaught" position:[Vector2 vectorWithX:1290 y:120]];
    title.horizontalAlign = HorizontalAlignCenter;
    [title setScaleUniform:5];
    [scene addItem:title];
    
//    highScore = [[Label alloc] initWithFont:retrotype text:@"High Score: " position:[Vector2 vectorWithX:1190 y:400]];
//    highScore.horizontalAlign = HorizontalAlignCenter;
//    highScore.color = [Color colorWithRed:62 green:7 blue:99];
//    [highScore setScaleUniform:3.5];
//    [scene addItem:highScore];
    
    subtitle = [[Label alloc] initWithFont:retrotype text:@"by Eva Vidic" position:[Vector2 vectorWithX:1290 y:1070]];
    subtitle.horizontalAlign = HorizontalAlignCenter;
    [subtitle setScaleUniform:2.2];
    [scene addItem:subtitle];
    
    // Buttons
    singleplayer = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1100 y:530 width:216 height:128]
                                                background:buttonBackground
                                                      font:retrotype
                                                      text:@"  Play"
                                                sourceRect:sourceRectangle];
    [singleplayer.backgroundImage setScaleUniform:2];
    [scene addItem:singleplayer];
    
    options = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1100 y:750 width:236 height:128]
                                           background:buttonBackground
                                                 font:retrotype
                                                 text:@"Options"
                                           sourceRect:sourceRectangle];
    [options.backgroundImage setScaleUniform:2];
    options.label.origin = [Vector2 vectorWithX:5 y:6];
    [scene addItem:options];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    GameState *newState = nil;
    
    if (singleplayer.wasReleased) {
        if (uncaught.soundOn) {
            [SoundEngine play:SoundEffectTypeButton];
        }
        
        newState = [[[LevelsMenu alloc] initWithGame:self.game] autorelease];
    } else if (options.wasReleased) {
        if (uncaught.soundOn) {
            [SoundEngine play:SoundEffectTypeButton];
        }
        
        newState = [[[OptionsMenu alloc] initWithGame:self.game] autorelease];
    }
    
    if (newState) {
        [uncaught pushState:newState];
    }
}

- (void) dealloc
{
    
    [menuBg release];
    
    [title release];
    [highScore release];
    [subtitle release];
    
    [singleplayer release];
    [options release];
    
    [super dealloc];
}

@end
