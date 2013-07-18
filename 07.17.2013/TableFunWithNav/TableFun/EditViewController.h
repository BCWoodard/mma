//
//  EditViewController.h
//  TableFunWithNav
//
//  Created by Brad Woodard on 7/17/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateColorDelegate.h"

@interface EditViewController : UIViewController

@property (strong, nonatomic) NSString *incomingString;
@property (strong, nonatomic) id <UpdateColorDelegate> delegate;

@end
