//
//  ViewController.m
//  APIs
//
//  Created by Brad Woodard on 7/25/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UITableView *myTableView;
    NSArray                     *superHeroArray;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://mobilemakers.co/lib/superheroes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [super viewDidLoad];

/*
    //NSURLResponse *response;
    //NSError *error;
    //NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
*/
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
    
        superHeroArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        [myTableView reloadData];
    }];
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
    return [superHeroArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    NSDictionary *superHeroDictionary = (NSDictionary *)[superHeroArray objectAtIndex:indexPath.row];
    NSString *name = [superHeroDictionary objectForKey:@"name"];
    NSString *description = [superHeroDictionary objectForKey:@"description"];
    NSURL *url = [NSURL URLWithString:[superHeroDictionary objectForKey:@"avatar_url"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    cell.textLabel.text = name;
    cell.detailTextLabel.text = description;
    cell.imageView.image = image;
    
    return cell;
}

@end
