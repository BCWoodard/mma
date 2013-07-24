//
//  ThresholdViewController.h
//  BlocksChallenge
//
//  Created by Brad Woodard on 7/23/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThresholdValueDelegate.h"

@interface ThresholdViewController : UIViewController

@property (strong, nonatomic) id <ThresholdValueDelegate> delegate;
@property (strong, nonatomic) NSString *thresholdValue;

@end
