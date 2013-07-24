//
//  ShowViewController.m
//  AddressBook
//
//  Created by Brad Woodard on 7/22/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ShowViewController.h"
#import "EditViewController.h"

@interface ShowViewController ()
{
    __weak IBOutlet UILabel *firstNameLabel;
    __weak IBOutlet UILabel *lastNameLabel;
    __weak IBOutlet UILabel *emailLabel;
    __weak IBOutlet UILabel *phoneNumberLabel;
    EditViewController      *editViewController;
}

@end

@implementation ShowViewController
@synthesize incomingFirstName;
@synthesize incomingLastName;
@synthesize incomingEmail;
@synthesize incomingPhoneNumber;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@ %@", incomingFirstName, incomingLastName];
    
    
    [self setContactFields];

}


- (void)viewWillDisappear:(BOOL)animated
{
    // Create the person object
    // run the delegate method
    Person *editPerson = [[Person alloc] initWithFirstName:firstNameLabel.text andLastName:lastNameLabel.text andEmail:emailLabel.text andPhoneNumber:phoneNumberLabel.text];
    
    [delegate editRecord:editPerson];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    editViewController = segue.destinationViewController;
    editViewController.delegate = self;
    
    editViewController.editFirstName = incomingFirstName;
    editViewController.editLastName = incomingLastName;
    editViewController.editEmail = incomingEmail;
    editViewController.editPhoneNumber = incomingPhoneNumber;
}

- (void)editEntry
{
    editViewController = [[EditViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:editViewController animated:YES];
}

- (void)setContactFields
{
    firstNameLabel.text = incomingFirstName;
    lastNameLabel.text = incomingLastName;
    emailLabel.text = incomingEmail;
    phoneNumberLabel.text = incomingPhoneNumber;
}


#pragma mark - DELEGATE
- (void)editRecord:(Person *)updatedPerson
{
    NSLog(@"Person Object: %@", updatedPerson);
    firstNameLabel.text = updatedPerson.firstName;
    lastNameLabel.text = updatedPerson.lastName;
    emailLabel.text = updatedPerson.email;
    phoneNumberLabel.text = updatedPerson.phoneNumber;
}

@end
