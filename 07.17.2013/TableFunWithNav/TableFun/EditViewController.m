//
//  EditViewController.m
//  TableFunWithNav
//
//  Created by Brad Woodard on 7/17/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
{
    __weak IBOutlet UITextField *editTextField;
    __weak IBOutlet UIButton *editTextFieldButton;
    
}
- (IBAction)editText:(id)sender;

@end

@implementation EditViewController
@synthesize incomingString;
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
    // Do any additional setup after loading the view from its nib.
    [editTextFieldButton setTitle:@"Update" forState:UIControlStateNormal];
    editTextField.text = incomingString;
    self.navigationItem.title = incomingString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editText:(id)sender {
    [delegate updateColor:editTextField.text];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
