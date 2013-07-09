//
//  ViewController.m
//  Palindrome
//
//  Created by Don Bora on 4/28/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import <stdlib.h>
#import <math.h>
#import <string.h>

@interface ViewController ()
{
    __weak IBOutlet UITextField *inputTextField;
    __weak IBOutlet UILabel *resultLabel;
    
    int result;
}
- (IBAction)check:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showIsPalindrome
{
    resultLabel.text = @"IS a palindrome!";
}

-(void)showIsNotPalindrome
{
    resultLabel.text = @"Is NOT a palindrome!";
}


-(const char*)getCharacterArray
{
    return [inputTextField.text UTF8String];
}


-(void)showResult
{
    resultLabel.text = [NSString stringWithFormat:@"%i", result];
}


-(void)checkForPalindrome
{
    const char* arrayOfCharacters = [self getCharacterArray];
    BOOL isPalindrome = NO;
    
    int stringLength = strlen(arrayOfCharacters);
    NSLog(@"String length: %i", stringLength);

    for (int i = 0; i < strlen(arrayOfCharacters)/2; i++) {
        if (arrayOfCharacters[i] == arrayOfCharacters[(stringLength - i - 1)]) {
            isPalindrome = YES;
        } else {
            isPalindrome = NO;
            break;
        }
    }
    
    if (isPalindrome) {
        [self showIsPalindrome];
    }
    else {
        [self showIsNotPalindrome];
    }    
}


-(void)sumIntegers
{
    const char* arrayOfCharacters = [self getCharacterArray];
    /*
    char firstChar = arrayOfCharacters[0];
    char secondChar = arrayOfCharacters[1];
    char thirdChar = arrayOfCharacters[2];
    char fourthChar = arrayOfCharacters[3];
    char fifthChar = arrayOfCharacters[4];
     
    NSLog(@"First character: %c", firstChar);
    NSLog(@"Second character: %c", secondChar);
    NSLog(@"Third character: %c", thirdChar);
    NSLog(@"Fourth character: %c", fourthChar);
    NSLog(@"Fifth character: %c", fifthChar);
    */
    
    for (int i = 0; i < strlen(arrayOfCharacters); i++) {
        if (arrayOfCharacters[i] %2) {
            NSLog(@"%c is an even index", arrayOfCharacters[i]);
            int x = atoi(&arrayOfCharacters[i]);
            result = result + x;
            NSLog(@"Result = %i", result);
            
        } 
        
    }
    // parse out the commas, sum up the integers and assign the answer to the variable result
    // i.e.
    // result =

    [self showResult];
}

- (IBAction)check:(id)sender
{
    //[self checkForPalindrome];

    // Uncomment the following line of code and comment out the previous line of code to run summation
    [self sumIntegers];
    result = 0;
}

@end
