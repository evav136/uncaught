//
//  PauseMenu.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/12/2023.
//

#import "Menu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Retronator.Uncaught.h"


@implementation Menu

- (id) initWithGame:(Game *)theGame
{
    self = [super initWithGame:theGame];
    if (self != nil) {
        scene = [[Scene alloc] initWithGame:self.game];
        renderer = [[GuiRenderer alloc] initWithGame:self.game scene:scene];
        sourceRectangle = [[Rectangle alloc] initWithX:284 y:1718 width:180 height:90];
    }
    return self;
}

- (void) activate {
    [self.game.components addComponent:scene];
    [self.game.components addComponent:renderer];
}

- (void) deactivate {
    [self.game.components removeComponent:scene];
    [self.game.components removeComponent:renderer];
}

- (void) initialize {
    // Fonts
    FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
    retrotype = [self.game.content load:@"font" processor:fontProcessor];
    retrotype.lineSpacing = 14;

    // Buttons
    buttonBackground = [self.game.content load:@"icons"];

    [super initialize];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // Update all buttons.
    Matrix *inverseView = [Matrix invert:renderer.camera];
    for (id item in scene) {
        ButtonButton *button = [item isKindOfClass:[ButtonButton class]] ? item : nil;

        if (button) {
            [button updateWithInverseView:inverseView];
        }
    }
}

- (void) dealloc
{
    [buttonBackground release];
    [retrotype release];
    [scene release];
    [renderer release];
    [super dealloc];
}

@end
