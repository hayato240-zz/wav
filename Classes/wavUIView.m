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

	UITouch* touch = [touches anyObject];
	CGPoint pt = [touch locationInView:self];	
	[delegate touchPoint: pt.x: pt.y :TRUE ];
	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

	UITouch* touch = [touches anyObject];
	CGPoint pt = [touch locationInView:self];
	[delegate touchPoint:pt.x:pt.y:TRUE];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch* touch = [touches anyObject];
	CGPoint pt = [touch locationInView:self];
	[delegate touchPoint:pt.x:pt.y:FALSE];
	
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
	/*
	UITouch* touch = [touches anyObject];
	CGPoint pt = [touch locationInView:self];
	[delegate touchPoint:pt.x:pt.y];
	 */
}


@end
