//
//  touchDelegate.h
//  wav
//
//  Created by nishimaru hayato on 10/05/23.
//  Copyright 2010 Indivisual. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol touchDelegate
- (void)touchPoint:(double)x: (double) y: (BOOL)isTouch;
@end
