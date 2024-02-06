//
//  SoundEngine.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 06/01/2024.
//

#import "SoundEngine.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Uncaught.h"
#import "Artificial.Control.h"
#import "Game.h"

SoundEngine *instance;

@implementation SoundEngine

+ (void) initializeWithGame:(Game*)game {
    instance = [[SoundEngine alloc] initWithGame:game];
    [game.components addComponent:instance];
    
}

- (void) initialize {
    soundEffects[SoundEffectTypePoint] = [self.game.content load:@"zapsplat_point"];
    soundEffects[SoundEffectTypeTurn] = [self.game.content load:@"zapsplat_turn"];
    soundEffects[SoundEffectTypeButton] = [self.game.content load:@"zapsplat_click"];
    
    // soundEffects[SoundEffectTypeLose] = [self.game.content load:@"Lose"];
    // soundEffects[SoundEffectTypeWin] = [self.game.content load:@"Win"];
    
}

- (void) play:(SoundEffectType)type withPan:(float)pan {
    
    SoundEffect *effect = soundEffects[type];
        if (effect) {
            // NSLog(@"Playing sound.");
            [effect playWithVolume:1 pitch:0 pan:pan];
        } else {
            NSLog(@"Sound effect for type %d is nil", type);
        }
    
}

+ (void) play:(SoundEffectType)type {
    
    [instance play:type withPan:0];
}

+ (void) play:(SoundEffectType)type withPan:(float)pan {
    [instance play:type withPan:pan];
    
}

- (void) dealloc
{
    for (int i = 0; i < SoundEffectTypes; i++) {
        [soundEffects[i] release];
    }
    [super dealloc];
}

@end
