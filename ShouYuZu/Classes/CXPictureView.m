//
//  CXPictureView.m
//  ShouYuZu
//
//  Created by chen xin on 12-11-26.
//  Copyright (c) 2012年 Kingyee. All rights reserved.
//

#import "CXPictureView.h"

@implementation CXPictureView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(context, 1);
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.0 alpha:1.0].CGColor);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
	CGContextStrokePath( context );
}


@end
