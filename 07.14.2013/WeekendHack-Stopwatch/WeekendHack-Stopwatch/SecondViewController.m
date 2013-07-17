//
//  SecondViewController.m
//  WeekendHack-Stopwatch
//
//  Created by Brad Woodard on 7/14/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    NSTimer         *countdown;
    NSTimer         *alertTimer;
    int             remainingTime;
    int             hours;
    int             minutes;
    int             seconds;
    
    
    __weak IBOutlet UILabel *timerLabel;
    __weak IBOutlet UIButton *timerStartButton;
    __weak IBOutlet UIButton *timerCancelButton;
    __weak IBOutlet UIPickerView *pickerView;
    
}

- (IBAction)timerStart:(UIButton *)sender;
- (IBAction)timerCancel:(id)sender;
- (IBAction)switchToStopwatch:(id)sender;


@end

@implementation SecondViewController

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
    
    remainingTime = 0;
    
    [self.view setBackgroundColor:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:153.0f/255.0f alpha:1.0f]];
    [timerLabel setFont:[UIFont fontWithName:@"Data Control" size:54.0f]];
    [timerLabel setText:@"00:00:00"];
    timerLabel.textColor = [UIColor whiteColor];
    [timerCancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [timerCancelButton setEnabled:NO];
    [timerCancelButton setAlpha:0.5f];
    [timerStartButton setTitle:@"Start" forState:UIControlStateNormal];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 3;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            hours = row * 3600;
            break;
            
        case 1:
            minutes = row * 60;
            break;
            
        case 2:
            seconds = row;
            break;
            
        default:
            break;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    int rowsInComponent = 0;
    
    switch (component) {
        case 0:
            rowsInComponent = 100;
            break;
        case 1:
            rowsInComponent = 60;
            break;
        case 2:
            rowsInComponent = 60;
            break;
            
        default:
            break;
    }
    
    return rowsInComponent;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    NSString *rowLabel = [[NSString alloc] init];
    switch (component) {
        case 0:
            rowLabel = [NSString stringWithFormat:@"%i Hrs", row];
            break;
        case 1:
            rowLabel = [NSString stringWithFormat:@"%i Mins", row];
            break;
        case 2:
            rowLabel = [NSString stringWithFormat:@"%i Secs", row];
            break;
            
        default:
            break;
    }
    
    return rowLabel;
    
}



- (IBAction)timerStart:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        
        remainingTime = hours + minutes + seconds;
        hours = remainingTime / 3600;
        minutes = (remainingTime % 3600) / 60;
        seconds = remainingTime % 60;
        
        [timerLabel setText:[NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds]];
        
        countdown = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countdown) userInfo:nil repeats:YES];
        
        [timerStartButton setTitle:@"Pause" forState:UIControlStateNormal];
        [timerCancelButton setAlpha:1.0f];
        [timerCancelButton setEnabled:YES];

        
    } else {
        
        [self resetPicker];
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        [countdown invalidate];
        
        }
}

- (IBAction)timerCancel:(id)sender {
    
    // 1. Invalidate the timer
    // 2. Set remainingTime to 0
    // 3. Update the label
    // 4. Change the start button back to start
    
    [countdown invalidate]; // 1
    remainingTime = 0; // 2
    [timerLabel setText:@"00:00:00"]; // 3
    [timerStartButton setTitle:@"Start" forState:UIControlStateNormal];
    [self resetPicker];
    
}


- (void)countdown {
    
    if (remainingTime > 0) {
        
        remainingTime--;
        hours = remainingTime / 3600;
        minutes = (remainingTime % 3600) / 60;
        seconds = remainingTime % 60;
        
        [timerLabel setText:[NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds]];
        
    } else {
        
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Time is Up"
                                                            message:@""
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
        [timerStartButton setTitle:@"Start" forState:UIControlStateNormal];
        [countdown invalidate];

    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [alertView cancelButtonIndex]) {
        
        [self resetPicker];
        
    }
}


- (void)resetPicker {
    [pickerView reloadAllComponents];
    [pickerView selectRow:0 inComponent:0 animated:YES];
    [pickerView selectRow:0 inComponent:1 animated:YES];
    [pickerView selectRow:0 inComponent:2 animated:YES];
}

- (IBAction)switchToStopwatch:(id)sender {
    
    [self.view removeFromSuperview];
    [countdown invalidate];
}



@end
