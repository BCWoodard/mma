//
//  ViewController.m
//  FunWithViews
//
//  Created by Brad Woodard on 7/18/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()
{
    int         numberOfTouches;
    int         totalMatches;
    int         totalMisses;
    MyView      *firstSubview;
    MyView      *secondSubview;
    __weak IBOutlet UILabel *gameTimer;
    __weak IBOutlet UILabel *matchesLabel;
    __weak IBOutlet UILabel *missesLabel;
}
- (IBAction)resetGame:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[MyView class]]) {
            MyView *myView = (MyView *)subview;
            myView.delegate = self;
        }
    }
    
        
    numberOfTouches = 0;
    totalMatches = 0;
    matchesLabel.text = @"0";
    totalMisses = 0;
    missesLabel.text = @"0";

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}



#pragma mark MatchDelegate

- (void)didChooseView:(MyView *)myView
{
    myView.backgroundColor = [UIColor yellowColor];
    
    // Count the first two touches
    if (numberOfTouches == 0) {
        firstSubview = myView;
        firstSubview.backgroundColor = [UIColor yellowColor];
        numberOfTouches++;
        
    } else if (numberOfTouches == 1) {
        secondSubview = myView;
        secondSubview.backgroundColor = [UIColor yellowColor];
        numberOfTouches++;
    
    } else {
        numberOfTouches = 0;
    }
 
    // [NSThread sleepForTimeInterval:1.0f];
    
    // Logic for calculating a match/mismatch
    if (numberOfTouches == 2) {
        
        if (firstSubview.tag == secondSubview.tag) // MATCH
        {
            firstSubview.backgroundColor = [UIColor greenColor];
            firstSubview.alpha = 0.5f;
            firstSubview.userInteractionEnabled = NO;
            secondSubview.backgroundColor = [UIColor greenColor];
            secondSubview.alpha = 0.5f;
            secondSubview.userInteractionEnabled = NO;
            
            // increment totalMatches by one
            totalMatches++;
            matchesLabel.text = [NSString stringWithFormat:@"%i", totalMatches];
            
        } else if (firstSubview.tag != secondSubview.tag) {
            
            [NSThread sleepForTimeInterval:1.0f];
            
            firstSubview.backgroundColor = [UIColor blueColor];
            secondSubview.backgroundColor = [UIColor blueColor];
            
            totalMisses++;
            missesLabel.text = [NSString stringWithFormat:@"%i", totalMisses];
            numberOfTouches = 0;
        }
            
        // Reset # of touches so we can begin matching again
        numberOfTouches = 0;
        }
        
    
    if (totalMatches == 8) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Congratulations!"
                                                            message:@"You've met your match."
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                   otherButtonTitles:nil, nil];
        [alertView show];
        
        /*
        for (UIView *subview in self.view.subviews) {
            if ([subview isKindOfClass:[MyView class]]) {
                subview.backgroundColor = [UIColor blueColor];
                subview.alpha = 1.0f;
            }
        }
        */
    }
}

- (void)changeSubviewBackground:(MyView *)myView
{
    myView.backgroundColor = [UIColor yellowColor];
}


- (IBAction)resetGame:(id)sender {
    
    numberOfTouches = 0;
    totalMisses = 0;
    missesLabel.text = @"0";
    totalMatches = 0;
    matchesLabel.text = @"0";
    
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[MyView class]]) {
            subview.backgroundColor = [UIColor blueColor];
            subview.alpha = 1.0f;
            [subview setUserInteractionEnabled:YES];
        }
    }
}
@end
