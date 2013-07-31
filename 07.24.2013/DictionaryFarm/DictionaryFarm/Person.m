//
//  Person.m
//  DictionaryFarm
//
//  Created by Brad Woodard on 7/24/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize firstName, lastName;

- (Person *)initWithFirstName:(NSString *)aFirstName andLastName:(NSString *)aLastName
{
    Person *newPerson = [[Person alloc] init];
    newPerson.firstName = aFirstName;
    newPerson.lastName = aLastName;
    
    return newPerson;
}

@end
