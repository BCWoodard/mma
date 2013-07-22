//
//  MatchDelegate.h
//  FunWithViews
//
//  Created by Brad Woodard on 7/18/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MyView;

@protocol MatchDelegate <NSObject>

- (void)didChooseView:(MyView *)myView;
- (void)changeSubviewImage:(MyView *)myView;

@end
