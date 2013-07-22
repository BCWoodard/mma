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
    NSMutableArray  *scrambledTags;
    NSArray         *flags;
    
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
    //flags = @[@"Flag_of_Argentina.png", @"Flag_of_Chicago.png", @"Flag_of_Mexico.png", @"Flag_of_New_Zealand.png", @"Flag_of_South_Korea.png", @"Flag_of_Turkey.png", @"Flag_of_US.png", @"Flag_of_Venezuela.png"];
    
    // Need an array to scramble tags and subviews
    [self scrambleTags];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:102.0f/255.0f green:204.0f/255.0f blue:153.0f/255.0f alpha:1.0f]];
    numberOfTouches = 0;
    totalMatches = 0;
    matchesLabel.text = @"0";
    totalMisses = 0;
    missesLabel.text = @"0";
    
    
    // TIMER elements
    isTimerRunning = NO;
    
    if (!isTimerRunning) {
        [self deactivateButtons];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - MatchDelegate

- (void)didChooseView:(MyView *)myView
{
    if (!isTimerRunning) {
        return;
    } else {

        NSLog(@"Tag Number: %i", myView.tag);
        
        // Count the first two touches
        if (numberOfTouches == 0) {
            firstSubview = myView;
            //[self changeSubviewImage:firstSubview];
            /*
            [UIView transitionWithView:firstSubview
                              duration:0.3f
                               options:UIViewAnimationOptionTransitionFlipFromRight
                            animations:^{
                                [firstSubview.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [flags objectAtIndex:firstSubview.tag - 1]]]];
                                [firstSubview setUserInteractionEnabled:NO];
                                numberOfTouches++;
                            }
                            completion:nil];
             */
            //[firstSubview.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [flags objectAtIndex:firstSubview.tag - 1]]]];
            [firstSubview setUserInteractionEnabled:NO];
            numberOfTouches++;
            
        } else if (numberOfTouches == 1) {
            secondSubview = myView;
            /*
            [UIView transitionWithView:secondSubview
                              duration:0.3f
                               options:UIViewAnimationOptionTransitionFlipFromRight
                            animations:^{
                                [secondSubview.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [flags objectAtIndex:secondSubview.tag - 1]]]];
                                [secondSubview setUserInteractionEnabled:NO];
                                numberOfTouches++;
                            }
                            completion:nil];
             */
            //[secondSubview.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [flags objectAtIndex:secondSubview.tag - 1]]]];
            [secondSubview setUserInteractionEnabled:NO];
            numberOfTouches++;
        
        } else {
            numberOfTouches = 0;
        }
        
        // Logic for calculating a match/mismatch
        if (numberOfTouches == 2) {
            
            if (firstSubview.tag == secondSubview.tag) // MATCH
            {
                firstSubview.alpha = 0.0f;
                firstSubview.userInteractionEnabled = NO;
                secondSubview.alpha = 0.0f;
                secondSubview.userInteractionEnabled = NO;
                
                [NSThread sleepForTimeInterval:0.5f];
                
                // increment totalMatches by one
                totalMatches++;
                matchesLabel.text = [NSString stringWithFormat:@"%i", totalMatches];
                
            } else if (firstSubview.tag != secondSubview.tag) {
                
                [NSThread sleepForTimeInterval:1.0f];
                
                [firstSubview setUserInteractionEnabled:YES];
                [secondSubview setUserInteractionEnabled:YES];
                
                UIImage *image = [UIImage imageNamed:@"PlayingCardBack.png"];
                [firstSubview.imageView setImage:image];
                [secondSubview.imageView setImage:image];

                
                totalMisses++;
                missesLabel.text = [NSString stringWithFormat:@"%i", totalMisses];
                numberOfTouches = 0;
            }
                
            // Reset # of touches so we can begin matching again
            numberOfTouches = 0;
            }
            
        
        if (totalMatches == 8) {
            
            isTimerRunning = NO;
            [self deactivateButtons];
            
            [startTimerButton setTitle:@"Start" forState:UIControlStateNormal];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You've met your match!"
                                                                message:@"Congratulations! You matched all 8 flags."
                                                               delegate:self
                                                      cancelButtonTitle:@"Ok"
                                                       otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
}


- (void)changeSubviewImage:(MyView *)myView
{
/*
    [UIView transitionWithView:myView
                      duration:0.3f
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        [myView.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [flags objectAtIndex:myView.tag - 1]]]];
                        [myView setUserInteractionEnabled:NO];
                        numberOfTouches++;
                    }
                    completion:nil];
*/
    
    switch (myView.tag) {
        case 1:
            if (myView.tag == 1) {
                [myView.imageView setImage:[UIImage imageNamed:@"Flag_of_Argentina.png"]];
            }
            break;
            
        case 2:
            if (myView.tag == 2) {
                [myView.imageView setImage:[UIImage imageNamed:@"Flag_of_Chicago.png"]];
            }
            break;
            
        case 3:
            if (myView.tag == 3) {
                [myView.imageView setImage:[UIImage imageNamed:@"Flag_of_Mexico.png"]];
            }
            break;
            
        case 4:
            if (myView.tag == 4) {
                [myView.imageView setImage:[UIImage imageNamed:@"Flag_of_New_Zealand.png"]];
            }
            break;
            
        case 5:
            if (myView.tag == 5) {
                [myView.imageView setImage:[UIImage imageNamed:@"Flag_of_South_Korea.png"]];
            }
            break;
            
        case 6:
            if (myView.tag == 6) {
                [myView.imageView setImage:[UIImage imageNamed:@"Flag_of_Turkey.png"]];
            }
            break;
            
        case 7:
            if (myView.tag == 7) {
                [myView.imageView setImage:[UIImage imageNamed:@"Flag_of_US.png"]];
            }
            break;
            
        case 8:
            if (myView.tag == 8) {
                [myView.imageView setImage:[UIImage imageNamed:@"Flag_of_Venezuela.png"]];
            }
            break;

        default:
            break;
    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self resetGame:self];
        [self deactivateButtons];
    }
}



#pragma mark - TIMER
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
        [self deactivateButtons];
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

#pragma mark - SUPPORTING METHODS
- (void)activateButtons
{
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[MyView class]]) {
            MyView *myView = (MyView *)subview;
            myView.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PlayingCardBack.png"]];
            [myView addSubview:myView.imageView];
            subview.alpha = 1.0f;
            [subview setUserInteractionEnabled:YES];
        }
    }

}


