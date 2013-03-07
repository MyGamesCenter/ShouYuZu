//
//  CXTranslateDetailViewController.h
//  ShouYuZu
//
//  Created by chen xin on 13-1-11.
//  Copyright (c) 2013年 Kingyee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXTranslateDetailViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, retain)NSString *inputText;
@property (nonatomic, retain)UIWebView *webView;

@end
