//
//  main.c
//  Coolness
//
//  Created by Brad Woodard on 7/7/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // The WHILE LOOP
    int i = 0;
    while (i < 12) {
        printf("%d. Aaron is cool\n", i);
        i++;
    }
    
    // The FOR LOOP
    for (int i = 0; i < 12; i++) {
        printf("%d. Aaron is cool\n", i);
    }
    
    // The BREAK
    int b;
    for (b = 0; b < 12; b++) {
        if (b % 3 == 0) {
            continue; // Forget the rest of this, continue on to the next code block
        }
        printf("Checking b = %d\n", b);
        if (b + 90 == b * b) {
            break;  // The condition is met. Exit the loop and continue processing.
        }
    }
    printf("The answer is %d.\n", b);
    
    
    // The DO-WHILE LOOP (*totally uncool*)
    int d = 0;
    do {
        printf("%d. Aaron is cool\n", d);
        d++;
    } while (d < 12);  // NOTE: the trailing semi-colon!
    
    return 0;
}

