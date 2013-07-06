//
//  Tweet.h
//  TweetClass
//
//  Created by Brad Woodard on 7/6/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject

// Attributes
@property NSString *username;
@property NSString *tweetText;
@property NSDate *tweetDate;


// Behaviors
- (void)postTweet;

@end
