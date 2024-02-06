//
//  MainMenu.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 31/12/2023.
//

#import <Foundation/Foundation.h>
#import "Menu.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainMenu : Menu {
    Image *menuBg;
    
    Label *title, *subtitle, *highScore;
    
    ButtonButton *singleplayer, *options;
}

@end

NS_ASSUME_NONNULL_END
