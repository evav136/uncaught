//
//  GameHud.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 14/01/2024.
//

#import "GameComponent.h"
#import "Express.Scene.h"
#import "Artificial.Mirage.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Uncaught.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameHud : GameComponent {
    Scene *scene;
    GameTimer *timer;
    
    Label *playerScore;
    Label *timerLabel;
    
    Color *playerColor;
    Color *timerColor;
    
    Uncaught *uncaught;
    GuiRenderer *renderer;
    
    BOOL exit;
}

- (void) changePlayerScore:(int) value;

@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, assign)BOOL exit;

@end



NS_ASSUME_NONNULL_END
