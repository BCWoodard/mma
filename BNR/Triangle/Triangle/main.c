//
//  main.c
//  Triangle
//
//  Created by Brad Woodard on 7/7/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#include <stdio.h>

float remainingAngle(char angleA, char angleB)
{
    float remainder = 180 - (angleA + angleB);
    return remainder;
}

int main(int argc, const char * argv[])
{

    // insert code here...
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA, angleB);
    printf("The third angle is %.2f.\n", angleC);
    
    return 0;
}

