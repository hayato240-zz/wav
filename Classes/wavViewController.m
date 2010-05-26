//
//  wavViewController.m
//  wav
//
//  Created by hayato240 on 10/05/23.
//  Copyright Indivisual 2010. All rights reserved.
//

#import "wavViewController.h"
#import "wavUIView.h"
#import "multiTouchAudio.h"

@implementation wavViewController
@synthesize audio;
@synthesize uiview;
@synthesize delegate;


- (id)init {
	self = [super init];
	currentColor = 0;
	return self;
	
}
/*
-(void) setWithPoint(){}
*/

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/



-(void)touchPoint:(double)x: (double) y:(BOOL)isTouch{
	//[self.audio receiveLocation: x: y:isTouch];
	UIColor* color;
	if (isTouch) {
		currentColor++;
		if (currentColor > 12) {
			currentColor = 0;
		}
		color = [self colorAt: currentColor];
	}
	else {
		color = [UIColor blackColor];
	}
	uiview.backgroundColor = color;

}


-(id)colorAt:(int) at {
	switch(at) {
		case 0:
			return [UIColor whiteColor];
		case 1:
			return [UIColor redColor];
		case 2:
			return [UIColor greenColor];
		case 3:
			return [UIColor blueColor];
		case 4:
			return [UIColor cyanColor];
		case 5:
			return [UIColor whiteColor];
		case 6:
			return [UIColor redColor];
		case 7:
			return [UIColor greenColor];
		case 8:
			return [UIColor blueColor];
		case 9:
			return [UIColor cyanColor];
		case 10:
			return [UIColor yellowColor];
		case 11:
			return [UIColor magentaColor];
		default:
			return [UIColor orangeColor];
	}
}

/*
-(void)setWithPoint(double x,double y){

}
 */

- (void)touchBegan:(UITouch*) touch{
	[audio touchBegan:touch];
}

- (void)touchEnded:(UITouch*) touch{
	[audio touchEnded:touch];
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super loadView];
	uiview = [[wavUIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	uiview.backgroundColor = [UIColor blackColor];
	[self.view addSubview:uiview];

	

}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	audio = [[multiTouchAudio alloc] init];
	uiview.delegate = self;
	[uiview becomeFirstResponder];
	//[self.view setMultipleTouchEnabled:YES];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
