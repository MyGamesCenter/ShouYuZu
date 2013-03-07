//
//  CXWordDetailViewController.h
//  ShouYuZu
//
//  Created by chen xin on 13-1-10.
//  Copyright (c) 2013年 Kingyee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXWordDetailViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, retain)NSDictionary *infoDict;
@property (nonatomic, retain)UIWebView *webView;

@end
