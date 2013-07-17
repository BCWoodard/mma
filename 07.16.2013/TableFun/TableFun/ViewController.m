//
//  ViewController.m
//  TableFun
//
//  Created by Brad Woodard on 7/16/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITextField *myTextField;
    NSMutableArray      *array;
    __weak IBOutlet UITableView *myTableView;
}

- (IBAction)changeLabel:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Alloc and init the array with capacity and then add objects
    array = [[NSMutableArray alloc] initWithCapacity:10];
    [array addObject:@"Red"];
    [array addObject:@"Blue"];
    [array addObject:@"Green"];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeLabel:(id)sender
{
    // When the button is selected, do the following:
    // 1. Add the string to the array
    // 2. Display the new string in the table
    // 3. Clear the keyboard
    
    [array addObject:myTextField.text]; // 1
    [myTableView reloadData];             // 2
    [myTextField resignFirstResponder]; // 3
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
    
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    return cell;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}



#pragma mark UITableViewDelegate



@end
