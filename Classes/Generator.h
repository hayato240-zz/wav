//
//  generator.h
//  wav
//
//  Created by nishimaru hayato on 10/05/26.
//  Copyright 2010 Indivisual. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Generator : NSObject {
	UITouch* touch;
	double time;
	NSInteger pitch;
	NSInteger state;
	double lastSignal;
	NSInteger theta;
	double vibrato;
	double volume;
}
@property(retain,nonatomic) IBOutlet UITouch* touch;
@property(assign,nonatomic) NSInteger state;
-(double) generateSound;
-(void) released;
-(BOOL) died;
-(id) initWithTouch:(UITouch*) _touch;

@end
