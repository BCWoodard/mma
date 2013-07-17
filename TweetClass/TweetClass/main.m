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
        newTweet.tweetText = @"This is a new Tweet";
        [newTweet postTweet];
      
        /*
        NSMutableArray *daysInClass = [[NSMutableArray alloc] init];
        NSArray *daysOfWeek = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday", nil];
        
        for (int i = 0; i < 4; i++) {
            [daysInClass addObject:[daysOfWeek objectAtIndex:i]];
        }
        
        NSLog(@"%@", daysInClass);
        */
        
        NSDictionary *lifeEvents = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Birth", @"1967",
                                     @"High School Graduation", @"1985",
                                     @"College Graduation", @"1993",
                                     @"Received MFA in Acting", @"1996",
                                     @"Joined Mobile Makers", @"2013",
                                     nil];

        
        for (NSString *year in lifeEvents) {
            NSLog(@"%@ happened in %@", [lifeEvents objectForKey:year], year);
        }

        
    }
    return 0;
}

