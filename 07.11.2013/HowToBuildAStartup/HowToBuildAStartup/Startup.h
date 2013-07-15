//
//  Startup.h
//  HowToBuildAStartup
//
//  Created by Kin Bariso on 7/11/13.
//  Copyright (c) 2013 Kin Bariso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Manager.h"

@interface Startup : NSObject

@property (strong, nonatomic) Manager *boss;
@property (strong, nonatomic) Employee *coder;
@property (strong, nonatomic) Employee *projectManager;
@property (strong, nonatomic) Employee *designer;

// @property (strong, nonatomic) NSString *boss, *coder, *projectManager, *designer;
// Consolidate properties on one line - Is that best practice?



@end
