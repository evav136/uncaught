//
//  Scene.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 23/11/2023.
//

#import "Scene.h"
#import "Express.Scene.h"
#import "Express.Scene.Objects.h"
#import "SceneAction.h"
#import "ISceneUser.h"


@implementation Scene

- (id) initWithGame:(Game *)theGame {
    self = [super initWithGame:theGame];
    if (self != nil) {
        items = [[NSMutableArray alloc] init];
        
        actions = [[NSMutableArray alloc] init];
        
        itemAdded = [[Event alloc] init];
        itemRemoved = [[Event alloc] init];
    }
    return self;
}

@synthesize itemAdded, itemRemoved, actions, items;

- (int) updateOrder {return super.updateOrder;}
- (void) setUpdateOrder:(int)value {super.updateOrder = value;}
- (Event*) updateOrderChanged {return super.updateOrderChanged;}

- (BOOL) enabled {return super.enabled;}
- (void) setEnabled:(BOOL)value {super.enabled = value;}
- (Event*) enabledChanged {return super.enabledChanged;}


- (void) addItem:(id)item {
    [actions addObject:[SceneAction actionWithOperation:SceneOperationAdd item:item]];
}

- (void) removeItem:(id)item {
    [actions addObject:[SceneAction actionWithOperation:SceneOperationRemove item:item]];
}

- (void) clear {
    for (id item in items) {
        [self removeItem:item];
    }
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    for (int i = 0; i < [actions count]; i++) {
        SceneAction *action = [actions objectAtIndex:i];
        
        // Retain the item so we guarantee it's alive during our operation.
        id item = [action.item retain];
        id<ISceneUser> sceneUser = [item conformsToProtocol:@protocol(ISceneUser)] ? item : nil;
        
        if (action.operation == SceneOperationAdd) {
            [items addObject:item];
            
            if (sceneUser) {
                sceneUser.scene = self;
                if ([sceneUser respondsToSelector:@selector(addedToScene:)]) {
                    [sceneUser addedToScene:self];
                }
            }
            
            [itemAdded raiseWithSender:self eventArgs:[SceneEventArgs eventArgsWithItem:item]];
        } else {
            [items removeObject:item];
            
            if (sceneUser) {
                sceneUser.scene = nil;
                if ([sceneUser respondsToSelector:@selector(removedFromScene:)]) {
                    [sceneUser removedFromScene:self];
                }
            }
            
            [itemRemoved raiseWithSender:self eventArgs:[SceneEventArgs eventArgsWithItem:item]];
        }
        
        // We've completed work with the item and can now release it.
        [item release];
    }
    
    [actions removeAllObjects];
}

- (NSUInteger) countByEnumeratingWithState:(NSFastEnumerationState *)state
                                   objects:(id *)stackbuf
                                     count:(NSUInteger)len {
    return [items countByEnumeratingWithState:state objects:stackbuf count:len];
}

- (void) dealloc
{
    
    [itemAdded release];
    [itemRemoved release];
    [actions release];
    [items release];
    [super dealloc];
}

@end
