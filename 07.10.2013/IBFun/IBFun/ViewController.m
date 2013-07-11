//
//  ViewController.m
//  IBFun
//
//  Created by Brad Woodard on 7/10/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UILabel     *myFirstLabel;
    __weak IBOutlet UITextField *myFirstTextField;
    SecondViewController        *secondView;
}

- (IBAction)changeText:(id)sender;
- (IBAction)openSecondView:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeText:(id)sender {
    
    myFirstLabel.text = myFirstTextField.text;
}

- (IBAction)openSecondView:(id)sender {
    secondView = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview:secondView.view];
    
}
@end
