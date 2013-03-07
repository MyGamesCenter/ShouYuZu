//
//  KYItemButton.h
//  HuiYiTong
//
//  Created by chen xin on 12-11-21.
//  Copyright (c) 2012年 Kingyee. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kButtonWidth    80
#define kHalfBtnWidth   40
#define kBtnOriginX     20
#define kBtnOriginY     20
#define kBtnPaddingX    20
#define kBtnPaddingY    20

@interface KYItemButton : UIButton

+ (id)buttonWithTarget:(id)target action:(SEL)action title:(NSString*)title;

@end
