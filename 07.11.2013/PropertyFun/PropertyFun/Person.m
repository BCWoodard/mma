//
//  Person.m
//  PropertyFun
//
//  Created by Brad Woodard on 7/11/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name;

- (void)setName:(NSString *)_name
{
    name = [NSString stringWithFormat:@"%@!!", _name];
}

@end
