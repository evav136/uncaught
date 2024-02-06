//
//  Scene.h
//  Uncaught iOS
//
//  Created by Eva Vidic on 23/11/2023.
//

#import "GameComponent.h"
#import "Retronator.Uncaught.classes.h"
#import "IScene.h"

NS_ASSUME_NONNULL_BEGIN

@interface Scene : GameComponent <IScene> {
    // A list of items currently on the scene.
    NSMutableArray *items;
    
    // A list of adds and removes to be executed on the scene.
    NSMutableArray *actions;
    
    Event *itemAdded;
    Event *itemRemoved;
}

@property (nonatomic, assign) NSMutableArray *items;
@property (nonatomic, assign) NSMutableArray *actions;
@property (nonatomic, assign) Event *itemAdded;
@property (nonatomic, assign) Event *itemRemoved;


@end

NS_ASSUME_NONNULL_END
