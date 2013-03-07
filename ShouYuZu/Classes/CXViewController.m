//
//  CXViewController.m
//  ShouYuZu
//
//  Created by chen xin on 12-11-23.
//  Copyright (c) 2012年 Kingyee. All rights reserved.
//

#import "CXViewController.h"
#import "CXLetterViewController.h"
#import "CXDailyExpressionViewController.h"
#import "CXWordsViewController.h"
#import "CXTranslateViewController.h"
#import "Define.h"

@implementation CXViewController

@synthesize itemBtn1, itemBtn2, itemBtn3, itemBtn4, itemBtn5, itemBtn6;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
    [itemBtn1 release];
    [itemBtn2 release];
    [itemBtn3 release];
    [itemBtn4 release];
    [itemBtn5 release];
    [itemBtn6 release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"手语族";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:DATA_FOLDER]) {
        [fm createDirectoryAtPath:DATA_FOLDER withIntermediateDirectories:YES attributes:nil error:NULL];
        NSString *srcFilePath = [[NSBundle mainBundle] pathForResource:[kDailyExpressionFile lastPathComponent] ofType:nil];
        [fm copyItemAtPath:srcFilePath toPath:kDailyExpressionFile error:NULL];
        
    }
	
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    CGSize btnSize = button.frame.size;
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, btnSize.width+10, btnSize.height)];
    rightView.backgroundColor = [UIColor clearColor];
    [rightView addSubview:button];
    UIBarButtonItem *infoBBI = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    [rightView release];
    self.navigationItem.rightBarButtonItem = infoBBI;
    [infoBBI release];
    
    CGFloat centerX, centerY;
    centerX = kBtnOriginX + kHalfBtnWidth;
    centerY = kBtnOriginY + kHalfBtnWidth;
    self.itemBtn1 = [KYItemButton buttonWithTarget:self action:@selector(itemBtn1Clicked) title:@"日常用语"];
    itemBtn1.center = CGPointMake(centerX, centerY);
    [self.view addSubview:self.itemBtn1];
    
    self.itemBtn2 = [KYItemButton buttonWithTarget:self action:@selector(itemBtn2Clicked) title:@"手语词汇"];
    itemBtn2.center = CGPointMake(centerX + kButtonWidth + kBtnPaddingX, centerY);
    [self.view addSubview:self.itemBtn2];
    
    self.itemBtn3 = [KYItemButton buttonWithTarget:self action:@selector(itemBtn3Clicked) title:@"手语翻译"];
    itemBtn3.center = CGPointMake(centerX, centerY + kButtonWidth + kBtnPaddingY);
    [self.view addSubview:self.itemBtn3];
    
    self.itemBtn4 = [KYItemButton buttonWithTarget:self action:@selector(itemBtn4Clicked) title:@"我的手语"];
    itemBtn4.center = CGPointMake(centerX + kButtonWidth + kBtnPaddingX, centerY + kButtonWidth + kBtnPaddingY);
    [self.view addSubview:self.itemBtn4];
    /*
    self.itemBtn5 = [KYItemButton buttonWithTarget:self action:@selector(itemBtn5Clicked) title:@"手语视频"];
    itemBtn5.center = CGPointMake(centerX, centerY + 2*(kButtonWidth + kBtnPaddingY));
    [self.view addSubview:self.itemBtn5];
    
    self.itemBtn6 = [KYItemButton buttonWithTarget:self action:@selector(itemBtn6Clicked) title:@"我的手语"];
    itemBtn6.center = CGPointMake(centerX + kButtonWidth + kBtnPaddingX, centerY + 2*(kButtonWidth + kBtnPaddingY));
    [self.view addSubview:self.itemBtn6];
     */
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
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}


- (void)itemBtn1Clicked {
    CXDailyExpressionViewController *viewCtrl = [[CXDailyExpressionViewController alloc] initWithStyle:UITableViewStylePlain];
    viewCtrl.title = @"日常用语";
    [self.navigationController pushViewController:viewCtrl animated:YES];
    [viewCtrl release];
}

- (void)itemBtn2Clicked {
    
    CXWordsViewController *viewCtrl = [[CXWordsViewController alloc] init];
    viewCtrl.title = @"手语词汇";
    [self.navigationController pushViewController:viewCtrl animated:YES];
    [viewCtrl release];
}

- (void)itemBtn3Clicked {
    
    CXTranslateViewController *viewCtrl = [[CXTranslateViewController alloc] init];
    viewCtrl.title = @"手语翻译";
    [self.navigationController pushViewController:viewCtrl animated:YES];
    [viewCtrl release];
}

- (void)itemBtn4Clicked {
    
    CXLetterViewController *viewCtrl = [[CXLetterViewController alloc] init];
    viewCtrl.title = @"我的手语";
    [self.navigationController pushViewController:viewCtrl animated:YES];
    [viewCtrl release];
}

- (void)itemBtn5Clicked {
    
}

- (void)itemBtn6Clicked {
    
}

@end
