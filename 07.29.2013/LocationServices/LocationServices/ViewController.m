//
//  ViewController.m
//  LocationServices
//
//  Created by Brad Woodard on 7/29/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    // Create an instance of CLLocationManager
    CLLocationManager       *locationManager;
}
- (IBAction)startTracking:(id)sender;

@end

@implementation ViewController


// Use initWithNibName in Xib files
// initWithCoder in Storyboard
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
    }
    
    return self;
}

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

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    // Log the locations as they are being collected by the device
    NSLog(@"Locations: %@", [locations objectAtIndex:0]);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    // Log the error should any occur
    NSLog(@"Error: %@", error.description);
}

- (IBAction)startTracking:(id)sender {
    
    // Start tracking 
    [locationManager startUpdatingLocation];
}
@end
