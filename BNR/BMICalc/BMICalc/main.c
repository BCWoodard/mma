//
//  main.c
//  BMICalc
//
//  Created by Brad Woodard on 7/7/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#include <stdio.h>

// Here is the declaration of the person STRUCT
typedef struct {
    float heightInMeters;
    int weightInKilos;
} Person; // NOTE: Semi-colon

float bodyMassIndex(Person p)
{
    return p.weightInKilos / (p.heightInMeters * p.heightInMeters);
}


int main(int argc, const char * argv[])
{
    Person person;
    person.weightInKilos = 96;
    person.heightInMeters = 1.8;
    printf("person weighs %i kilograms.\n", person.weightInKilos);
    printf("person is %.2f meters tall.\n", person.heightInMeters);
    
    // bodyMassIndex
    float bmi = bodyMassIndex(person);
    printf("person has a BMI of %.2f\n", bmi);
    
    return 0;
}

