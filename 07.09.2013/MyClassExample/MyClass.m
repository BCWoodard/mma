//
//  MyClass.m
//  MyClassExample
//
//  Created by Brad Woodard on 7/9/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

- (void)describeMe:(NSString *)myString myTaxID:(int)taxID
{
    NSLog(@"Hola Mundo! %@. My Tax ID is: %i", myString, taxID);
}

@end
