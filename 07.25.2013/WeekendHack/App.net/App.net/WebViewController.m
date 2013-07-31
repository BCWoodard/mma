//
//  WebViewController.m
//  App.net
//
//  Created by Brad Woodard on 7/27/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
{
    __weak IBOutlet UIWebView *webView;
    
}
- (IBAction)dismissModal:(id)sender;

@end

@implementation WebViewController
@synthesize incomingURL;

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
    
    webView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:incomingURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Optional UIWebViewDelegate delegate methods
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


- (IBAction)dismissModal:(id)sender {
        [self dismissViewControllerAnimated:YES
                                 completion:nil];
}
@end
