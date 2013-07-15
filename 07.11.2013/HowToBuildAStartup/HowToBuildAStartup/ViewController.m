//
//  ViewController.m
//  HowToBuildAStartup
//
//  Created by Kin Bariso on 7/11/13.
//  Copyright (c) 2013 Kin Bariso. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Employee.h"
#import "Manager.h"
#import "Startup.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //Person *person = [[Person alloc] init];
    Employee *employee = [[Employee alloc] init];
    Manager *manager = [[Manager alloc] init];
    Startup *startup = [[Startup alloc] init];
    
    startup.boss.name = @"Don Bora";
    manager.email = @"don@mma.co";
    manager.numberOfDirectReports = 4;
    NSLog(@"\nRole: %@\nManager name: %@\nManager email:%@\nDirect Reports: %i\n", employee.type, startup.boss.name, manager.email, manager.numberOfDirectReports);
    
    employee.type = @"Project Manager";
    employee.name = @"Ryan Striker";
    employee.email = @"ryan@mma.com";
    NSLog(@"\n\nRole: %@\nName: %@\nEmail: %@\n", employee.type, employee.name, employee.email);

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
