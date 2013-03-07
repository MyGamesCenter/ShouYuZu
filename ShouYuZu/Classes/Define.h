//
//  Define.h
//  ShouYuZu
//
//  Created by chen xin on 13-1-10.
//  Copyright (c) 2013年 Kingyee. All rights reserved.
//

#ifndef ShouYuZu_Define_h
#define ShouYuZu_Define_h

#import "HTMLParser.h"

//Library路径
#define LIBRARY_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Library"]
//数据存放目录
#define DATA_FOLDER [LIBRARY_FOLDER stringByAppendingPathComponent:@"ShouYuZu"]

//服务器URL
#define kServerURL @"http://www.52shouyu.com/"
//词汇列表页
#define kCiHuiList @"menu.php"

//日常用语文件
#define kDailyExpressionFile [DATA_FOLDER stringByAppendingPathComponent:@"dailyexpression.plist"]
//词汇列表文件
#define kWordsFile [DATA_FOLDER stringByAppendingPathComponent:@"words.plist"]

#endif
