//
//  MyView.h
//  FunWithViews
//
//  Created by Brad Woodard on 7/18/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchDelegate.h"

@interface MyView : UIView

@property (strong, nonatomic) id <MatchDelegate> delegate;
@property (strong, nonatomic) UIImageView *imageView;

@end
