//
//  ViewController.m
//  RockPaperScissors
//
//  Created by Don Bora on 4/24/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "Judge.h"
#import "ComputerHand.h"

@interface ViewController ()
{
    NSArray*                choices;
    NSTimer*                timer;
    Judge*                  hand;
    ComputerHand*           generatedHand;
    int                     count;
    NSString*               computerThrow;
    

    __weak IBOutlet UILabel *countDownLabel;
    __weak IBOutlet UILabel *computerHandLabel;
    __weak IBOutlet UILabel *playerHandLabel;
}
- (IBAction)start:(id)sender;
- (IBAction)rock:(id)sender;
- (IBAction)paper:(id)sender;
- (IBAction)scissors:(id)sender;
@end

@implementation ViewController

-(void)showWinner
{        
    BOOL computerWon = [hand didComputerWin:computerHandLabel.text playerThrow:playerHandLabel.text];

    if ([computerHandLabel.text isEqualToString:playerHandLabel.text]) {
        computerHandLabel.backgroundColor = [UIColor greenColor];
        playerHandLabel.backgroundColor = [UIColor greenColor];
        countDownLabel.text = @"It's a TIE!";
    } else if (computerWon) {
        computerHandLabel.backgroundColor = [UIColor greenColor];
        countDownLabel.text = @"Computer WINS!";
        NSLog(@"Computer Wins!");
    }
    else {
        playerHandLabel.backgroundColor = [UIColor greenColor];
        countDownLabel.text = @"Player WINS!";
        NSLog(@"Player Wins!");
    }
}


- (void)viewDidLoad
{    
    hand = [[Judge alloc] init];
    generatedHand = [[ComputerHand alloc] init];
    
    [super viewDidLoad];

    choices = @[@"Rock", @"Paper", @"Scissors"];
    count = 3;
    
    [self updateCount];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateCount
{
    countDownLabel.text = [NSString stringWithFormat:@"%i", count];
}


-(void)countDown
{
    count--;
    [self updateCount];
    
    if (count == 0) {
        [timer invalidate];
        count = 4;
        computerHandLabel.text = [generatedHand generateRandomHand];
        [self showWinner];
    }
    

}


- (IBAction)start:(id)sender
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    
    playerHandLabel.backgroundColor = [UIColor whiteColor];
    playerHandLabel.text = @"";
    computerHandLabel.backgroundColor = [UIColor whiteColor];
    computerHandLabel.text = @"";
}

- (IBAction)rock:(id)sender
{
    playerHandLabel.text = @"Rock";
    // [self showWinner];  // Moved to countDown
}

- (IBAction)paper:(id)sender
{
    playerHandLabel.text = @"Paper";
    // [self showWinner];  // Moved to countDown
}

- (IBAction)scissors:(id)sender
{
    playerHandLabel.text = @"Scissors";
    // [self showWinner];  // Moved to countDown
}


@end
