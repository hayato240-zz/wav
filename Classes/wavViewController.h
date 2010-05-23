//
//  wavViewController.h
//  wav
//
//  Created by 西丸 隼人 on 10/05/23.
//  Copyright Indivisual 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKAudioOutput.h"
#import "wavUIView.h"
#import "touchDelegate.h"


@interface wavViewController : UIViewController<touchDelegate> {
		YKAudioOutput *audio;
		wavUIView *uiview;
		id delegate; 
		int currentColor;
}


-(id) colorAt:(int)at;
@property (nonatomic, retain) IBOutlet YKAudioOutput *audio;
@property (nonatomic, retain) IBOutlet wavUIView *uiview;
@property (nonatomic, retain) id delegate;  
@end

