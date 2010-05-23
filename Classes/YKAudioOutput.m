
//
//  YKAudioOutput.m
//

#import "YKAudioOutput.h"

@implementation YKAudioOutput
@synthesize pitch, lastFrame,lastTheta,vibrato;
@synthesize touchX;
@synthesize touchY;

-(void)receiveLocation:(double) x: (double) y: (BOOL)isTouch{
	self.touchX = x;
	self.touchY = y;
	if (!isTouch) {
		pitch=0;
		return;
	}
	double now = 440.0;
	int at = y / 24;
	int i=0;
	for (i=0; i < at; i++) {
		now *= 1.05946;
	}
	pitch = now;
	vibrato = x > 160 ? (0.1/(160*160))*(x-160)*(x-160) : 0;
}

static OSStatus OutputCallback(void *inRefCon,
                               AudioUnitRenderActionFlags *ioActionFlags,
                               const AudioTimeStamp *inTimeStamp,
                               UInt32 inBusNumber,
                               UInt32 inNumberFrames,
                               AudioBufferList *ioData)
{
    OSStatus err = noErr;
	YKAudioOutput *that = (YKAudioOutput *)inRefCon;
    for (NSInteger i = 0; i < ioData->mNumberBuffers; i++) {
        //2009/6/28 OS3.0対応
        AudioSampleType *ptr = ioData->mBuffers[i].mData;
		double theta=that->lastTheta;
		double signal;
        for (NSInteger j = 0; j < inNumberFrames; j++) {
			theta+=1+sin((that->lastFrame+1)/1000.0)*that->vibrato;
            UInt32 channels = ioData->mBuffers[i].mNumberChannels;
            for (NSInteger k = 0; k < channels; k++) {
				signal = sin(M_PI / 22050 * theta * that->pitch);
				if (that->touchX < 160) {
					if( (j + that->lastFrame) % 4000 > 2000) {
						signal *= that->touchX / 160;
					}
				}
                ptr[j * channels + k] = signal * INT16_MAX;
            }
        }
		// TODO: overflow!!!!!!!!
		that->lastFrame+= inNumberFrames;
		that->lastTheta= theta;
	}
    return err;
}

- (void)setupOutputUnit
{
	lastFrame = 0;
	lastTheta = 0;
	vibrato = 0.0;
	pitch = 0;
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

- (void)dispose
{
    AudioOutputUnitStop(outputUnit);
    AudioUnitUninitialize(outputUnit);
    AudioComponentInstanceDispose(outputUnit);
    outputUnit = NULL;
}

- (id) init
{
    self = [super init];

    if (self != nil) {
        [self setupOutputUnit];
    }
    return self;
}

- (void) dealloc
{
    [self dispose];
    [super dealloc];
}

@end