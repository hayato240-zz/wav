//
//  multiTouchAudio.m
//  wav
//
//  Created by nishimaru hayato on 10/05/26.
//  Copyright 2010 Indivisual. All rights reserved.
//

#import "multiTouchAudio.h"
#import "YKAudioOutput.h"

@implementation multiTouchAudio

-(id)init{
	self = [super init];
	audio = [[YKAudioOutput alloc] init];
	sounds = [[NSMutableSet alloc] init];
	return self;
}

- (void)touchBegan:(UITouch*) touch{
	[sounds addObject:touch];
	NSLog(@"began %d",[sounds count]);
}

- (void)touchEnded:(UITouch*) touch{
	NSLog(@"end 1 %d",[sounds count]);
	[sounds removeObject:touch];
	NSLog(@"end 2 %d",[sounds count]);
}


@end
