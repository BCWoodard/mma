//
//  ViewController.m
//  WebBrowser
//
//  Created by Julie Caccavo on 7/15/13.
//  Copyright (c) 2013 Juliana Caccavo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UIWebView *webView;
    __weak IBOutlet UITextField *urlTextField;
    __weak IBOutlet UIButton *backButton;
    __weak IBOutlet UIButton *forwardButton;
    __weak IBOutlet UIActivityIndicatorView *activityIndicator;
    NSMutableArray              *urlArray;
    int arrayIndex;
}
- (IBAction)goBack:(id)sender;
- (IBAction)goForward:(id)sender;
- (IBAction)goToURL:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    webView.delegate = self;
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com"]]];
    urlArray = [[NSMutableArray alloc] init];
    arrayIndex = -1;
    activityIndicator.hidesWhenStopped=YES;
    //backButton.enabled = NO;
    //forwardButton.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"Started Loading.");
    [activityIndicator startAnimating];
    
}
-(void) webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"Finished Loading.");
    [activityIndicator stopAnimating];
}

- (IBAction)goBack:(id)sender {
    if ([webView canGoBack]) {
        [webView goBack];
        urlTextField.text = webView.request.URL.absoluteString;
    }
}

- (IBAction)goForward:(id)sender {
    if([webView canGoForward]){
        [webView goForward];
        urlTextField.text = webView.request.URL.absoluteString;
    }
}

- (IBAction)goToURL:(id)sender {
    //[urlArray insertObject:[NSURL URLWithString:urlTextField.text] atIndex:urlArray.count];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlTextField.text]]];
}
@end
