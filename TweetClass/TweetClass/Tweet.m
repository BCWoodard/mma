//
//  Tweet.m
//  TweetClass
//
//  Created by Brad Woodard on 7/6/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet
@synthesize username, tweetDate, tweetText; // Not required in Xcode 4.4 or greater


- (NSString *)createTweet:(NSString *)input {
    input = @"This is a new tweet";
    return input;
}


- (void)postTweet {
    // Some action
    NSLog(@"%@", tweetText);
}



@end
