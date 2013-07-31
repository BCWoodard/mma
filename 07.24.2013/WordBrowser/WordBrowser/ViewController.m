//
//  ViewController.m
//  WordBrowser
//
//  Created by Brad Woodard on 7/24/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Word.h"

@interface ViewController ()
{
    Word    *word0, *word1, *word2, *word3, *word4, *word5, *word6, *word7, *word8, *word9, *word10, *word11, *word12, *word13, *word14, *word15, *word16, *word17, *word18, *word19;
    
    NSMutableDictionary     *wordsDictionary;
    NSArray                 *keyArray;
    int                     path;
}

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        // Alloc and init objects
        wordsDictionary = [[NSMutableDictionary alloc] initWithCapacity:20];
        
        [self createWords];
                
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource
- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    keyArray = [[NSArray alloc] init];
    keyArray = [wordsDictionary allKeys];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [keyArray objectAtIndex:indexPath.row]];
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [wordsDictionary count];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    path = indexPath.row;
    [self performSegueWithIdentifier:@"toSecondView" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SecondViewController *secondViewController = segue.destinationViewController;
    
    Word *newWord = [wordsDictionary objectForKey:[keyArray objectAtIndex:path]];
    secondViewController.incomingDefinition = newWord.definition;
    Word *synonym1 = (Word *)[newWord.synonyms objectAtIndex:0];
    secondViewController.incomingSynonym1 = synonym1.name;
    Word *synonym2 = (Word *)[newWord.synonyms objectAtIndex:1];
    secondViewController.incomingSynonym2 = synonym2.name;

    secondViewController.navigationItem.title = [keyArray objectAtIndex:path];
}


#pragma mark - Supporting Methods
- (void)createWords
{
    for (int i = 0; i < 20; i++) {
        
        Word *newWord = [[Word alloc] initWithName:[NSString stringWithFormat:@"Word%i", i] andDefinition:[NSString stringWithFormat:@"Definition%i", i]];
        
        Word *synonym1 = [[Word alloc] initWithName:[NSString stringWithFormat:@"Synonym%ia", i] andDefinition:[NSString stringWithFormat:@"Synonym%ia Definition", i]];
        
        Word *synonym2 = [[Word alloc] initWithName:[NSString stringWithFormat:@"Synonym%ib", i] andDefinition:[NSString stringWithFormat:@"Synonym%ib Definition", i]];
        
        newWord.synonyms = [[NSMutableArray alloc] initWithObjects:synonym1, synonym2, nil];
        
        // Make it easier to read objects from newWord array "synonyms"
        synonym1 = (Word *)[newWord.synonyms objectAtIndex:0];
        synonym2 = (Word *)[newWord.synonyms objectAtIndex:1];
        
        [wordsDictionary setObject:newWord forKey:newWord.name];
                
        // NSLog(@"\nWord: %@\nDefinition: %@\nFirst Synonym: %@\nFirst Synonym Definition: %@\nSecond Synonym: %@\nSecond Synonym Definition: %@", newWord.name, newWord.definition, synonym1.name, synonym1.definition, synonym2.name, synonym2.definition);
    }
}

@end
