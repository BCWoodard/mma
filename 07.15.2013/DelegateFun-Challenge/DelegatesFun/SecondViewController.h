//
//  SecondViewController.h
//  DelegatesFun
//
//  Created by Julie Caccavo on 7/15/13.
//  Copyright (c) 2013 Juliana Caccavo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorDelegate.h"


@interface SecondViewController : UIViewController

@property (strong, nonatomic)id <ColorDelegate> delegate;

@end
