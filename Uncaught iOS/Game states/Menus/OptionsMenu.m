//
//  OptionsMenu.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 14/01/2024.
//

#import "OptionsMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Uncaught.h"

@implementation OptionsMenu

- (void) initialize {
    [super initialize];
                
    // Background
    Texture2D *bgTexture = [[self.game.content load:@"icons"] autorelease];
    menuBg = [[Image alloc] initWithTexture:bgTexture position:[Vector2 vectorWithX:-70 y:-100]];
    menuBg.sourceRectangle = [[Rectangle alloc] initWithX:664 y:1336 width:1100 height:750];
    [menuBg setScaleUniform: 2.5];
    [scene addItem:menuBg];
    
    // Text
    title = [[Label alloc] initWithFont:retrotype text:@"Options" position:[Vector2 vectorWithX:1300 y:120]];
    title.horizontalAlign = HorizontalAlignCenter;
    [title setScaleUniform:5];
    [scene addItem:title];
    
    turnOffSound = [[Label alloc] initWithFont:retrotype text:@"Turn off sound" position:[Vector2 vectorWithX:1150 y:450]];
    turnOffSound.horizontalAlign = HorizontalAlignCenter;
    turnOffSound.color = [Color colorWithRed:62 green:7 blue:99];

    [turnOffSound setScaleUniform:3];
    [scene addItem:turnOffSound];
    
    turnOffMusic = [[Label alloc] initWithFont:retrotype text:@"Turn off music" position:[Vector2 vectorWithX:1150 y:600]];
    turnOffMusic.horizontalAlign = HorizontalAlignCenter;
    turnOffMusic.color = [Color colorWithRed:62 green:7 blue:99];

    [turnOffMusic setScaleUniform:3];
    [scene addItem:turnOffMusic];
    
    // Buttons
    soundOff = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1450 y:410 width:60 height:60] background:bgTexture font:nil text:nil sourceRect:[Rectangle rectangleWithX:1104 y:0 width:100 height:80]];
    [soundOff.backgroundImage setScaleUniform:1];
    
    musicOff = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1450 y:560 width:60 height:60] background:bgTexture font:nil text:nil sourceRect:[Rectangle rectangleWithX:1296 y:0 width:85 height:80]];
    [musicOff.backgroundImage setScaleUniform:1];
    
    soundOn = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1450 y:410 width:60 height:60] background:bgTexture font:nil text:nil sourceRect:[Rectangle rectangleWithX:1200 y:0 width:100 height:80]];
    [soundOn.backgroundImage setScaleUniform:1];
    
    musicOn = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1450 y:560 width:60 height:60] background:bgTexture font:nil text:nil sourceRect:[Rectangle rectangleWithX:1376 y:0 width:85 height:80]];
    [musicOn.backgroundImage setScaleUniform:1];
    
    exit = [[ButtonButton alloc] initWithInputArea:[Rectangle rectangleWithX:1100 y:800 width:216 height:128]
                                               background:buttonBackground
                                                     font:retrotype
                                                     text:@"  Back"
                                               sourceRect:sourceRectangle];
    [exit.backgroundImage setScaleUniform:2];
    [scene addItem:exit];
    
    [self addSoundButton];
    [self addMusicButton];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
    
    if (soundOff.wasReleased) {
        if (uncaught.soundOn) {
            [SoundEngine play:SoundEffectTypeButton];
        }
        
        uncaught.soundOn = NO;

        [uncaught saveSettings];
        
        [scene removeItem:soundOff];
        [scene addItem:soundOn];
        
        // These buttons have to be set to NO, because they don't switch states.
        soundOff.wasReleased = NO;
    
    }

    if (soundOn.wasReleased) {
        if (uncaught.soundOn) {
            
            [SoundEngine play:SoundEffectTypeButton];
        }
        
        uncaught.soundOn = YES;
        
        [uncaught saveSettings];
        
        [scene removeItem:soundOn];
        [scene addItem:soundOff];
        
        soundOn.wasReleased = NO;
    }
        
    if (musicOff.wasReleased) {
        if (uncaught.soundOn) {
            [SoundEngine play:SoundEffectTypeButton];
        }
        
        uncaught.musicOn = NO;;
        [uncaught saveSettings];
        
        [scene removeItem:musicOff];
        [scene addItem:musicOn];
        
        musicOff.wasReleased = NO;
    }
    
    if (musicOn.wasReleased) {
        if (uncaught.soundOn) {
            [SoundEngine play:SoundEffectTypeButton];
        }
        
        uncaught.musicOn = YES;
        [uncaught saveSettings];
        
        [scene removeItem:musicOn];
        [scene addItem:musicOff];
        
        musicOn.wasReleased = NO;
    }
    
    
    if (exit.wasReleased) {
        if (uncaught.soundOn) {
            [SoundEngine play:SoundEffectTypeButton];
        }
        [uncaught popState];
    
    }
    
    [uncaught loadSettings];
}

- (void) addSoundButton {
    if (uncaught.soundOn) {
        [scene addItem:soundOff];
    } else {
        [scene addItem:soundOn];
    }
}

- (void) addMusicButton {
    if (uncaught.musicOn) {
        [scene addItem:musicOff];
    } else {
        [scene addItem:musicOn];
    }
}

- (void) dealloc
{
    [menuBg release];
    
    [title release];
    [turnOffSound release];
    [turnOffMusic release];
    
    [soundOn release];
    [soundOff release];
    [musicOn release];
    [musicOff release];
    
    [exit release];
    
    [super dealloc];
}

@end
