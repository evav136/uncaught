//
//  LevelsMenu.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 30/01/2024.
//

#import "LevelsMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Uncaught.h"

@implementation LevelsMenu

- (void) initialize {
    [super initialize];
                
    // Background
    Texture2D *bgTexture = [[self.game.content load:@"icons"] autorelease];
    menuBg = [[Image alloc] initWithTexture:bgTexture position:[Vector2 vectorWithX:-70 y:-100]];
    menuBg.sourceRectangle = [[Rectangle alloc] initWithX:664 y:1336 width:1100 height:750];
    [menuBg setScaleUniform: 2.5];
    [scene addItem:menuBg];
    
    // Text
    title = [[Label alloc] initWithFont:retrotype text:@"Choose a room" position:[Vector2 vectorWithX:1300 y:120]];
    title.horizontalAlign = HorizontalAlignCenter;
    [title setScaleUniform:5];
    [scene addItem:title];
    
    // Buttons
    level1 = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:895 y:470 width:120 height:120] background:bgTexture font:nil text:nil sourceRect:[Rectangle rectangleWithX:1085 y:472 width:160 height:160]];
    
    [level1.backgroundImage setScaleUniform:1.1];
    [scene addItem:level1];
    
    level2 = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1200 y:470 width:120 height:120] background:bgTexture font:nil text:nil sourceRect:[Rectangle rectangleWithX:1245 y:472 width:160 height:160]];
    
    [level2.backgroundImage setScaleUniform:1.1];
    [scene addItem:level2];
    
    level3 = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1500 y:470 width:120 height:120] background:bgTexture font:nil text:nil sourceRect:[Rectangle rectangleWithX:1405 y:472 width:160 height:160]];
    
    [level3.backgroundImage setScaleUniform:1.1];
    [scene addItem:level3];
    
    exit = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1100 y:800 width:216 height:128]
                                               background:buttonBackground
                                                     font:retrotype
                                                     text:@"  Back"
                                               sourceRect:sourceRectangle];
    [exit.backgroundImage setScaleUniform:2];
    [scene addItem:exit];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    GameState *newState = nil;
    
    if (level1.wasReleased) {
        if (uncaught.soundOn) {
            [SoundEngine play:SoundEffectTypeButton];
        }
        
        Class levelClass = [uncaught getLevelClass:LevelTypeLevel1];

        newState = [[[GamePlay alloc] initSinglePlayerWithGame:self.game levelClass:levelClass] autorelease];
        
    } else if (level2.wasReleased) {
        if (uncaught.soundOn) {
            [SoundEngine play:SoundEffectTypeButton];
        }
        
        Class levelClass = [uncaught getLevelClass:LevelTypeLevel2];

        newState = [[[GamePlay alloc] initSinglePlayerWithGame:self.game levelClass:levelClass] autorelease];
                
    } else if (level3.wasReleased) {
        if (uncaught.soundOn) {
            [SoundEngine play:SoundEffectTypeButton];
        }
        
        Class levelClass = [uncaught getLevelClass:LevelTypeLevel2];

        newState = [[[GamePlay alloc] initSinglePlayerWithGame:self.game levelClass:levelClass] autorelease];
                
    } else if (exit.wasReleased) {
        [uncaught popState];
    }
    
    if (newState) {
        [uncaught pushState:newState];
    }
}

- (void) dealloc
{
    [menuBg release];
    
    [title release];
    
    [level1 release];
    [level2 release];
    [level3 release];
    [exit release];
        
    [super dealloc];
}

@end
