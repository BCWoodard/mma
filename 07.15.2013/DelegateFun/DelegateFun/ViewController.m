//
//  ViewController.m
//  DelegateFun
//
//  Created by Brad Woodard on 7/15/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    SecondViewController    *secondViewController;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    secondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview:secondViewController.view];
    secondViewController.view.center = self.view.center;
    
    // Assign value to the secondViewController delegate
    secondViewController.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ColorDelegate
- (void)changeColor:(UIColor *)color
{
    self.view.backgroundColor = color;
}

@end
