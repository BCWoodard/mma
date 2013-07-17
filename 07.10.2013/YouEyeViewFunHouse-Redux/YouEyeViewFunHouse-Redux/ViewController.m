//
//  ViewController.m
//  YouEyeViewFunHouse-Redux
//
//  Created by Brad Woodard on 7/10/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL isRed;
    BOOL originalLocation;
    BOOL toggleText;
    
    UIButton *changeBGColor;
    UIButton *resizeButton;
    UIButton *toggleTitle;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    // alloc & init
    changeBGColor = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIView *horizontalRule1 = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 84.0f, 320.0f, 2.0f)];
    resizeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    toggleTitle = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    // Alloc & init horizontal rules
    //UIView *horizontalRule1 = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 84.0f, 320.0f, 2.0f)];
    UIView *horizontalRule2 = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 164.0f, 320.0f, 2.0f)];
    UIView *horizontalRule3 = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 234.0f, 320.0f, 2.0f)];
    UIView *horizontalRule4 = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 304.0f, 320.0f, 2.0f)];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Set BOOL values for tracking state
    isRed = NO;
    originalLocation = YES;
    toggleText = NO;
    
    // changeColor Properties
    [changeBGColor addTarget:self
                      action:@selector(changeBackgroundColor:)
            forControlEvents:UIControlEventTouchUpInside];
    [changeBGColor setTitle:@"Change View Background Color" forState:UIControlStateNormal];
    changeBGColor.frame = CGRectMake(20.0f, 20.0f, 280.0f, 44.0f);
    [self.view addSubview:changeBGColor];
    
    // resizeButton Properties
    [resizeButton addTarget:self
                     action:@selector(changeSizeAndLocation:)
           forControlEvents:UIControlEventTouchUpInside];
    [resizeButton setTitle:@"Change Size and Location" forState:UIControlStateNormal];
    resizeButton.frame = CGRectMake(20.0f, 100.0f, 280.0f, 44.0f);
    [self.view addSubview:resizeButton];
    
    // toggleTitle Properties
    [toggleTitle addTarget:self
                    action:@selector(toggleButtonTitle:)
          forControlEvents:UIControlEventTouchUpInside];
    [toggleTitle setTitle:@"Click to Toggle Title" forState:UIControlStateNormal];
    [toggleTitle setFrame:CGRectMake(20.0f, 180.0f, 280.0f, 44.0f)];
    [self.view addSubview:toggleTitle];
    
    // horizontalRule Properties
    // #1
    horizontalRule1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:horizontalRule1];
    
    // #2
    horizontalRule2.backgroundColor = [UIColor blackColor];
    [self.view addSubview:horizontalRule2];

    // #3
    horizontalRule3.backgroundColor = [UIColor blackColor];
    [self.view addSubview:horizontalRule3];

    // #4
    horizontalRule4.backgroundColor = [UIColor blackColor];
    [self.view addSubview:horizontalRule4];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)changeBackgroundColor:(id)sender {    
    if (!isRed) {
        [self.view setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:0.6]];
        isRed = YES;
    } else {
        [self.view setBackgroundColor:[UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:255.0/255.0 alpha:0.6]];
        isRed = NO;
    }    
}


- (void)changeSizeAndLocation:(id)sender
{
    if (originalLocation) {
        [resizeButton setFrame:CGRectMake(0.0, 90.0, 320.0, 64.0)];
        originalLocation = NO;
    } else {
        [resizeButton setFrame:CGRectMake(20.0, 100.0, 280.0, 44.0)];
        originalLocation = YES;
    }
}


- (void)toggleButtonTitle:(id)sender
{
    if (!toggleText) {
        [toggleTitle setTitle:@"Change the Title Back" forState:UIControlStateNormal];
        toggleText = YES;
    } else {
        [toggleTitle setTitle:@"Click to Toggle Title" forState:UIControlStateNormal];
        toggleText = NO;
    }
}

@end
