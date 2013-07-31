//
//  Person.h
//  DictionaryFarm
//
//  Created by Brad Woodard on 7/24/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;

- (Person *)initWithFirstName:(NSString *)aFirstName andLastName:(NSString *)aLastName;

@end
