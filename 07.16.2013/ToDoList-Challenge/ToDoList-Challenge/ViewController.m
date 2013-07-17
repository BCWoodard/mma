//
//  ViewController.m
//  ToDoList-Challenge
//
//  Created by Brad Woodard on 7/16/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
    
    __weak IBOutlet UITextField *toDoTextField;
    __weak IBOutlet UIButton *addToDoButton;
    __weak IBOutlet UITableView *myTableView;
    
    NSMutableArray          *toDoItems;
    AppDelegate             *appDelegate;
    SecondViewController    *secondViewController;
    int                     updatedRow;
    
}

- (IBAction)addToDo:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    // 1. Allocate and initialize mutable array from AppDelegate
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; // 1
    
    [super viewDidLoad];
    
    // Update UI Elements
    [addToDoButton setTitle:@"Add" forState:UIControlStateNormal];

    // Establish a timer to reload myTableView
    [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(updateTable) userInfo:nil repeats:YES];

}


- (void)updateTable
{
    [myTableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addToDo:(id)sender {
    
    [appDelegate.mutableArray addObject:toDoTextField.text];
    [myTableView reloadData];
    
    [toDoTextField resignFirstResponder];

}


#pragma mark UITableViewDataSource
- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"To Do List";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.text = [appDelegate.mutableArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [appDelegate.mutableArray count];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // When accessory button is tapped, we want a new view to appear.
    // 1. Allocate and initialize 2nd view controller
    // 2. Add the new .view to self.view
    
    //appDelegate.stringQueue = [toDoItems objectAtIndex:indexPath.row];
    appDelegate.indexToUpdate = [appDelegate.mutableArray indexOfObject:[appDelegate.mutableArray objectAtIndex:indexPath.row]];
    
    secondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil]; // 1
    [self.view addSubview:secondViewController.view]; // 2

}


@end
