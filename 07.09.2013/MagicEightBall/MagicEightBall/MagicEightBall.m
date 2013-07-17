//
//  MagicEightBall.m
//  MagicEightBall
//
//  Created by Brad Woodard on 7/9/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "MagicEightBall.h"

@implementation MagicEightBall

- (NSString *)returnRandomString
{
    NSArray *randomStrings = @[@"Not Likely.", @"All signs point to maybe.", @"Definitely yes!"];
    NSString *zippityDooDah = [randomStrings objectAtIndex:arc4random() % 3];
    
    return zippityDooDah;
}

@end
