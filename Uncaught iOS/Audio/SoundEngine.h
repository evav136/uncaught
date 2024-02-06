//
//  SoundEngine.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 06/01/2024.
//

#import <Foundation/Foundation.h>

#import "GameComponent.h"
#import "Retronator.Xni.Framework.Audio.h"
#import "Retronator.Uncaught.classes.h"
#import "SoundEffectType.h"

NS_ASSUME_NONNULL_BEGIN

@interface SoundEngine : GameComponent {
    SoundEffect *soundEffects[SoundEffectTypes];
}

+ (void) initializeWithGame:(Game*)game;
+ (void) play:(SoundEffectType)type;
+ (void) play:(SoundEffectType)type withPan:(float)pan;

@end

NS_ASSUME_NONNULL_END
