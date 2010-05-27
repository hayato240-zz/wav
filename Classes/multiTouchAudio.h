//
//  multiTouchAudio.h
//  wav
//
//  Created by nishimaru hayato on 10/05/26.
//  Copyright 2010 Indivisual. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKAudioOutput.h"
#import "touchDelegate.h"

@interface multiTouchAudio : NSObject<touchDelegate> {
	AudioUnit outputUnit;
	YKAudioOutput *audio;
	NSMutableSet *sounds;
	NSEnumerator* iterator;
}
-(void)setupOutputUnit;
@property (readwrite,retain, nonatomic) NSMutableSet* sounds;
@property (readwrite,retain, nonatomic)  NSEnumerator* iterator;
@end