- (void)deactivateButtons
{
    for (MyView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[MyView class]]) {
            [subview setUserInteractionEnabled:NO];
            subview.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PlayingCardBack.png"]];
            [subview addSubview:subview.imageView];
            subview.alpha = 1.0f;
        }
    }
}

- (IBAction)resetGame:(id)sender {
    
    isTimerRunning = NO;
    numberOfTouches = 0;
    totalMisses = 0;
    missesLabel.text = @"0";
    totalMatches = 0;
    matchesLabel.text = @"0";
    
    [self scrambleTags];
    
    [startTimerButton setTitle:@"Start" forState:UIControlStateNormal];
    
    [self deactivateButtons];
    
}


- (void)scrambleTags
{    

    scrambledTags = nil;
    
    if ([scrambledTags count] == 0) {
        scrambledTags = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", nil];

        for (int i = 0; i < 16; ++i) {
            // Select a random element between i and end of array to swap with.
            int nElements = 16 - i;
            int n = (random() % nElements) + i;
            [scrambledTags exchangeObjectAtIndex:i withObjectAtIndex:n];
        }
        NSLog(@"Scrambled Tags: %@", scrambledTags);
    }
    
    // Generate subviews
    int i = 0;
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[MyView class]]) {
            MyView *myView = (MyView *)subview;
            myView.delegate = self;
            subview.alpha = 1.0f;
            subview.tag = [[scrambledTags objectAtIndex:i] intValue];

            i++;
        }
    }
}


@end
