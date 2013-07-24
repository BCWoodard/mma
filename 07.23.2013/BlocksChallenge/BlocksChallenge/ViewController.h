//
//  ViewController.h
//  BlocksChallenge
//
//  Created by Brad Woodard on 7/23/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThresholdValueDelegate.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ThresholdValueDelegate>

- (NSInteger)retrieveThresholdNumber:(NSInteger)thresholdValue;

@end
