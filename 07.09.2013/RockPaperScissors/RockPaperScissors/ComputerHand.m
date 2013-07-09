//
//  ComputerHand.m
//  RockPaperScissors
//
//  Created by Brad Woodard on 7/9/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ComputerHand.h"

@implementation ComputerHand

- (NSString *)generateRandomHand
{
    NSArray *choices = @[@"Rock", @"Paper", @"Scissors"];
    NSString *generatedThrow = [choices objectAtIndex:arc4random() % 3];
    
    return generatedThrow;
}

@end
