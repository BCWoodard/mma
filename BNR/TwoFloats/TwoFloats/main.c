//
//  main.c
//  TwoFloats
//
//  Created by Brad Woodard on 7/7/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    /* Declare two variables of type float and assign each of
     them a number with a decimal point. */
    
    float variable1 = 26.2;
    float variable2 = 38.4;
    
    /* Declare a variable of type double and assign it the sum
     of the two variables. */
    
    double result = variable1 + variable2;
    
    // Print result to the console
    printf("The sum of the two variables is: %.2f\n", result);
}

