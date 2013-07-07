//
//  main.c
//  Turkey
//
//  Created by Brad Woodard on 7/7/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // Declare the variable called "weight" of type float
    float weight;
    
    // Put a number in that variable
    weight = 14.2;
    
    // Log it to the console
    printf("The turkey weighs %.2f pounds.\n", weight);
    
    // Declare another variable called "cookingTime" of type float
    float cookingTime;
    
    // Calculate the cooking time and store it in the variable
    // In this case * means multiply
    cookingTime = 15.0 + 15.0 * weight;
    
    // Log it to the console
    printf("Cook the turkey for %.2f minutes.", cookingTime);
    
    // End this function and indicate success
    return 0;
}

