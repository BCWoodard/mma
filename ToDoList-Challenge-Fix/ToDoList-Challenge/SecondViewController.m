//
//  SecondViewController.m
//  ToDoList-Challenge
//
//  Created by Brad Woodard on 7/16/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    
//    __weak IBOutlet UITextField     *updateTextField;
    __weak IBOutlet UIButton        *updateButton;
    
    AppDelegate                     *appDelegate;
    
}
- (IBAction)update:(id)sender;



@end

@implementation SecondViewController
@synthesize updateTextField;


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
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    
    [updateButton setTitle:@"Update" forState:UIControlStateNormal];
    //[updateTextField setText:[appDelegate.mutableArray objectAtIndex:appDelegate.indexToUpdate]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)update:(id)sender {
    
    //appDelegate.stringQueue = updateTextField.text;
    
    [appDelegate.mutableArray replaceObjectAtIndex:appDelegate.indexToUpdate withObject:updateTextField.text];
    
    NSLog(@"Array: %@", appDelegate.mutableArray);

    [updateTextField resignFirstResponder];
    [self.view removeFromSuperview];
}
@end
