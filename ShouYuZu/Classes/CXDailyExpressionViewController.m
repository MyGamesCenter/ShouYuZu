//
//  CXDailyExpressionViewController.m
//  ShouYuZu
//
//  Created by chen xin on 13-1-10.
//  Copyright (c) 2013年 Kingyee. All rights reserved.
//

#import "CXDailyExpressionViewController.h"
#import "Define.h"
#import "CXDetailViewController.h"

@interface CXDailyExpressionViewController ()

@property (nonatomic, retain)NSArray *listArray;

@end

@implementation CXDailyExpressionViewController

@synthesize listArray;

- (void)dealloc {
    [listArray release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:kDailyExpressionFile]) {
        
        NSError *error = nil;
        HTMLParser *parser = [[HTMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://www.52shouyu.com/juzi.htm"] error:&error];
        
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        HTMLNode *bodyNode = [parser body];
        NSArray *aNodes = [bodyNode findChildTags:@"a"];
        NSMutableArray *result = [[NSMutableArray alloc] init];
        for (HTMLNode *aNode in aNodes) {
            if ([[aNode getAttributeNamed:@"href"] hasPrefix:@"s.php?"]) {
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[aNode getAttributeNamed:@"href"], @"href", [aNode contents], @"text", nil];
                [result addObject:dict];
            }
        }
        [parser release];
        if (result.count > 0) {
            self.listArray = result;
            [result writeToFile:kDailyExpressionFile atomically:YES];
            [result release];
        }
    }
    else {
        self.listArray = [[[NSArray alloc] initWithContentsOfFile:kDailyExpressionFile] autorelease];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    cell.textLabel.text = [[listArray objectAtIndex:indexPath.row] objectForKey:@"text"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CXDetailViewController *detailViewController = [[CXDetailViewController alloc] init];
    detailViewController.infoDict = [listArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}

@end
