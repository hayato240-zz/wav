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
	lastSignal = 10;
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

	double signal = sin(M_PI / 22050 * time * pitch);
	time++;

	if (fabs(signal) > fabs(lastSignal)) {
		CGPoint point = [self.touch locationInView:nil];

		//XXX なんか%が使えなくてださい感じになった，よくわからない
		double octave = 96.0 * 1.5;
		pitch = 55.0 * pow(2, floor(point.y / octave) + 2);
		int at = floor(point.y * 12 / octave);
		while(at >= 12) at -= 12;
		for (int i=0; i < at; i++) {
			pitch *= 1.05946;
		}

		if (state == 2) {
			signal = 0.0;
			state++;
		}
	}
	lastSignal = signal;

	return signal;
}

@end
