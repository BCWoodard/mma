//
//  ViewController.h
//  LocationServices
//
//  Created by Brad Woodard on 7/29/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>

// Need to import the CoreLocation Framework
// 1. Select project --> Build Phases --> + and select CoreLocation
#import <CoreLocation/CoreLocation.h>

// Ensure UIViewController adheres the CLLocationManagerDelegate
@interface ViewController : UIViewController <CLLocationManagerDelegate>

@end
