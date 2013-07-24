//
//  ThresholdValueDelegate.h
//  BlocksChallenge
//
//  Created by Brad Woodard on 7/23/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ThresholdValueDelegate <NSObject>

- (NSInteger)retrieveThresholdNumber:(NSInteger)value;

@end
