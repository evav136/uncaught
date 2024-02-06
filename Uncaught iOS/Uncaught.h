//
//  Uncaught.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 03/11/2023.
//

#import <UIKit/UIKit.h>
#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Input.Touch.h"
#import "Retronator.Uncaught.h"
#import "GameState.h"

NS_ASSUME_NONNULL_BEGIN

@interface Uncaught : Game {
    GraphicsDeviceManager *graphics;
    
    NSMutableArray *stateStack;
    
    BOOL soundOn, musicOn;
    
    Class levelClasses[LevelTypes];

}

@property (nonatomic, assign)BOOL soundOn;
@property (nonatomic, assign)BOOL musicOn;

// Dodajata in odstranjujeta stanje -> aktivno je zgornje stanje
- (void) pushState:(GameState*)gameState;
- (void) popState;
- (void) saveSettings;
- (void) loadSettings;

- (Class) getLevelClass:(LevelType)type;

// - (void) loadMultiplayerLevel:(Class) levelClass;


@end

NS_ASSUME_NONNULL_END
