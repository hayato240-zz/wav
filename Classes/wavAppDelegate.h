//
//  wavAppDelegate.h
//  wav
//
//  Created by hayato240 on 10/05/23.
//  Copyright Indivisual 2010. All rights reserved.
//

#import <UIKit/UIKit.h>



@class wavViewController;

@interface wavAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    wavViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

