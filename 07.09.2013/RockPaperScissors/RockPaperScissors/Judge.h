//
//  Judge.h
//  RockPaperScissors
//
//  Created by Brad Woodard on 7/9/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComputerHand.h"

@interface Judge : NSObject


- (BOOL)didComputerWin:(ComputerHand *)computerThrow playerThrow:(NSString *)myThrow;

/*
 1. Store the value of the computer hand in an instance variable in ComputerHand
 2. Adapt your didComputerWin method to take in an NSString* and a ComputerHand* parameter
 3. Return the correct boolean based on comparing the value of the string to that of your instance variable in ComputerHand
 */


@end
