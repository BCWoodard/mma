//
//  ViewController.h
//  TableFun
//
//  Created by Brad Woodard on 7/16/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditViewController.h"
#import "UpdateColorDelegate.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UpdateColorDelegate>



@end
