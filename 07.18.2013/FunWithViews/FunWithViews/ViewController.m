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
    int             numberOfTouches;
    int             totalMatches;
    int             totalMisses;
    BOOL            isTimerRunning;
    NSTimeInterval  startTime;
    MyView          *firstSubview;
    MyView          *secondSubview;
    __weak IBOutlet UILabel *matchesLabel;
    __weak IBOutlet UILabel *missesLabel;
    __weak IBOutlet UIButton *startTimerButton;
}
- (IBAction)startTimer:(id)sender;
- (IBAction)resetGame:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Subviews Count: %i", [self.view.subviews count]);
    
    int i = 0;
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[MyView class]]) {
            MyView *myView = (MyView *)subview;
            myView.delegate = self;
            i++;
            NSLog(@"UIView Count: %i", i);
        }
    }
    
        
    numberOfTouches = 0;
    totalMatches = 0;
    matchesLabel.text = @"0";
    totalMisses = 0;
    missesLabel.text = @"0";
    
    // Disable buttons if isTimerRunning = NO
    
    // TIMER elements
    isTimerRunning = NO;
    
    if (!isTimerRunning) {
        for (UIView *subview in self.view.subviews) {
            if ([subview isKindOfClass:[MyView class]]) {
                subview.backgroundColor = [UIColor blueColor];
                subview.alpha = 1.0f;
                [subview setUserInteractionEnabled:NO];
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark MatchDelegate

- (void)didChooseView:(MyView *)myView
{
    if (!isTimerRunning) {
        return;
    } else {
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
            
            isTimerRunning = NO;
            [startTimerButton setTitle:@"Start" forState:UIControlStateNormal];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Congratulations!"
                                                                message:@"You've met your match."
                                                               delegate:self
                                                      cancelButtonTitle:@"Ok"
                                                       otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
}

- (void)changeSubviewBackground:(MyView *)myView
{
    myView.backgroundColor = [UIColor yellowColor];
}


- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self resetGame:self];
    }
}

- (IBAction)resetGame:(id)sender {
    
    isTimerRunning = NO;
    numberOfTouches = 0;
    totalMisses = 0;
    missesLabel.text = @"0";
    totalMatches = 0;
    matchesLabel.text = @"0";
    
    [startTimerButton setTitle:@"Start" forState:UIControlStateNormal];
    
    [self activateButtons];

}



#pragma mark TIMER
- (IBAction)startTimer:(id)sender {
        
    if (!isTimerRunning) {
        isTimerRunning = YES;
        startTime = [NSDate timeIntervalSinceReferenceDate];
        [startTimerButton setSelected:YES];
        [startTimerButton setTitle:@"Stop" forState:UIControlStateNormal];
        [self incrementTimer];
        
        // Activate buttons
        [self activateButtons];

    } else {
        isTimerRunning = NO;
        [startTimerButton setSelected:NO];
        [startTimerButton setTitle:@"Start" forState:UIControlStateNormal];
    }
}

- (void)incrementTimer
{
    if (!isTimerRunning) {
        [startTimerButton setTitle:@"Start" forState:UIControlStateNormal];
    
    } else {
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elapsedTime = currentTime - startTime;
    
    int minutes = (int)(elapsedTime / 60);
    elapsedTime -= minutes * 60;
    int seconds = (int)elapsedTime;
    elapsedTime -= seconds;
    
    [startTimerButton setTitle:[NSString stringWithFormat:@"%02d:%02d", minutes, seconds] forState:UIControlStateNormal];
    
    [self performSelector:@selector(incrementTimer) withObject:self afterDelay:1.0f];
    }
}


- (void)activateButtons
{
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[MyView class]]) {
            subview.backgroundColor = [UIColor blueColor];
            subview.alpha = 1.0f;
            [subview setUserInteractionEnabled:YES];
        }
    }

}

@end
