//
//  ViewController.m
//  MapAnnotations
//
//  Created by Brad Woodard on 7/30/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "AcademyLocation.h"
#import "MobileMakersAnnotationView.h"

@interface ViewController ()
{
    __weak IBOutlet MKMapView *mapView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Configure the map for display on device
    // 1. Define coordinates
    // 2. Define the span (in degrees)
    // 3. Define the region to be displayed
    // 4. Add region to the mapView
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(41.90, -87.65); // 1
    MKCoordinateSpan span = MKCoordinateSpanMake(1.0, 1.0);  // 2
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);  // 3
    
    mapView.region = region;  // 4
    
    // Custom Annotation
    // 1. Alloc and init the class
    // 2. Assign the title (declared in the class)
    // 3. Assign the coordinate (declared in the class)
    // 4. Add annotation to the mapView
    AcademyLocation *academyLocation = [[AcademyLocation alloc] init]; // 1
    academyLocation.title = @"Mobile Makers"; // 2
    academyLocation.coordinate = coordinate;  // 3
    
    [mapView addAnnotation:academyLocation];  // 4
    
    UIImageView *testImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"busIcon-20x24.png"]];
    testImageView.frame = CGRectMake(40.0f, 80.0f, 20.0f, 24.0f);
    [self.view addSubview:testImageView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)aMapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // MKAnnotationView behaves very much like UITableViewCell
    // 1.  Declare an annotation view and define the desired reuse identifier
    // 2.  Create an annotation view if there isn't one in the pool
    // 3.  Use MKPinAnnotationView instead of MKAnnotationView because it is
    //     a subclass
    // 4.  Set canShowCallout BOOL = YES
    // 5.  Set rightCalloutAccessoryView to a UIButton with type Detail Disclosure
    
    MKAnnotationView *annotationView = [aMapView dequeueReusableAnnotationViewWithIdentifier:@"Annotation"];  // 1
    
    if (!annotationView) {
        annotationView = [[MobileMakersAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Annotation"];  // 2  // 3
        annotationView.canShowCallout = YES;  // 4
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];  // 5
    }
    
    return annotationView;
}


- (void)mapView:(MKMapView *)aMapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    // Logging when the annotation is selected
    // Since the method calls (MKAnnotationView *)view we can drill into
    // the properties of that "view"
    
    NSLog(@"I'm Here! %@", view.annotation.title);
}

@end
