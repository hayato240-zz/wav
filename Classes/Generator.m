//
//  generator.m
//  wav
//
//  Created by nishimaru hayato on 10/05/26.
//  Copyright 2010 Indivisual. All rights reserved.
//

#import "Generator.h"


@implementation Generator
@synthesize touch;

-(id)initWithTouch:(UITouch*) _touch{
	self = [super init];
	self.touch = _touch;
	
	time = 0;
	pitch = 440;

	return self;
}

-(double)generateSound {
	CGPoint point = [self.touch locationInView:nil];
	pitch = point.y * 3 + 400;
	double signal = sin(M_PI / 22050 * time * pitch);
	time++;
	return signal;
}

@end
