//
//  WebViewController.h
//  App.net
//
//  Created by Brad Woodard on 7/27/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) NSString *incomingURL;

@end
