//
//  main.c
//  PBR
//
//  Created by Brad Woodard on 7/7/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#include <stdio.h>
#include <math.h>


void cartesianToPolarCoordinates(double x, double y, double *rPtr, double *thetaPtr)
{
    // Is rPtr non-NULL?
    if (rPtr) {
        // Store the radius in the supplied address
        *rPtr = sqrt(x * x + y * y);
    }
    
    // is thetaPtr NULL?
    if (!thetaPtr) {
        // skip the rest of the funtion
        return;
    }
    
    
    // Calculate theta
    double theta;
    if (x == 0.0) {
        if (y == 0.0) {
            theta = 0.0;  // technically considered undefined
        } else if (y > 0) {
            theta = M_PI_2;
        } else {
            theta = - M_PI_2;
        }
    } else {
        theta = atan(y/x);
    }
    
    // Store theta in the supplied address
    *thetaPtr = theta;
}

int main(int argc, const char * argv[])
{
    double pi = 3.14;
    double integerPart;
    double fractionPart;
    
    // Pass the address of integerPart as an argument
    fractionPart = modf(pi, &integerPart);  // PASS-BY-REFERENCE
    // You supply an address (&integerPart) and the function puts the data there
    // modf() works as a dead drop. I'll leave this piece of info in this
    // memory location until the program needs it.
    
    // Find the value stored in integerPart
    printf("integerPart = %.0f, fractionPart = %.2f\n", integerPart, fractionPart);
    
    double x = 3.0;
    double y = 4.0;
    double radius;
    double angle;
    
    cartesianToPolarCoordinates(x, y, &radius, &angle);
    printf("(%.2f, %.2f) becomes (%.2f, %.2f radians)\n", x, y, radius, angle);
    
    return 0;
}

