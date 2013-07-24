//
//  EditViewController.h
//  AddressBook
//
//  Created by Brad Woodard on 7/22/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditRecordDelegate.h"

@interface EditViewController : UIViewController

@property (strong, nonatomic) id <EditRecordDelegate> delegate;

@property (strong, nonatomic) NSString *editFirstName;
@property (strong, nonatomic) NSString *editLastName;
@property (strong, nonatomic) NSString *editEmail;
@property (strong, nonatomic) NSString *editPhoneNumber;

@end
