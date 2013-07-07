//
//  main.c
//  Coolness-CHALLENGE
//
//  Created by Brad Woodard on 7/7/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{


    for (int i = 99; i >= 0; i-= 3) {
        if (i % 5 == 0) {
            printf("%d   Found one!\n", i);
        } else {
            printf("%d\n", i);
        }
    }
    return 0;
}

