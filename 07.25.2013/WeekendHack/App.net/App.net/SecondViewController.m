//
//  TestViewController.m
//  App.net
//
//  Created by Brad Woodard on 7/27/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "SecondViewController.h"
#import "WebViewController.h"

@interface SecondViewController ()
{
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UILabel *usernameLabel;
    __weak IBOutlet UILabel *userIDLabel;
    __weak IBOutlet UITextView *postTextField;
    __weak IBOutlet UIButton *viewUserOnAppNetOutlet;
    
}
- (IBAction)viewUserOnAppNet:(id)sender;

@end

@implementation SecondViewController
@synthesize incomingAvatar;
@synthesize incomingUsername;
@synthesize incomingUserID;
@synthesize incomingPost;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // UI Elements
    imageView.image = incomingAvatar;
    usernameLabel.text = incomingUsername;
    userIDLabel.text = incomingUserID;
    postTextField.text = incomingPost;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewUserOnAppNet:(id)sender {
    [self performSegueWithIdentifier:@"toWebView" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *webViewController = segue.destinationViewController;
    webViewController.incomingURL = [NSString stringWithFormat:@"https://alpha-api.app.net/stream/0/users/%@/posts", incomingUserID];
}


@end
