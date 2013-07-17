//
//  SecondViewController.m
//  DelegateFun
//
//  Created by Brad Woodard on 7/15/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

- (IBAction)makeRed:(id)sender;
- (IBAction)makeGreen:(id)sender;


@end

@implementation SecondViewController

@synthesize delegate;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)makeRed:(id)sender {
    [delegate changeColor:[UIColor redColor]];
}

- (IBAction)makeGreen:(id)sender {
    [delegate changeColor:[UIColor greenColor]];
}
@end
