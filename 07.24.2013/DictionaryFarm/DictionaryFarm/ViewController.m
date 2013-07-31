//
//  ViewController.m
//  DictionaryFarm
//
//  Created by Brad Woodard on 7/24/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableDictionary *personDictionary = [[NSMutableDictionary alloc] initWithCapacity:3];
    NSMutableArray *people = [[NSMutableArray alloc] initWithCapacity:2];
    
    Person *person1 = [[Person alloc] initWithFirstName:@"Don" andLastName:@"Aldredi"];
    Person *person2 = [[Person alloc] initWithFirstName:@"Andres" andLastName:@"Benger"];
    Person *person3 = [[Person alloc] initWithFirstName:@"Eddie" andLastName:@"Benger"];
    
    [people addObject:person2];
    [people addObject:person3];
    
    [personDictionary setObject:person1 forKey:@"A"];
    [personDictionary setObject:people forKey:@"B"];
    
    [self describeDictionary:personDictionary];
    
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)describeDictionary:(NSDictionary *)dictionary
{
    NSLog(@"\nDictionary Keys: %@", [dictionary allKeys]);
    NSLog(@"\nDictionary Values: %@", [dictionary allValues]);
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        if ([value isKindOfClass:[Person class]]) {
            NSLog(@"\nName: %@ %@", ((Person *) value).firstName, ((Person *) value).lastName);
            
        } else if ([value isKindOfClass:[NSArray class]]) {
            NSArray *array = (NSArray *) value;
            [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                Person *person = (Person *) obj;
                NSLog(@"\nName: %@ %@", person.firstName, person.lastName);
            }];
        }
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
