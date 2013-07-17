//
//  ViewController.m
//  MyFavoriteThings
//
//  Created by Brad Woodard on 7/16/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITextField *myTextField;
    __weak IBOutlet UITextView  *myTextView;
    __weak IBOutlet UIButton    *addFavoriteThingButton;
    NSMutableArray              *thingsArray;
    NSString                    *textViewOutput;
    
}
- (IBAction)addFavoriteThing:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    thingsArray = [[NSMutableArray alloc] initWithCapacity:10];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    myTextView.text = @"";
    [addFavoriteThingButton setTitle:@"Add" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addFavoriteThing:(id)sender {
    
    [thingsArray addObject:[NSString stringWithFormat:@"%@", myTextField.text]];
    NSLog(@"%@", thingsArray);
    
    [myTextField resignFirstResponder];
    
    [self retrieveFromArray];
}


- (void)retrieveFromArray
{
    NSString *text;

    for (int i = 0; i < [thingsArray count]; i++) {
        text = [NSString stringWithFormat:@"%i.  %@\n", i + 1, [thingsArray objectAtIndex:i]];
    }
    
    NSLog(@"%@",text);
    /*
    for (NSString *thing in thingsArray) {
        text = [NSString stringWithFormat:@"%i.  %@\n", [thingsArray indexOfObject:thing] + 1, thing];
    }
    */
    
    myTextView.text = [NSString stringWithFormat:@"%@%@", myTextView.text, text];
}

@end
