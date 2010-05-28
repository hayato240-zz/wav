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
	NSInteger time;
	NSInteger pitch;
}
@property(retain,nonatomic) IBOutlet UITouch* touch;
-(double) generateSound;
-(id) initWithTouch:(UITouch*) _touch;

@end
