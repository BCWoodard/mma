//
//  ViewController.m
//  BlockCalculator
//
//  Created by Brad Woodard on 7/23/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UITextField *textField1;
    __weak IBOutlet UITextField *textField2;
    __weak IBOutlet UILabel *label1;
    __weak IBOutlet UILabel *label2;
    __weak IBOutlet UILabel *resultLabel;
    __weak IBOutlet UILabel *operandLabel;
}
- (IBAction)calculate:(id)sender;

@end

/*
typedef NSInteger (^mathType)(NSInteger, NSInteger);
mathType add = ^(NSInteger int1, NSInteger int2){return int1 + int2;};
mathType subtract = ^(NSInteger int1, NSInteger int2){return int1 - int2;};


NSInteger add(int int1, int int2)
{
    return int1 + int2;
}
*/

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


- (NSInteger)calculateNumber:(NSInteger)int1 toNumber:(NSInteger)int2 usingBlock:(NSInteger (^)(NSInteger, NSInteger))mathBlock
{
    return mathBlock(int1, int2);
}

- (IBAction)calculate:(UIButton *)sender {
    
    // mathType block;
    // NSInteger newNumber = add(textField1.text.intValue, textField2.text.intValue);
    NSInteger newNumber;
    
    label1.text = textField1.text;
    label2.text = textField2.text;
    
    if (sender.tag == 0) {
        
        operandLabel.text = @"+";
        
        newNumber = [self calculateNumber:textField1.text.intValue
                                 toNumber:textField2.text.intValue
                               usingBlock:^NSInteger (NSInteger int1, NSInteger int2){
                                   return int1 + int2;
                               }];
        
    } else if (sender.tag == 1) {
        
        operandLabel.text = @"-";

        newNumber = [self calculateNumber:textField1.text.intValue
                                 toNumber:textField2.text.intValue
                               usingBlock:^NSInteger (NSInteger int1, NSInteger int2){
                                   return int1 - int2;
                               }];
        
    } else if (sender.tag == 2) {
        
        operandLabel.text = @"*";
        
        newNumber = [self calculateNumber:textField1.text.intValue
                                 toNumber:textField2.text.intValue
                               usingBlock:^NSInteger (NSInteger int1, NSInteger int2){
                                   return int1 * int2;
                               }];
    } else {
        
        operandLabel.text = @"/";
        
        newNumber = [self calculateNumber:textField1.text.intValue
                                 toNumber:textField2.text.intValue
                               usingBlock:^NSInteger (NSInteger int1, NSInteger int2){
                                   return int1 / int2;
                               }];
    }
    
    resultLabel.text = [NSString stringWithFormat:@"%i", newNumber];
}
@end
