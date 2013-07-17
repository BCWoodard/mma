//
//  ViewController.m
//  DelegatesFun
//
//  Created by Julie Caccavo on 7/15/13.
//  Copyright (c) 2013 Juliana Caccavo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    SecondViewController *mySecondViewController;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    mySecondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview:mySecondViewController.view];
    mySecondViewController.view.center = self.view.center;
    mySecondViewController.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ColorDelegate

- (void)changeColor:(UIColor*)color{
    self.view.backgroundColor = color;
}

@end
