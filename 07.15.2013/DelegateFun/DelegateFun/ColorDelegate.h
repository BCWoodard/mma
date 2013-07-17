//
//  ColorDelegate.h
//  DelegateFun
//
//  Created by Brad Woodard on 7/15/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ColorDelegate <NSObject>

- (void)changeColor:(UIColor *)color;

@end
