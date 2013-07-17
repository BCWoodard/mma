//
//  AppDelegate.h
//  ToDoList-Challenge
//
//  Created by Brad Woodard on 7/16/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController    *viewController;
@property (strong, nonatomic) NSMutableArray    *mutableArray;
@property (strong, nonatomic) NSString          *stringQueue;
@property int                                   indexToUpdate;

@end
