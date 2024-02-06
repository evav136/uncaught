//
//  PauseMenu.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/12/2023.
//

#import "GameState.h"
#import "Retronator.Uncaught.classes.h"
#import "Scene.h"
#import "Artificial.Mirage.h"

NS_ASSUME_NONNULL_BEGIN

@interface Menu : GameState {
    Scene *scene;
    GuiRenderer *renderer;
    
    SpriteFont *retrotype;
    Texture2D *buttonBackground;
    Rectangle *sourceRectangle;
}

@end

NS_ASSUME_NONNULL_END
