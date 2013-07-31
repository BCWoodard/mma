//
//  ViewController.m
//  MappingMapping
//
//  Created by Brad Woodard on 7/30/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "TransitStop.h"
#import "CustomAnnotationView.h"

@interface ViewController ()
{
    __weak IBOutlet MKMapView   *mapViewOutlet;
    NSArray                     *busStopsArray;
}

@end

@implementation ViewController

- (void)viewDidLoad
{    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CLLocationCoordinate2D startCoordinate = CLLocationCoordinate2DMake(41.90, -87.65);
    MKCoordinateSpan startSpan = MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion startRegion = MKCoordinateRegionMake(startCoordinate, startSpan);
    
    mapViewOutlet.showsUserLocation = YES;
    mapViewOutlet.region = startRegion;
    
    [self retrieveCTAData];

}


// Clear annotation when you return from DetailViewController
- (void)viewWillAppear:(BOOL)animated
{
    for (NSObject<MKAnnotation> *annotation in [mapViewOutlet selectedAnnotations])
    {
        [mapViewOutlet deselectAnnotation:(id <MKAnnotation>)annotation animated:NO];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma  mark - MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[TransitStop class]]) {
        
        MKAnnotationView *annotationView = [mapViewOutlet dequeueReusableAnnotationViewWithIdentifier:@"AnnotationIdentifier"];
        
        if (!annotationView) {
            annotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnotationIdentifier"];
            
            annotationView.canShowCallout = YES;
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            
        } else {
            annotationView.annotation = annotation;
        }
        
        return annotationView;

    } else {
        return nil;
    }
}


- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
//    TransitStop *selectedStop = [[TransitStop alloc] init];    
    TransitStop *selectedStop = (TransitStop *) view.annotation; // captures the tapped annotation

    // Create pointer to the detail view
    DetailViewController *detailViewController;

    // Perform the segue
    [self performSegueWithIdentifier:@"toDetailView" sender:self];
    
    detailViewController = (DetailViewController *) [self.navigationController.viewControllers lastObject];
    detailViewController.incomingStop = selectedStop;

}



#pragma mark - RetrieveCTAData
- (void)retrieveCTAData
{
    NSURL *url = [NSURL URLWithString:@"http://mobilemakers.co/lib/bus.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *allBusStopDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *arrayOfBusStops = [allBusStopDictionary objectForKey:@"row"];
        
        [arrayOfBusStops enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            //  Adding error checking to our block to ensure the objects being returned
            //  are NSDictionary objects. If not, log an error.
            if ([obj isKindOfClass:[NSDictionary class]]) {
                
                // Create a TransitStop object and assign values to its properties from the data feed
                TransitStop *newStop = [[TransitStop alloc] init];
                
                newStop.title = [obj objectForKey:@"cta_stop_name"];
                newStop.stopCoordinate = CLLocationCoordinate2DMake([[obj objectForKey:@"latitude"] floatValue], [[obj objectForKey:@"longitude"] floatValue]);
                newStop.busRoutes = [obj objectForKey:@"routes"];
                newStop.direction = [obj objectForKey:@"direction"];
               
                
#pragma mark IF...ELSE for assigning image to annotationView
                // Alert users on detailViewController if no Metra/Pace transfer
                if (![obj objectForKey:@"inter_modal"]) {
                    newStop.interModal = @"No transfer to Metra or Pace";
                    
                } else {
                    newStop.interModal = [obj objectForKey:@"inter_modal"];
                    
                }
                
                [mapViewOutlet addAnnotation:newStop];
    
            } else {
                NSLog(@"ERROR: %@", error.description);
                
            }
        }];
    }];
}



@end
