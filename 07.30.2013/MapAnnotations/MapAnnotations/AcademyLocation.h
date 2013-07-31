//
//  AcademyLocation.h
//  MapAnnotations
//
//  Created by Brad Woodard on 7/30/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AcademyLocation : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString *title;
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;

@end
