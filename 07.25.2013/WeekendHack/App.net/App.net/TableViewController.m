//
//  TableViewController.m
//  App.net
//
//  Created by Brad Woodard on 7/27/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "TableViewController.h"
#import "SecondViewController.h"

@interface TableViewController ()
{
    NSDictionary            *appNetData;
    NSArray                 *dataFeed;
    NSMutableArray          *usernamesArray;
    NSMutableArray          *userIDArray;
    NSMutableArray          *userPostsArray;
    NSMutableArray          *userAvatarArray;
    
    UIRefreshControl        *refreshControl;
    
    int                     selectedRow;
}

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // alloc and init
    appNetData = [[NSDictionary alloc] init];
    usernamesArray = [[NSMutableArray alloc] initWithCapacity:20];
    userIDArray = [[NSMutableArray alloc] initWithCapacity:20];
    userPostsArray = [[NSMutableArray alloc] initWithCapacity:20];
    userAvatarArray = [[NSMutableArray alloc] initWithCapacity:20];
    
    [super viewDidLoad];

    [self getData];
    
    refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor magentaColor];
    [refreshControl addTarget:self action:@selector(getData) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in our dataFeed
    return [dataFeed count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.imageView.image = [userAvatarArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [usernamesArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [userPostsArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedRow = indexPath.row;
    [self performSegueWithIdentifier:@"toTestView" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    SecondViewController *testView = segue.destinationViewController;
    testView.navigationItem.title = [usernamesArray objectAtIndex:selectedRow];
    testView.incomingAvatar = [userAvatarArray objectAtIndex:selectedRow];
    testView.incomingUsername = [usernamesArray objectAtIndex:selectedRow];
    testView.incomingUserID = [userIDArray objectAtIndex:selectedRow];
    testView.incomingPost = [userPostsArray objectAtIndex:selectedRow];
    
     /*
    SecondViewController *secondViewController = segue.destinationViewController;
    
    secondViewController.navigationItem.title = [usernamesArray objectAtIndex:selectedRow];
    //secondViewController.incomingAvatar = [userAvatarArray objectAtIndex:selectedRow];
    //secondViewController.incomingUsername = [usernamesArray objectAtIndex:selectedRow];
    //secondViewController.incomingPost = [userPostsArray objectAtIndex:selectedRow];
    //secondViewController.incomingID = [userIDArray objectAtIndex:selectedRow];
     */

}


#pragma mark - Get App.net Data
- (void)getData
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
  
    NSURL *url = [NSURL URLWithString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (!error) {
            [usernamesArray removeAllObjects];
            [userPostsArray removeAllObjects];
            [userAvatarArray removeAllObjects];

        appNetData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        dataFeed = [NSArray arrayWithArray:[appNetData objectForKey:@"data"]];
        
        [dataFeed enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            
            [userPostsArray addObject:[obj objectForKey:@"text"]];
            [usernamesArray addObject:[[obj objectForKey:@"user"]
                                       objectForKey:@"username"]];
            [userIDArray addObject:[[obj objectForKey:@"user"]
                                       objectForKey:@"id"]];


            [userAvatarArray addObject:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[[obj objectForKey:@"user"] objectForKey:@"avatar_image"] objectForKey:@"url"]]]]];
            
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        }];
            
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                                message:@"There was an error downloading the feed from App.net. Please try again later."
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil,
                                      nil];
            
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            [self.refreshControl endRefreshing];
            
            [alertView show];
            NSLog(@"%@", error.description);
        }
    }];
}

@end
