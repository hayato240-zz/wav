//
//  multiTouchAudio.m
//  wav
//
//  Created by nishimaru hayato on 10/05/26.
//  Copyright 2010 Indivisual. All rights reserved.
//

#import "multiTouchAudio.h"
#import "YKAudioOutput.h"
#import "Generator.h"

@implementation multiTouchAudio
@synthesize sounds;
@synthesize iterator;

-(id)init{
	self = [super init];
	// audio = [[YKAudioOutput alloc] init];
	sounds = [[NSMutableSet alloc] init];
	[self setupOutputUnit];
	return self;
}

- (void)touchBegan:(UITouch*) touch{
	@synchronized(self) {
		Generator* generator = [[Generator alloc] initWithTouch:touch];
		[sounds addObject:generator];
		[generator release];
	}
}

- (void)touchEnded:(UITouch*) touch{

	NSAutoreleasePool* pool;

	pool = [[NSAutoreleasePool alloc]init];
	
	@synchronized(self) {
		NSEnumerator *enumerator = [sounds objectEnumerator];
		Generator *generator;
		while ((generator = [enumerator nextObject]))
		{
			if (touch == generator.touch) {
				break;
			} else {
				generator = nil;
			}
		}
		if (generator != nil) {
			[sounds removeObject:generator];
//			[generator release];
		}
	}
//	[pool release];
}


static OSStatus OutputCallback(void *inRefCon,
                               AudioUnitRenderActionFlags *ioActionFlags,
                               const AudioTimeStamp *inTimeStamp,
                               UInt32 inBusNumber,
                               UInt32 inNumberFrames,
                               AudioBufferList *ioData)
{
	NSAutoreleasePool* pool;
	pool = [[NSAutoreleasePool alloc]init];
    OSStatus err = noErr;

	multiTouchAudio *that = (multiTouchAudio *)inRefCon;
	@synchronized(that) {

    for (NSInteger i = 0; i < ioData->mNumberBuffers; i++) {
        AudioSampleType *ptr = ioData->mBuffers[i].mData;
		int signal = 0;
        for (NSInteger j = 0; j < inNumberFrames; j++) {
			if ([that->sounds count] > 0) {
				NSMutableSet *sounds = that.sounds;
				NSEnumerator *enumerator;
				enumerator = [sounds objectEnumerator];
				[enumerator autorelease];
				Generator *generator;
				while ((generator = [enumerator nextObject]))
				{
					signal += [generator generateSound];
//					NSLog(@"signal %d", signal);
				}
				[enumerator release];

			}
			UInt32 channels = ioData->mBuffers[i].mNumberChannels;
			for (NSInteger k = 0; k < channels; k++) {
				ptr[j * channels + k] = signal;
			}
		}
	}
		// TODO: overflow!!!!!!!!
	}
//	[pool release];
    return err;
}



- (void)setupOutputUnit
{
    AudioComponent component;
    AudioComponentDescription desc;
    desc.componentType = kAudioUnitType_Output;
    desc.componentSubType = kAudioUnitSubType_RemoteIO;
    desc.componentManufacturer = kAudioUnitManufacturer_Apple;
    desc.componentFlags = 0;
    desc.componentFlagsMask = 0;
    
    component = AudioComponentFindNext(NULL, &desc);
    AudioComponentInstanceNew(component, &outputUnit);
    AudioUnitInitialize(outputUnit);
	
    AURenderCallbackStruct callback;
    callback.inputProc = OutputCallback;
    callback.inputProcRefCon = self;
    
    AudioUnitSetProperty(outputUnit, 
                         kAudioUnitProperty_SetRenderCallback, 
                         kAudioUnitScope_Global, 
                         0, 
                         &callback, 
                         sizeof(AURenderCallbackStruct));
    
    AudioStreamBasicDescription outputFormat;
    UInt32 size = sizeof(outputFormat);
    AudioUnitGetProperty(outputUnit, 
                         kAudioUnitProperty_StreamFormat, 
                         kAudioUnitScope_Global, 
                         0, 
                         &outputFormat, 
                         &size);
    
    NSLog(@"samplerate = %f", outputFormat.mSampleRate);
    NSLog(@"bits = %u", outputFormat.mBitsPerChannel);
    NSLog(@"channels = %u", outputFormat.mChannelsPerFrame);
    NSLog(@"%@",
          (outputFormat.mFormatFlags & kLinearPCMFormatFlagIsNonInterleaved) ? 
          @"non interleaved" : @"interleaved");
	
    AudioOutputUnitStart(outputUnit);
}


@end
