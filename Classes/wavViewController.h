//
//  wavViewController.h
//  wav
//
//  Created by hayato240 on 10/05/23.
//  Copyright Indivisual 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "wavUIView.h"
#import "touchDelegate.h"
#import "multiTouchAudio.h"


@interface wavViewController : UIViewController<touchDelegate> {
		wavUIView *uiview;
		id delegate; 
		int currentColor;
		multiTouchAudio *audio;
}


-(id) colorAt:(int)at;
@property (nonatomic, retain) IBOutlet multiTouchAudio *audio;
@property (nonatomic, retain) IBOutlet wavUIView *uiview;
@property (nonatomic, retain) id delegate;  
@end

