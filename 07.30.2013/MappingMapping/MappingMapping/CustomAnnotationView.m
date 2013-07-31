//
//  CustomAnnotationView.m
//  MappingMapping
//
//  Created by Brad Woodard on 7/30/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "CustomAnnotationView.h"
#import "TransitStop.h"

@implementation CustomAnnotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    // Tried alloc & init of object here and running thru if...else statement and assigning image here
    
    if (self) {
        self.image = [UIImage imageNamed:@"busIcon-20x24.png"];
    }
    
    return self;
}


- (void)useCustomAnnotation:(NSString *)annotation
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
