//
//  MobileMakersAnnotationView.m
//  MapAnnotations
//
//  Created by Brad Woodard on 7/30/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "MobileMakersAnnotationView.h"

@implementation MobileMakersAnnotationView

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
    
    if (self) {
        self.image = [UIImage imageNamed:@"icon"];
    }
    
    return self;
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
