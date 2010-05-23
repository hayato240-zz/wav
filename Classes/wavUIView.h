//
//  wavUIView.h
//  wav
//
//  Created by 西丸 隼人 on 10/05/23.
//  Copyright 2010 Indivisual. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "touchDelegate.h"

@interface wavUIView : UIView{
	id delegate;
}
@property (nonatomic, retain) id delegate;  
@end
