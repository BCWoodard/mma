//
//  ViewController.m
//  PropertyFun
//
//  Created by Brad Woodard on 7/11/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
{
    Person *firstPerson;
    Person *secondPerson;
    Person *thirdPerson;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    firstPerson = [[Person alloc] init];
    secondPerson = [[Person alloc] init];
    thirdPerson = [[Person alloc] init];
    
    firstPerson.name = @"Rex";
    nameLabel.text = firstPerson.name;
    
    // secondPerson.name = @"Mike";
    // nameLabel2.text = secondPerson.name;
    [secondPerson setName:@"Tom"];
    NSLog(@"%@", [secondPerson name]);
    [nameLabel2 setText:[secondPerson name]];
    
    thirdPerson.name = @"Jill";
    nameLabel3.text = thirdPerson.name;
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)change:(UIButton *)sender {
    
    if (sender.tag == 1) {
        nameLabel.text = nameTextField.text;
    } else if (sender.tag == 2) {
        nameLabel2.text = nameTextField.text;
    } else {
        nameLabel3.text = nameTextField.text;
    }
}

@end
