//
//  SecondViewController.m
//  Wikipedia
//
//  Created by Brad Woodard on 7/25/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "SecondViewController.h"
#import "WebViewController.h"

@interface SecondViewController ()
{
    __weak IBOutlet UILabel *articleTitleLabel;
    __weak IBOutlet UITextView *snippetTextView;
    
}
- (IBAction)loadWebView:(id)sender;

@end

@implementation SecondViewController
@synthesize incomingSnippet, incomingArticleTitle;

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
    
    // Strip HTML from the snippet
    [self removeHTMLTagsFromString];

    // UI Elements
    articleTitleLabel.text = incomingArticleTitle;
    snippetTextView.text = incomingSnippet;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *)removeHTMLTagsFromString
{
    NSRange range;
    while ((range = [incomingSnippet rangeOfString:@"<[^>]+>"
                                           options:NSRegularExpressionSearch]).location != NSNotFound)
        incomingSnippet = [incomingSnippet stringByReplacingCharactersInRange:range withString:@""];
    
    return incomingSnippet;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *webView = segue.destinationViewController;
    
    NSString *formattedArticleTitle = [incomingArticleTitle stringByReplacingOccurrencesOfString:@" "
                                                                               withString:@"_"];
    
    webView.incomingURL = formattedArticleTitle;
    
}


- (IBAction)loadWebView:(id)sender
{
    [self performSegueWithIdentifier:@"toWikiArticle" sender:self];
}
@end
