//
//  KYItemButton.h
//  HuiYiTong
//
//  Created by chen xin on 12-11-21.
//  Copyright (c) 2012年 Kingyee. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kButtonWidth    100
#define kHalfBtnWidth   50
#define kBtnOriginX     40
#define kBtnOriginY     40
#define kBtnPaddingX    40
#define kBtnPaddingY    40

@interface KYItemButton : UIButton

+ (id)buttonWithTarget:(id)target action:(SEL)action title:(NSString*)title;

@end
