//
//  MyView.m
//  FunWithViews
//
//  Created by Brad Woodard on 7/18/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "MyView.h"


@implementation MyView
@synthesize delegate, imageView;


/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
*/


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        /*
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PlayingCardBack.png"]];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.frame = CGRectMake(0.0f, 0.0f, 60.0f, 80.0f);
        [self addSubview:imageView];
        */
    }
    
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [delegate changeSubviewImage:self];
}



- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [delegate didChooseView:self];
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
