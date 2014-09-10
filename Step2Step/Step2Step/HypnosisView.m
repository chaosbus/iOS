//
//  MyView.m
//  Step2Step
//
//  Created by Joe on 14-8-16.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize circleColor;


- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    // 圆点
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
//    float maxRadius = hypotf(bounds.size.width, bounds.size.height) / 4.0;
    float maxRadius = hypotf(bounds.size.width, bounds.size.height) / 2.0;

    
    // 线条宽
    CGContextSetLineWidth(ctx, 2);
    
    // 设置线条颜色RGB
    CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
#if 0
    // 将线条加入上下文（不会显示）
    CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, YES);
    
    // 执行绘图
    CGContextStrokePath(ctx);
#else
    [self.circleColor setStroke];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(ctx);

    }
    
    NSString *text = @"You are getting sleep.";
    UIFont *font = [UIFont boldSystemFontOfSize:30];
    
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    [[UIColor blackColor] setFill];
    
    // 设置阴影
    CGSize offset = CGSizeMake(3, 4);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    [text drawInRect:textRect withFont:font];
#endif
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    
    return self;
}

@end
