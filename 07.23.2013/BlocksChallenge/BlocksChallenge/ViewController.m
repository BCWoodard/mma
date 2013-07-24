//
//  ViewController.m
//  BlocksChallenge
//
//  Created by Brad Woodard on 7/23/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThresholdViewController.h"

@interface ViewController ()
{
    NSMutableArray              *randomNumbers;
    NSMutableArray              *evenNumbers;
    NSMutableArray              *oddNumbers;
    NSMutableArray              *thresholdNumbers;
    
    ThresholdViewController     *thresholdViewController;
}

- (IBAction)filterNumbers:(UIBarButtonItem *)sender;
- (IBAction)defineThreshold:(UIBarButtonItem *)sender;


@end

#define TOTAL_NUMBER_OF_RANDOM  10000

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //
        // create our randomNumbers array and populate with random numbers
        // I used #define just to try something new
        //
        randomNumbers = [[NSMutableArray alloc] initWithCapacity:50];
        
        for (int i = 0; i < 50; i++) {
            NSNumber *random = [NSNumber numberWithInt:arc4random() % TOTAL_NUMBER_OF_RANDOM];
            
            [randomNumbers addObject:random];
        }
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //
    // Create an even number array and an odd number array to accept values from
    // the randomNumbers array. These arrays are what we'll pass to the 2nd VC
    //
    evenNumbers = [[NSMutableArray alloc] init];
    oddNumbers = [[NSMutableArray alloc] init];
    thresholdNumbers = [[NSMutableArray alloc] init];

    
    //
    // enumerateObjectsUsingBlock iterates thru randomNumbers array, determines even
    // or odd and adds each object to its respective array
    //
    [randomNumbers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj intValue] % 2 == 0) {
            [evenNumbers addObject:obj];
            
        } else {
            [oddNumbers addObject:obj];
        }
    }];
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


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"%i Random Numbers", [randomNumbers count]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    //
    // Have to use stringWithFormat: because randomNumbers are NSNumbers
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [randomNumbers objectAtIndex:indexPath.row]];
    return cell;
}


- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [randomNumbers count];
}

- (IBAction)filterNumbers:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"toSecondView" sender:sender];
}

- (IBAction)defineThreshold:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toThreshold" sender:sender];
}


// We need to know which button was pushed in order to send the correct array
// to the 2nd VC so we replace sender:(id) with sender:(UIBarButtonItem *) in
// prepareForSegue.
//
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIBarButtonItem *)sender
{
    // setup the 2nd VC and pass local array to 2nd VC property incomingArray
    SecondViewController *secondViewController = segue.destinationViewController;
    
    // setup threshold VC
    thresholdViewController = segue.destinationViewController;
        
    if (sender.tag==0) {
        secondViewController.incomingArray = oddNumbers;
        secondViewController.navigationItem.title = @"Odd Numbers";

    } else if (sender.tag == 1) {
        secondViewController.incomingArray = evenNumbers;
        secondViewController.navigationItem.title = @"Even Numbers";

    } else {
        thresholdViewController.delegate = self;
        thresholdViewController.navigationItem.title = @"Set Threshold";
    }
}


#pragma mark - DELEGATE
- (NSInteger)retrieveThresholdNumber:(NSInteger)value
{
    NSLog(@"Received Threshold Value: %i", value);
    return value;
}

@end
