//
//  TouchPanelHelper.m
//  Uncaught iOS
//
//  Created by Eva Vidic on 26/12/2023.
//

#import "TouchPanelHelper.h"

static TouchCollection *touches = nil;

@implementation TouchPanelHelper

+ (void) initialize {
    touches = nil;
}

+ (TouchCollection *) getState {
    return touches;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [touches release];
    touches = [[TouchPanel getState] retain];
}

- (void) dealloc
{
    [touches release];
    [super dealloc];
}


@end
