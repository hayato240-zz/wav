//
//  wavUIView.m
//  wav
//
//  Created by hayato240 on 10/05/23.
//  Copyright 2010 Indivisual. All rights reserved.
//

#import "wavUIView.h"

@implementation wavUIView
@synthesize delegate;


- (id)init {
	self = [super init];

	return self;
}	

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[self setMultipleTouchEnabled:YES]; //XXX: ヤバイっすねｌ
	NSEnumerator *enumerator = [touches objectEnumerator];
	UITouch *touch;
	while ((touch = [enumerator nextObject]))
	{
		[delegate touchBegan:touch];
	}
	
	[super touchesMoved:touches withEvent:event];
	
	
}

/*
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	int finger = 0;
	NSEnumerator *enumerator = [touches objectEnumerator];
	UITouch *touch;
	CGPoint location;
	while ((touch = [enumerator nextObject]))
	{
		location = [touch locationInView:self];
		NSLog(@"指 %x が移動した: %f, %f", touch, location.x, location.y);
		finger++;
	}
	
	[super touchesMoved:touches withEvent:event];

	
}
 */


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	NSEnumerator *enumerator = [touches objectEnumerator];
	UITouch *touch;
	while ((touch = [enumerator nextObject]))
	{
		[delegate touchEnded:touch];
	}
	
	[super touchesMoved:touches withEvent:event];
	
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
	[self touchesEnded:touches withEvent:event];
}


@end
