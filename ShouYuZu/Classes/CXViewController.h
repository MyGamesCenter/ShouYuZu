//
//  CXViewController.h
//  ShouYuZu
//
//  Created by chen xin on 12-11-23.
//  Copyright (c) 2012年 Kingyee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYItemButton.h"

@interface CXViewController : UIViewController

@property (nonatomic, retain)KYItemButton *itemBtn1;
@property (nonatomic, retain)KYItemButton *itemBtn2;
@property (nonatomic, retain)KYItemButton *itemBtn3;
@property (nonatomic, retain)KYItemButton *itemBtn4;
@property (nonatomic, retain)KYItemButton *itemBtn5;
@property (nonatomic, retain)KYItemButton *itemBtn6;

- (void)itemBtn1Clicked;
- (void)itemBtn2Clicked;
- (void)itemBtn3Clicked;
- (void)itemBtn4Clicked;
- (void)itemBtn5Clicked;
- (void)itemBtn6Clicked;

@end
