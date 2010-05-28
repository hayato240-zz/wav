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
@synthesize state;

-(id)initWithTouch:(UITouch*) _touch{
	self = [super init];
	self.touch = _touch;
	
	time = 0;
	pitch = 440;
	state = 1;
	lastSignal = 0.0;
	return self;
}

-(void) released {
	if (state == 1) {
		state++;
	}
	return;
}
-(BOOL) died {
	return (state == 3);
}

-(double)generateSound {
	if (state == 3) {
		return 0.0;
	}

	CGPoint point = [self.touch locationInView:nil];
	pitch = point.y * 3 + 400;
	double signal = sin(M_PI / 22050 * time * pitch);
	time++;

	if (state == 2 && fabs(signal) > fabs(lastSignal) ) {
		signal = 0.0;
		state++;
	}
	lastSignal = signal;
	return signal;
}

@end
