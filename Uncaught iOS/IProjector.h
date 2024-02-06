//
//  IProjector.h
//  friHockey
//
//  Created by Matej Jan on 5.1.11.
//  Copyright 2011 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol IProjector

- (Vector2*) projectToWorldFromScreen:(Vector2*)screenCoordinate;

@end
