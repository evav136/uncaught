//
//  GameState.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/12/2023.
//

#import "GameComponent.h"
#import "Retronator.Uncaught.classes.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameState : GameComponent {
    Uncaught *uncaught;
}

- (void)activate;
- (void)deactivate;

@end

NS_ASSUME_NONNULL_END
