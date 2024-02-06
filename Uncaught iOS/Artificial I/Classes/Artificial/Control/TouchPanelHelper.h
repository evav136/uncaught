//
//  TouchPanelHelper.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/12/2023.
//

#import "GameComponent.h"
#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Input.Touch.h"

@interface TouchPanelHelper : GameComponent {
    
}

+ (TouchCollection*) getState;

@end
