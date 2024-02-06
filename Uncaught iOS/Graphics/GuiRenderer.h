//
//  GuiRenderer.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/12/2023.
//

#import "DrawableGameComponent.h"
#import "Retronator.Uncaught.classes.h"
#import "Scene.h"

NS_ASSUME_NONNULL_BEGIN

@interface GuiRenderer : DrawableGameComponent {
    SpriteBatch *spriteBatch;
    
    id<IScene> scene;
    
    // Camera
    // Matrix *camera;
}

@property (nonatomic, readonly) Matrix *camera;


- (id) initWithGame:(Game*)theGame scene:(id<IScene>)theScene;

@end

NS_ASSUME_NONNULL_END
