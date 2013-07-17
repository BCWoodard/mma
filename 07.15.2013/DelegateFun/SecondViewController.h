//
//  SecondViewController.h
//  DelegateFun
//
//  Created by Brad Woodard on 7/15/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorDelegate.h"

@interface SecondViewController : UIViewController

@property (strong, nonatomic) id <ColorDelegate> delegate;

@end
