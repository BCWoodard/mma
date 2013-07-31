//
//  WebViewController.h
//  Wikipedia
//
//  Created by Brad Woodard on 7/26/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) NSString *incomingURL;

@end
