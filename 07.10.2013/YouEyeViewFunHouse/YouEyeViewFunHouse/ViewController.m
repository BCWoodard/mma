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
    __weak IBOutlet UILabel *sliderLabel;
    __weak IBOutlet UILabel *firstValue;
    __weak IBOutlet UILabel *secondValue;
    __weak IBOutlet UILabel *sumLabel;
    __weak IBOutlet UISlider *mySlider;
    __weak IBOutlet UIImageView *mobileMakersImage;
}

- (IBAction)changeColor:(id)sender;
- (IBAction)resizeButton:(id)sender;
- (IBAction)toggleText:(id)sender;
- (IBAction)colorize:(id)sender;
- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)calculateSum:(id)sender;

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
    
    [self.view setBackgroundColor:[UIColor whiteColor]];

    [mobileMakersImage setImage:[UIImage imageNamed:@"MobileMakersLogo_black_and_white.png"]];
    mySlider.value = 0.0f;

}

- (IBAction)changeColor:(id)sender {
    if (!isRed) {
        [self.view setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.6]];
        
        isRed = YES;
    } else {
        [self.view setBackgroundColor:[UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:255.0/255.0 alpha:0.6]];
        
        isRed = NO;
    }
}

- (IBAction)resizeButton:(id)sender {
   if (originalLocation){
       [resizeMe setFrame:CGRectMake(0.0, 91.0, 320.0, 64.0)];
        originalLocation = NO;
    } else {
        [resizeMe setFrame:CGRectMake(20.0, 71.0, 281.0, 44.0)];
        originalLocation = YES;
    }
}

- (IBAction)toggleText:(id)sender {
    if (!toggleText) {
        [toggleTextTitle setTitle:@"Change the Title Back" forState:UIControlStateNormal];
        toggleText = YES;
    } else {
        [toggleTextTitle setTitle:@"Change the Title" forState:UIControlStateNormal];
        toggleText = NO;
    }
}

- (IBAction)colorize:(id)sender {
    [mobileMakersImage setImage:[UIImage imageNamed:@"MobileMakersLogo_color.png"]];
}

- (IBAction) sliderValueChanged:(id)sender {
    [sliderLabel setText:[NSString stringWithFormat:@"%.2f", mySlider.value]];
}

- (IBAction)calculateSum:(id)sender {
    int firstEnteredValue = [firstValue.text intValue];
    int secondEnteredValue = [secondValue.text intValue];
    sumLabel.text = [NSString stringWithFormat:@"%i", (firstEnteredValue + secondEnteredValue)];
}


@end




















