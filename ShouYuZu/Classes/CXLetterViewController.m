//
//  CXLetterViewController.m
//  ShouYuZu
//
//  Created by chen xin on 12-11-26.
//  Copyright (c) 2012年 Kingyee. All rights reserved.
//

#import "CXLetterViewController.h"

@implementation CXLetterViewController

@synthesize picView;

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

- (void)dealloc {
    [picView release];
    [super dealloc];
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
    self.view.backgroundColor = [UIColor whiteColor];
    CGSize viewSize = self.view.bounds.size;
    self.picView = [[[CXPictureView alloc] init] autorelease];
    picView.backgroundColor = [UIColor lightGrayColor];
    picView.frame = CGRectMake(40, 40, viewSize.width - 80, viewSize.width - 80);
    [self.view addSubview:picView];
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

@end
