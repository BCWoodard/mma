//
//  ViewController.h
//  PropertyFun
//
//  Created by Brad Woodard on 7/11/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    __weak IBOutlet UILabel *nameLabel;
    __weak IBOutlet UILabel *nameLabel2;
    __weak IBOutlet UILabel *nameLabel3;
    __weak IBOutlet UITextField *nameTextField;
    
}

- (IBAction)change:(id)sender;

@end
