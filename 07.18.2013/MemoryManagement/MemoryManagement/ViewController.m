//
//  ViewController.m
//  MemoryManagement
//
//  Created by Brad Woodard on 7/18/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSObject            *myObject;
    NSMutableArray      *myArray;
}
- (IBAction)showRetainCount:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    myObject = [[NSObject alloc] init];
    NSLog(@"Retain Count = %i", [myObject retainCount]);
    myArray = [[NSMutableArray alloc] initWithCapacity:5];
    [myObject retain];
    NSLog(@"Retain Count = %i", [myObject retainCount]);
    [myArray addObject:myObject];
    NSLog(@"Retain Count = %i", [myObject retainCount]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showRetainCount:(id)sender {
    [myObject release];
    NSLog(@"Retain Count = %i", [myObject retainCount]);
    NSLog(@"Array Retain Count = %i", [myArray retainCount]);

}
@end
