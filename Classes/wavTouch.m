//
//  wavTouch.m
//  wav
//
//  Created by 西丸 隼人 on 10/05/23.
//  Copyright 2010 Indivisual. All rights reserved.
//

#import "wavTouch.h"


@implementation wavTouch
- (id)init {
	self = [super init];
	return self;
}

//タッチイベント取得

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch* touch = [touches anyObject];
	CGPoint pt = [touch locationInView:self];
	printf("point = %lf,%lf\n", pt.x, pt.y);
	
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch* touch = [touches anyObject];
	CGPoint pt2 = [touch locationInView:self];
	printf("point = %lf,%lf\n", pt2.x, pt2.y);
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch* touch = [touches anyObject];
	CGPoint pt3 = [touch locationInView:self];
	printf("point = %lf,%lf\n", pt3.x, pt3.y);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch* touch = [touches anyObject];
	CGPoint pt4 = [touch locationInView:self];
	printf("point = %lf,%lf\n", pt4.x, pt4.y);
}


@end
