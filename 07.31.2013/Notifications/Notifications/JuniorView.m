//
//  JuniorView.m
//  Notifications
//
//  Created by Brad Woodard on 7/31/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "JuniorView.h"

@implementation JuniorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"Touch" object:nil];
    
    
    NSLog(@"Ouch!");
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
