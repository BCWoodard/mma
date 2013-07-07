//
//  main.c
//  Addresses
//
//  Created by Brad Woodard on 7/7/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
    int i = 17;
    int *addressOfI = &i;
    printf("i stores its value at %p\n", addressOfI);
    *addressOfI = 89;
    printf("Now i is %d\n", i);
    printf("main function starts at %p\n", main);
    printf("The int stored at addressOfI is %d\n", *addressOfI);
    
    printf("An int is %zu bytes\n", sizeof(int));
    printf("A pointer is %zu bytes\n", sizeof(addressOfI));
    
    // CHALLENGE
    printf("A float is %zu bytes\n", sizeof(float));
    
    
    return 0;
}

