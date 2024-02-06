//
//  PauseMenu.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/12/2023.
//

#import "Menu.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PauseMenu : Menu {
    // BOOL exited;
    
    Image *menuBg;
    Label *title, *subtitle;
    ButtonButton *cont, *exit;
}

// @property (nonatomic, assign)BOOL exited;

@end

NS_ASSUME_NONNULL_END
