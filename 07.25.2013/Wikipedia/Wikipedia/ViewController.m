//
//  ViewController.m
//  Wikipedia
//
//  Created by Brad Woodard on 7/25/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITableView *myTableView;
    __weak IBOutlet UITextField *searchTextField;
    
    NSDictionary                *wikipediaDictionary;
    NSArray                     *resultsArray;
    NSDictionary                *wikipediaEntry;
    
    int                         path;
    
}

- (IBAction)searchWikipedia:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    wikipediaDictionary = [[NSDictionary alloc] init];
    
    [self.view setBackgroundColor:[UIColor grayColor]];
    
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


- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [resultsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    wikipediaEntry = (NSDictionary *)[resultsArray objectAtIndex:indexPath.row];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    cell.textLabel.text = [wikipediaEntry objectForKey:@"title"];
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    path = indexPath.row;
    [self performSegueWithIdentifier:@"toSecondView" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SecondViewController *secondViewController = segue.destinationViewController;
    
    wikipediaEntry = [resultsArray objectAtIndex:path];
    secondViewController.navigationItem.title = [wikipediaEntry objectForKey:@"title"];
    secondViewController.incomingArticleTitle = [wikipediaEntry objectForKey:@"title"];
    secondViewController.incomingSnippet = [wikipediaEntry objectForKey:@"snippet"];
}


#pragma mark - Supporting Methods
- (IBAction)searchWikipedia:(id)sender
{
    // Show activity indicator when button is selected
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSMutableString *initialString = [NSMutableString stringWithFormat:@"https://en.wikipedia.org/w/api.php?%%20action=query&list=search&srsearch=%@&srprop=snippet&format=json", searchTextField.text];
    
    NSString *urlString = [initialString stringByReplacingOccurrencesOfString:@" "
                                                                withString:@"%20"];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        wikipediaDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSDictionary *queryDictionary = [wikipediaDictionary objectForKey:@"query"];
        resultsArray = [queryDictionary objectForKey:@"search"];
        
        [myTableView reloadData];
        
        // 
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    }];
    
    [searchTextField resignFirstResponder];
    
}
@end
