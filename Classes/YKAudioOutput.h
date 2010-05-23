//
//  YKAudioOutput.h
//  wav
//
//  Created by nishimaru hayato on 10/05/23.
//  Copyright 2010 Indivisual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface YKAudioOutput : NSObject {
	AudioUnit outputUnit;
	int pitch;
	int lastFrame;
	double lastTheta;
	double vibrato;
	double touchX;
	double touchY;
}
-(void)receiveLocation:(double) x: (double) y:(BOOL)isTouch;
@property (readonly) int pitch;
@property (readwrite) int lastFrame;
@property (readwrite) double lastTheta;
@property (readwrite) double vibrato;
@property (readwrite) double touchX;
@property (readwrite) double touchY;
@end
