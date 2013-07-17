//
//  ViewController.m
//  MyFavoriteThings-Table
//
//  Created by Brad Woodard on 7/16/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UIButton *addThingButton;
    __weak IBOutlet UITextField *thingTextField;
    __weak IBOutlet UITableView *myTableView;
    
    NSMutableArray        *thingsArray;
    
}
- (IBAction)addThing:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    thingsArray = [[NSMutableArray alloc] initWithCapacity:10];
    [super viewDidLoad];
    
    // UI Elements
    [addThingButton setTitle:@"Add" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addThing:(id)sender {
    
    [thingsArray addObject:thingTextField.text];
    [myTableView reloadData];
    
    [thingTextField resignFirstResponder];
}


#pragma mark UITableViewDataSource

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [thingsArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [thingsArray count];
}

@end
