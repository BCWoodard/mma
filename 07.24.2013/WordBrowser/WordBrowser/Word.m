//
//  Word.m
//  WordBrowser
//
//  Created by Brad Woodard on 7/24/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "Word.h"

@implementation Word
@synthesize name, definition;


- (Word *)initWithName:(NSString *)aName andDefinition:(NSString *)aDefinition
{
    self = [super init];
    
    Word *newWord;
    
    if (self) {
        newWord = [[Word alloc] init];
        newWord.name = aName;
        newWord.definition = aDefinition;
        
    }
    return newWord;
}

@end
