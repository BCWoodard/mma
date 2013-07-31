//
//  ViewController.m
//  Notifications
//
//  Created by Brad Woodard on 7/31/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UILabel *labelOne;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [super viewDidLoad];
    
    labelOne.text = @"0";
    /*
    [notificationCenter addObserverForName:UIApplicationWillEnterForegroundNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
    }];
    */
    
    [notificationCenter addObserver:self selector:@selector(incrementCount) name:@"Touch" object:nil];
}


- (void)incrementCount
{
    // Increment logic here
    NSInteger count = [labelOne.text integerValue];
    labelOne.text = [NSString stringWithFormat:@"%i", ++count];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
