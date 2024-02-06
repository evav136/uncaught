//
//  GameHud.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 14/01/2024.
//

#import "GameHud.h"

#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "ButtonButton.h"

@implementation GameHud

@synthesize exit;

- (id) initWithGame:(Game *)theGame
{
    self = [super initWithGame:theGame];
    if (self != nil) {
        scene = [[Scene alloc] initWithGame:self.game];
        uncaught = (Uncaught *)self.game;
        exit = NO;
        
        for (id item in theGame.components) {
            if ([item isKindOfClass:[GuiRenderer class]]) {
                renderer = (GuiRenderer *)item;
            }

            if ([item isKindOfClass:[GameTimer class]]) {
                timer = (GameTimer *)item;
            }
        }
        
        [self.game.components addComponent:scene];
    }
    return self;
}

@synthesize scene;

- (void) initialize {    
    FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
    SpriteFont *font = [[self.game.content load:@"font" processor:fontProcessor] autorelease];
    
    playerScore = [[Label alloc] initWithFont:font text:@"0" position:[Vector2 vectorWithX:380 y:85]];
    
    playerColor = [[Color white] retain];
    playerScore.color = playerColor;
    playerScore.horizontalAlign = HorizontalAlignCenter;
    playerScore.verticalAlign = VerticalAlignMiddle;
    [playerScore setScaleUniform:4.7];
    [scene addItem:playerScore];
    
    timerLabel = [[Label alloc] initWithFont:font text:@"0" position:[Vector2 vectorWithX:2120 y:109]];
    
    timerColor = [[Color white] retain];
    timerLabel.color = timerColor;
    timerLabel.horizontalAlign = HorizontalAlignCenter;
    timerLabel.verticalAlign = VerticalAlignMiddle;
    [timerLabel setScaleUniform:4.6];
    [scene addItem:timerLabel];
    
    [self updateTimerLabelText];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // [super updateWithGameTime:gameTime];
    [self updateTimerLabelText];
}

- (void) changePlayerScore:(int)value {
    playerScore.text = [NSString stringWithFormat:@"%i", value];
    [playerScore setScaleUniform:4.7];
}

- (void)updateTimerLabelText {
    
    // Check if the timer reference is not nil
    if (timer) {
        timerLabel.text = [NSString stringWithFormat:@"%ld", (long)timer.remainingTime];
    }
}

- (void) dealloc
{
    [playerScore release];
    [super dealloc];
}


@end
