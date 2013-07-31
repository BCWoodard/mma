//
//  ViewController.m
//  MapIt
//
//  Created by Brad Woodard on 7/29/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITextField *addressTextField;    
    __weak IBOutlet MKMapView   *mapView;
    CLLocationManager           *locationManager;
    
    CLLocationCoordinate2D      newLocation;
    
}
- (IBAction)findLocationOnMap:(id)sender;


@end

@implementation ViewController


// Use initWithNibName when working with Xibs
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        locationManager.delegate = self;
        mapView.delegate = self;
        
        [locationManager startUpdatingLocation];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CLLocationCoordinate2D startLocation;
    startLocation.latitude = 41.8941;
    startLocation.longitude = -87.6353;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(startLocation, 2000, 2000);
    
    mapView.region = region;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)findLocationOnMap:(id)sender {

    [self mapNewLocation];

    [addressTextField resignFirstResponder];

}

- (void)mapNewLocation
{
    NSString *cleanString = [addressTextField.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=false", cleanString]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSDictionary *allDataDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *resultsArray = [NSArray arrayWithArray:[allDataDictionary objectForKey:@"results"]];
        NSDictionary *zeroDictionary = [resultsArray objectAtIndex:0];
        NSDictionary *geometryDictionary = [zeroDictionary objectForKey:@"geometry"];
        NSDictionary *locationDictionary = [geometryDictionary objectForKey:@"location"];
        newLocation.latitude = [[locationDictionary objectForKey:@"lat"] floatValue];
        newLocation.longitude = [[locationDictionary objectForKey:@"lng"] floatValue];
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(newLocation, 5000, 5000);
        
        mapView.region = region;
    }];
}

@end
