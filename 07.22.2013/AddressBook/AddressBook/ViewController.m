//
//  ViewController.m
//  AddressBook
//
//  Created by Brad Woodard on 7/22/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "ShowViewController.h"
#import "EditViewController.h"
#import "Person.h"

@interface ViewController ()
{
    NSMutableArray          *people;
    Person                  *person1, *person2, *person3;
    int                     path;
    
    __weak IBOutlet UITableView *myTableView;
}

@end

@implementation ViewController


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        person1 = [[Person alloc] init];
        person1.firstName = @"Stephan";
        person1.lastName = @"Duggan";
        person1.email = @"s.duggan@gmail.me";
        person1.phoneNumber = @"900-Call-Me";
        
        person2 = [[Person alloc] init];
        person2.firstName = @"Maria";
        person2.lastName = @"Escano";
        person2.email = @"mescano@gmail.me";
        person2.phoneNumber = @"900-Call-ME";

        
        person3 = [[Person alloc] init];
        person3.firstName = @"Kin";
        person3.lastName = @"Bariso";
        person3.email = @"kbariso@gmail.me";
        person3.phoneNumber = @"900-Call-KB";
        
        people = [[NSMutableArray alloc] initWithObjects:person1, person2, person3, nil];
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    EditViewController *editViewController = [[EditViewController alloc] initWithNibName:nil bundle:nil];
    editViewController.delegate = self;
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [myTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource
- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [[people objectAtIndex:indexPath.row] firstName], [[people objectAtIndex:indexPath.row] lastName]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[people objectAtIndex:indexPath.row] email]];
    return cell;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [people count];
}



#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    path = indexPath.row;
    [self performSegueWithIdentifier:@"toShowView" sender:self];
}


#pragma mark - PrepareForSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ShowViewController *showViewController = segue.destinationViewController;
    showViewController.delegate = self;
    
    for (int i = 0; i < [people count]; i++) {
        showViewController.incomingFirstName = [[people objectAtIndex:path] firstName];
        showViewController.incomingLastName = [[people objectAtIndex:path] lastName];
        showViewController.incomingEmail = [[people objectAtIndex:path] email];
        showViewController.incomingPhoneNumber = [[people objectAtIndex:path] phoneNumber];
    }
}


#pragma mark - DELEGATE

- (void)editRecord:(Person *)updatedPerson
{
    NSLog(@"%@", updatedPerson);
    [people replaceObjectAtIndex:path withObject:updatedPerson];
    [myTableView reloadData];
}

- (void)updateLabels
{
    return;
}

@end
