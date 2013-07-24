//
//  ThresholdViewController.m
//  BlocksChallenge
//
//  Created by Brad Woodard on 7/23/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ThresholdViewController.h"

@interface ThresholdViewController ()
{
    __weak IBOutlet UITextField *thresholdTextEdit;
}

@end

@implementation ThresholdViewController
@synthesize delegate;
@synthesize thresholdValue;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)viewWillDisappear:(BOOL)animated
{
    thresholdValue = thresholdTextEdit.text;
    [delegate retrieveThresholdNumber:[thresholdValue intValue]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
