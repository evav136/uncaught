//
//  GuiRenderer.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/12/2023.
//

#import "GuiRenderer.h"
#import "Retronator.Uncaught.h"
#import "Artificial.Mirage.h"

@implementation GuiRenderer

@synthesize camera;

- (id) initWithGame:(Game*)theGame scene:(id<IScene>)theScene
{
    self = [super initWithGame:theGame];
    if (self != nil) {
        scene = theScene;
    }
    return self;
}


- (void) initialize {
//    float scaleX = (float)self.game.gameWindow.clientBounds.width / 480;
//    float scaleY = (float)self.game.gameWindow.clientBounds.height / 320;
    camera = [[Matrix createScale:[Vector3 vectorWithX:1 y:1 z:1]] retain];
    [super initialize];
}


- (void) loadContent {
    spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
    [spriteBatch beginWithSortMode:SpriteSortModeDeffered
                        BlendState:nil
                      SamplerState:[SamplerState pointClamp]
                 DepthStencilState:nil
                   RasterizerState:nil
                            Effect:nil
                   TransformMatrix:camera];
    
    for (id item in scene) {
        Label *label = [item isKindOfClass:[Label class]] ? item : nil;
        Image *image = [item isKindOfClass:[Image class]] ? item : nil;
        
        if (label) {
            [spriteBatch drawStringWithSpriteFont:label.font text:label.text to:label.position tintWithColor:label.color
                                         rotation:label.rotation origin:label.origin scale:label.scale effects:SpriteEffectsNone layerDepth:label.layerDepth];
        }
        
        if (image) {
            [spriteBatch draw:image.texture to:image.position fromRectangle:image.sourceRectangle tintWithColor:image.color
                     rotation:image.rotation origin:image.origin scale:image.scale effects:SpriteEffectsNone layerDepth:image.layerDepth];
        }
    }
    
    [spriteBatch end];
}

- (void) unloadContent {
    [spriteBatch release];
}

@end
