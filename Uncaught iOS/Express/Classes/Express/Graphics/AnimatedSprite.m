//
//  AnimatedSprite.m
//  Express
//
//  Created by Matej Jan on 27.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "AnimatedSprite.h"
#import "AnimatedSpriteFrame.h"
#import "Express.Graphics.h"

@implementation AnimatedSprite

static NSArray *frameStartSort;

+ (void) initialize {
	NSSortDescriptor *frameStartSortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"start" ascending:YES] autorelease];
	
	frameStartSort = [[NSArray arrayWithObject:frameStartSortDescriptor] retain];
}


- (id) initWithDuration:(NSTimeInterval)theDuration
{
	self = [super init];
	if (self != nil) {
		frames = [[NSMutableArray alloc] init];
		duration = theDuration;
	}
	return self;
}

@synthesize duration, looping;

- (void) setLoopingWithDuration:(NSTimeInterval)theDuration {
	looping = YES;
	duration = theDuration;
}

- (void) addFrame:(AnimatedSpriteFrame *)frame {
	[frames addObject:frame];
	[frames sortUsingDescriptors:frameStartSort];
}

- (Sprite *) spriteAtTime:(NSTimeInterval)time {
	if (looping) {
		int loops = floorf(time / duration);
		time -= loops * duration;
	}
	
	if (time >= duration) {
		// Animation has finished.
		return nil;
	} 
	
	for (int i = 0; i < [frames count] - 1; i++) {
		AnimatedSpriteFrame *nextFrame = (AnimatedSpriteFrame*)[frames objectAtIndex:i + 1];
		if (nextFrame.start > time) {
			AnimatedSpriteFrame *frame = (AnimatedSpriteFrame*)[frames objectAtIndex:i];
			return frame.sprite;
		}
	}
	
	// Return last frame.
	AnimatedSpriteFrame *frame = (AnimatedSpriteFrame*)[frames objectAtIndex:[frames count] - 1];
	return frame.sprite;
}

- (void) dealloc
{
	[frames release];
	[super dealloc];
}


@end
