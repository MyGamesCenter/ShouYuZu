//
//  KYItemButton.m
//  HuiYiTong
//
//  Created by chen xin on 12-11-21.
//  Copyright (c) 2012年 Kingyee. All rights reserved.
//

#import "KYItemButton.h"


@implementation KYItemButton

+ (id)buttonWithTarget:(id)target action:(SEL)action title:(NSString*)title {
    KYItemButton *button = [KYItemButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, kButtonWidth, kButtonWidth);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    button.layer.cornerRadius = 8;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 1;
    return button;
}

@end
