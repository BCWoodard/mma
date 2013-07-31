//
//  SecondViewController.m
//  WordBrowser
//
//  Created by Brad Woodard on 7/24/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    __weak IBOutlet UITextView *definitionTextView;
    __weak IBOutlet UILabel *synonym1Label;
    __weak IBOutlet UILabel *synonym2Label;
    
}

@end

@implementation SecondViewController
@synthesize incomingDefinition;
@synthesize incomingSynonym1;
@synthesize incomingSynonym2;

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
    
    // UI Elements
    definitionTextView.text = incomingDefinition;
    synonym1Label.text = incomingSynonym1;
    synonym2Label.text = incomingSynonym2;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
