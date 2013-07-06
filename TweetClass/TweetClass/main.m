//
//  main.m
//  TweetClass
//
//  Created by Brad Woodard on 7/6/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tweet.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Tweet *newTweet = [[Tweet alloc] init];
        [newTweet postTweet];
        
    }
    return 0;
}

