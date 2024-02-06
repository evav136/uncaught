//
//  Uncaught.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 03/11/2023.
//

#import "Uncaught.h"
#import "Retronator.Xni.Framework.Input.Touch.h"
#import "Retronator.Uncaught.h"
#import "Artificial.Control.h"

@implementation Uncaught

@synthesize soundOn, musicOn;

- (id) init {
    
    if (self = [super init]) {
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
        // [self initialize];
    
        [self.components addComponent:[[[TouchPanelHelper alloc] initWithGame:self] autorelease]];
        
        stateStack = [[NSMutableArray alloc] init];
        
        [SoundEngine initializeWithGame:self];
    }
    
    return self;
}


- (void) initialize {
    levelClasses[LevelTypeLevel1] = [Level1 class];
    levelClasses[LevelTypeLevel2] = [Level2 class];
    
    // Start in main menu.
    MainMenu *mainMenu = [[[MainMenu alloc] initWithGame:self] autorelease];
    [self pushState:mainMenu];
    [self loadSettings];
    
    // initialize all components
    [super initialize];
}


- (void) pushState:(GameState *)gameState {
    
    GameState *currentActiveState = [stateStack lastObject];
    [currentActiveState deactivate];
    [self.components removeComponent:currentActiveState];
    
    [stateStack addObject:gameState];
    [self.components addComponent:gameState];
    [gameState activate];
}


- (void) popState {
    GameState *currentActiveState = [stateStack lastObject];
    [stateStack removeLastObject];
    [currentActiveState deactivate];
    [self.components removeComponent:currentActiveState];
    
    currentActiveState = [stateStack lastObject];
    [self.components addComponent:currentActiveState];
    [currentActiveState activate];
    
}

- (Class) getLevelClass:(LevelType)type {
    return levelClasses[type];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
    [self.graphicsDevice clearWithColor:[Color white]];
    [super drawWithGameTime:gameTime];
}

- (void)saveSettings {
    
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    
    [settings setObject:[NSNumber numberWithBool:soundOn] forKey:@"SoundOn"];
    [settings setObject:[NSNumber numberWithBool:musicOn] forKey:@"MusicOn"];
    
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *settingsFilePath = [rootPath stringByAppendingPathComponent:@"settings.dat"];
    [NSKeyedArchiver archiveRootObject:settings toFile:settingsFilePath];
    
}

- (void)loadSettings {
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *settingsFilePath = [rootPath stringByAppendingPathComponent:@"settings.dat"];
    NSDictionary *settings = [NSKeyedUnarchiver unarchiveObjectWithFile:settingsFilePath];
    
    if (settings) {
        soundOn = [[settings objectForKey:@"SoundOn"] boolValue];
        musicOn = [[settings objectForKey:@"MusicOn"] boolValue];
    } else {
        // Default settings if no saved settings found
        soundOn = YES;
        musicOn = YES;
    }
}

- (void)dealloc {
    
    // [levelClasses release];
    
    [stateStack release];
    [graphics release];
    [super dealloc];
}

@end
