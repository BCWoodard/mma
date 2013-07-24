//
//  EditViewController.m
//  AddressBook
//
//  Created by Brad Woodard on 7/22/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "EditViewController.h"
#import "ShowViewController.h"
#import "Person.h"

@interface EditViewController ()
{
    __weak IBOutlet UITextField *editFirstNameTextField;
    __weak IBOutlet UITextField *editLastNameTextField;
    __weak IBOutlet UITextField *editEmailTextField;
    __weak IBOutlet UITextField *editPhoneTextField;
}
- (IBAction)saveRecord:(id)sender;
- (IBAction)cancelEdit:(id)sender;


@end

@implementation EditViewController

@synthesize delegate;
@synthesize editFirstName;
@synthesize editLastName;
@synthesize editEmail;
@synthesize editPhoneNumber;

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
    editFirstNameTextField.text = editFirstName;
    editLastNameTextField.text = editLastName;
    editEmailTextField.text = editEmail;
    editPhoneTextField.text = editPhoneNumber;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveRecord:(id)sender {

    /*
    Person *updatedPerson = [[Person alloc] initWithFirstName:editFirstNameTextField.text andLastName:editLastNameTextField.text andEmail:editEmailTextField.text andPhoneNumber:editPhoneTextField.text];
    NSLog(@"Updated Person: \n%@ %@\n%@\n%@\n", updatedPerson.firstName, updatedPerson.lastName, updatedPerson.email, updatedPerson.phoneNumber);
    
    
    delegate.in = editViewController.editFirstName;
    lastNameLabel.text = editViewController.editLastName;
    emailLabel.text = editViewController.editEmail;
    phoneNumberLabel.text = editViewController.editPhoneNumber;
    
    [delegate updateLabels];
    */
    Person *editPerson = [[Person alloc] initWithFirstName:editFirstNameTextField.text andLastName:editLastNameTextField.text andEmail:editEmailTextField.text andPhoneNumber:editPhoneTextField.text];
    
    [delegate editRecord:editPerson];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)cancelEdit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
