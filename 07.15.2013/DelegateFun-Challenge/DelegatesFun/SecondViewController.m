//
//  SecondViewController.m
//  DelegatesFun
//
//  Created by Julie Caccavo on 7/15/13.
//  Copyright (c) 2013 Juliana Caccavo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () {
    
    __weak IBOutlet UITextField *colorTextField;
}
- (IBAction)makeRed:(id)sender;
- (IBAction)makeGreen:(id)sender;
- (IBAction)makeBlue:(id)sender;
- (IBAction)makeYellow:(id)sender;
- (IBAction)updateColor:(id)sender;

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

- (IBAction)makeBlue:(id)sender {
    [delegate changeColor:[UIColor blueColor]];

}

- (IBAction)makeYellow:(id)sender {
    [delegate changeColor:[UIColor yellowColor]];

}

- (IBAction)updateColor:(id)sender {
    // 1. Generate the string that we want to pass into the method
    // 2. Pass the string into the getColor: method
    // 3. Pass the (UIColor *) to the changeColor: method in ColorDelegate

    NSString *customColorString = [NSString stringWithFormat:@"%@Color", colorTextField.text]; // 1
    
    UIColor* customColor = [self getColor:customColorString]; // 2
    
    [delegate changeColor:customColor]; // 3
    
    NSLog(@"%@", colorTextField.text);
}

-(UIColor *)getColor:(NSString*)col // Passing in customColorString
{
    SEL selColor = NSSelectorFromString(col); // Create a selector from customColorString
    UIColor *color = nil;  // Ensure that the UIColor object is empty
    
    if ([UIColor respondsToSelector:selColor]) {  // if UIColor responds to selColor
        color = [UIColor performSelector:selColor];  // return [UIColor shadeColor];
    } else {
        // Alert view or other message notifying that color is not available
    }
    
    return color; // return [UIColor cyanColor] (for example)
}

@end
