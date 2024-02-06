//
//  OptionsMenu.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 14/01/2024.
//

#import "Menu.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OptionsMenu : Menu {
    Image *menuBg;
    Label *title, *subtitle, *turnOffSound, *turnOffMusic;
    ButtonButton *soundSet, *exit, *soundOff, *musicOff, *soundOn, *musicOn;
}

@end

NS_ASSUME_NONNULL_END
