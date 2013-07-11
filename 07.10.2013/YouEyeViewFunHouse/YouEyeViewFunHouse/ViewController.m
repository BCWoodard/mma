//
//  ViewController.m
//  ViewFunHouse
//
//  Created by keith Alperin on 4/30/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL isRed;
    BOOL originalLocation;
    BOOL toggleText;
    __weak IBOutlet UIButton *resizeMe;
    __weak IBOutlet UIButton *toggleTextTitle;
    __weak IBOutlet UIImageView *mobileMakersImage;
    __weak IBOutlet UILabel *sliderLabel;
    __weak IBOutlet UISlider *mySlider;
}

- (IBAction)changeColor:(id)sender;
- (IBAction)resizeButton:(id)sender;
- (IBAction)toggleText:(id)sender;
- (IBAction)colorize:(id)sender;
- (IBAction)sliderValueChanged:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    isRed = NO;
    originalLocation = YES;
    toggleText = NO;
    
    // mobileMakersImage = [[UIImageView alloc] init]; - this allocation and initialization is not necessary because anything you put into the xib interface is automatically alloc/init.
    
    [mobileMakersImage setImage:[UIImage imageNamed:@"MobileMakersLogo_black_and_white.png"]];
    mySlider.value = 0.0f;

}

- (IBAction)changeColor:(id)sender {
    if (!isRed) {
        [self.view setBackgroundColor:[UIColor redColor]];
        
        isRed = YES;
    } else {
        [self.view setBackgroundColor:[UIColor blueColor]];
        
        isRed = NO;
    }
}

- (IBAction)resizeButton:(id)sender {
   if (originalLocation){
        resizeMe.frame = CGRectMake(20.0, 91.0, 320.0, 64.0);
        originalLocation = NO;
    } else {
        resizeMe.frame = CGRectMake(20.0, 71.0, 281.0, 44.0);
        originalLocation = YES;
    }
}

- (IBAction)toggleText:(id)sender {
    if (!toggleText) {
        [toggleTextTitle setTitle:@"On" forState:UIControlStateNormal];
        toggleText = YES;
    } else {
        [toggleTextTitle setTitle:@"Off" forState:UIControlStateNormal];
        toggleText = NO;
    }
}

- (IBAction)colorize:(id)sender {
    [mobileMakersImage setImage:[UIImage imageNamed:@"MobileMakersLogo_color.png"]];
}

- (IBAction) sliderValueChanged:(id)sender {
    [sliderLabel setText:[NSString stringWithFormat:@"%.2f", mySlider.value]];
}

@end




















