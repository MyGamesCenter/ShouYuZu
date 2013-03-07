//
//  CXDetailViewController.m
//  ShouYuZu
//
//  Created by chen xin on 13-1-10.
//  Copyright (c) 2013年 Kingyee. All rights reserved.
//

#import "CXDetailViewController.h"
#import "Define.h"

@implementation CXDetailViewController

@synthesize infoDict = _infoDict;
@synthesize webView = _webView;

- (void)dealloc {
    [_infoDict release];
    [_webView stopLoading];
    _webView.delegate = nil;
    [_webView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = [self.infoDict objectForKey:@"text"];
    
    self.webView = [[[UIWebView alloc] initWithFrame:self.view.bounds] autorelease];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _webView.delegate = self;
    [self.view addSubview:self.webView];
    NSString *urlString = [NSString stringWithFormat:@"%@%@", kServerURL, [self.infoDict objectForKey:@"href"]];
    
    NSError *error = nil;
    HTMLParser *parser = [[HTMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] error:&error];
    
    if (error) {
        NSLog(@"Error: %@", error);
        return;
    }
    
    HTMLNode *bodyNode = [parser body];
    NSArray *tableNodes = [bodyNode findChildTags:@"table"];
    //NSMutableArray *result = [[NSMutableArray alloc] init];
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    for (HTMLNode *aNode in tableNodes) {
        NSString *width = [aNode getAttributeNamed:@"width"];
        if ([width isEqualToString:@"920"]) {
            [resultStr appendString:[aNode rawContents]];
            break;
        }
    }
    [parser release];
    
    [_webView loadHTMLString:resultStr baseURL:nil];
    [resultStr release];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - UIWebView delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

@end
