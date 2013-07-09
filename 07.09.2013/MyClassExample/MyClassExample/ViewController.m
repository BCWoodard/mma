//
//  ViewController.m
//  MyClassExample
//
//  Created by Brad Woodard on 7/9/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    MyClass *myClass = [[MyClass alloc] init];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [myClass describeMe:@"Como estas?" myTaxID:55];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
