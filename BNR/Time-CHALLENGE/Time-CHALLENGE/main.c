//
//  main.c
//  Time-CHALLENGE
//
//  Created by Brad Woodard on 7/7/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#include <stdio.h>
#include <time.h>


int main(int argc, const char * argv[])
{
    long secondsInTheFuture = time(NULL) + 4000000;
    struct tm futureDate;
    
    printf("The date 4,000,000 seconds from now will be:\n");
    localtime_r(&secondsInTheFuture, &futureDate);
    printf("%d-%d-%d\n", futureDate.tm_mon + 1, futureDate.tm_mday, (futureDate.tm_year + 1900));

    return 0;
}

