//
//  ButtonButton.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/12/2023.
//

#import <Foundation/Foundation.h>
#import "Artificial.Mirage.classes.h"
#import "Retronator.Uncaught.h"
#import "ISceneUser.h"
#import "Rectangle.h"

NS_ASSUME_NONNULL_BEGIN

@interface ButtonButton : NSObject <ISceneUser> {
    id<IScene> scene;
    
    Uncaught *uncaught;
    
    Image *backgroundImage;
    Label *label;
    
    Rectangle *inputArea;
    BOOL enabled;
    
    BOOL isDown;
    BOOL wasPressed;
    BOOL wasReleased;
    int pressedID;
    
    Color *labelColor, *labelHoverColor, *backgroundColor, *backgroundHoverColor;
}

- (id) initWithInputArea:(Rectangle*)theInputArea background:(Texture2D*)background font:(SpriteFont*)font text:(NSString*)text sourceRect:(Rectangle*)sourceRect;

@property (nonatomic, readonly) Rectangle *inputArea;
@property (nonatomic) BOOL enabled;

@property (nonatomic, readonly) BOOL isDown;
@property (nonatomic, readonly) BOOL wasPressed;

// Made raeadwrite.
@property (nonatomic, readwrite) BOOL wasReleased;

@property (nonatomic, readonly) Image *backgroundImage;
@property (nonatomic, readonly) Label *label;

@property (nonatomic, retain) Color *labelColor, *labelHoverColor, *backgroundColor, *backgroundHoverColor;

- (void) updateWithInverseView:(Matrix*)inverseView;

@end

NS_ASSUME_NONNULL_END
