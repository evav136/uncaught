//
//  LevelsMenu.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 30/01/2024.
//

#import "Menu.h"

NS_ASSUME_NONNULL_BEGIN

@interface LevelsMenu : Menu {
    Image *menuBg;
    Label *title, *subtitle;
    ButtonButton *level1, *level2, *level3, *exit;
}

@end

NS_ASSUME_NONNULL_END
