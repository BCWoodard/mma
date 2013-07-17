//
//  ViewController.m
//  WeekendHack-Stopwatch
//
//  Created by Brad Woodard on 7/14/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    SecondViewController *secondView;
    NSTimer         *timer;
    long long int   totalTime;
    long long int   hours;
    int             minutes;
    int             seconds;
    int             tenths;
    __weak IBOutlet UILabel *stopwatchLabel;
    __weak IBOutlet UIButton *stopwatchStartStopButton;
    __weak IBOutlet UIButton *stopwatchResetButton;
    
}

- (IBAction)stopwatchStartStop:(UIButton *)sender;
- (IBAction)stopwatchReset:(UIButton *)sender;
- (IBAction)switchToTimer:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    totalTime = 0;
    
    [self.view setBackgroundColor:[UIColor colorWithRed:51.0f/255.0f green:153.0f/255.0f blue:51.0f/255.0f alpha:0.8f]];
    stopwatchLabel.textColor = [UIColor whiteColor];
    [stopwatchLabel setFont:[UIFont fontWithName:@"Data Control" size:54.0f]];
    [stopwatchLabel setText:@"00:00:00.0"];
    [stopwatchStartStopButton setTitle:@"Start" forState:UIControlStateNormal];
    [stopwatchResetButton setTitle:@"Reset" forState:UIControlStateNormal];
    [stopwatchResetButton setEnabled:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stopwatchStartStop:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        
        // 1. Activate the timer to run at .1 second intervals
        // 2. Change the button title
        // 3. Disable the reset button
        // 4. Reduce the alpha of the button to indicate disabled
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(countUp) userInfo:nil repeats:YES]; // 1
        [stopwatchStartStopButton setTitle:@"Stop" forState:UIControlStateNormal]; // 2
        
        [stopwatchResetButton setEnabled:NO]; // 3
        [stopwatchResetButton setAlpha:0.5f]; // 4
        
    } else {
        
        // 1. Stop the timer
        // 2. Reset the start button title
        // 3. Enable the reset button
        // 4. Adjust that alpha to indicate reset is active
        
        [timer invalidate]; // 1
        [stopwatchStartStopButton setTitle:@"Start" forState:UIControlStateNormal]; // 2
        [stopwatchResetButton setEnabled:YES]; // 3
        [stopwatchResetButton setAlpha:1.0f]; // 4
        
    }
}

- (IBAction)stopwatchReset:(UIButton *)sender {
    // 1. Invalidate the timer
    // 2. Set totalTime to 0
    // 3. Update the label
    
    [timer invalidate];
    totalTime = 0; // 1
    [stopwatchLabel setText:@"00:00:00.0"]; // 2
}


- (void)countUp
{
    // 1. Increment totalTime each time the timer advances
    // Since we are incrementing by TENTHS OF A SECOND, we need a muliplier of 10
    // the time variables. So, instead of 3600 seconds, an hour will equal
    // 36,000 increments of timer
    // 2. When totalTime hits 36000, hour will increment by 1
    // 3. We only want whole values for minutes, so we divide the remainder by 600
    // 4. We want parts of a minute, so we need the %, then / by 10 (because of 1/10)
    // 5. We want to display the counter value % 10 for tenths of a second
    // 6. Display results in the stopwatch label
    
    totalTime++; // 1
    hours = (totalTime / ((60 * 60) * 10)); // 2
    minutes = (totalTime % ((60 * 60) * 10)) / 600; // 3
    seconds = (totalTime % ((60 * 60) * 10)) % 600 / 10; // 4
    tenths = (totalTime % ((60 * 60) * 10)) % 600 % 10; // 5
    
    [stopwatchLabel setText:[NSString stringWithFormat:@"%02lld:%02d:%02d.%01d", hours, minutes, seconds, tenths]]; // 6
}


- (IBAction)switchToTimer:(id)sender {
    // 1. Alloc and init the 2nd VC
    // 2. Add the secondView.view to this view controller
    // 3. Invalidate timer in case views are switched while running
    
    secondView = [[SecondViewController alloc] initWithNibName:nil bundle:nil]; // 1
    [self.view addSubview:secondView.view]; // 2
    [timer invalidate];

}

@end
