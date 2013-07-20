//
//  SecondViewController.h
//  ToDoList-Challenge
//
//  Created by Brad Woodard on 7/16/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"

@interface SecondViewController : UIViewController
{
    UITextField *updateTextField;
}

@property (retain, nonatomic) IBOutlet UITextField *updateTextField;

@end
