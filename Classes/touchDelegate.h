//
//  touchDelegate.h
//  wav
//
//  Created by hayato240 on 10/05/23.
//  Copyright 2010 Indivisual. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol touchDelegate
- (void)touchBegan:(UITouch*) touch;
- (void)touchEnded:(UITouch*) touch;
@end
