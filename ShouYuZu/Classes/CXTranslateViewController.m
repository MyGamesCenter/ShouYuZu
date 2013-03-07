//
//  CXTranslateViewController.m
//  ShouYuZu
//
//  Created by chen xin on 13-1-11.
//  Copyright (c) 2013年 Kingyee. All rights reserved.
//

#import "CXTranslateViewController.h"
#import "CXTranslateDetailViewController.h"

@implementation CXTranslateViewController

@synthesize textField = _textField;

- (void)dealloc {
    [_textField release];
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
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGSize viewSize = self.view.bounds.size;
    self.textField = [[[UITextField alloc] initWithFrame:CGRectMake(20, 20, viewSize.width - 40, 30)] autorelease];
    _textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField];
    _textField.delegate = self;
    _textField.returnKeyType = UIReturnKeySearch;
    [_textField becomeFirstResponder];
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

- (void)translateText:(NSString*)text {
    CXTranslateDetailViewController *viewCtrl = [[CXTranslateDetailViewController alloc] init];
    viewCtrl.inputText = text;
    [self.navigationController pushViewController:viewCtrl animated:YES];
    [viewCtrl release];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self translateText:textField.text];
    return YES;
}

@end
