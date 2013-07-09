//
//  Judge.m
//  RockPaperScissors
//
//  Created by Brad Woodard on 7/9/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "Judge.h"


// By comparing the strings, determine if the computer won and return the boolean
@implementation Judge


- (BOOL)didComputerWin:(NSString *)computerThrow playerThrow:(NSString *)myThrow
{   
    if ([computerThrow isEqual:@"Rock"]) {
        if ([myThrow isEqual:@"Scissors"]) {
            return YES;
        } else {
             return NO;
        }
        
    } else if ([computerThrow isEqual:@"Paper"]) {
        if ([myThrow isEqual:@"Rock"]) {
            return YES;
        } else {
            return NO;
        }
        
    } else {                                        // Computer throws "Scissors"
        if ([myThrow isEqual:@"Paper"]) {
            return YES;
        } else {
            return NO;
        }
    }
}

@end