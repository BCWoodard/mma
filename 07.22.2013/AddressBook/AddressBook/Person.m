//
//  Person.m
//  AddressBook
//
//  Created by Brad Woodard on 7/22/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize firstName, lastName, email, phoneNumber;

- (Person *)initWithFirstName:(NSString *)aFirstName andLastName:(NSString *)aLastName andEmail:(NSString *)aEmail andPhoneNumber:(NSString *)aPhoneNumber
{
    Person *newPerson = [[Person alloc] init];
    newPerson.firstName = aFirstName;
    newPerson.lastName = aLastName;
    newPerson.email = aEmail;
    newPerson.phoneNumber = aPhoneNumber;
    
    return newPerson;
}

@end
