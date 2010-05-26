//
//  multiTouchAudio.h
//  wav
//
//  Created by nishimaru hayato on 10/05/26.
//  Copyright 2010 Indivisual. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKAudioOutput.h"

@interface multiTouchAudio : NSObject {
	YKAudioOutput *audio;
	NSMutableSet *sounds;
}

@end
