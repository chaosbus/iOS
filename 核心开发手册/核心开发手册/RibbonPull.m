//
//  RibbonPull.m
//  核心开发手册
//
//  Created by Joe on 14-10-14.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "RibbonPull.h"

@implementation RibbonPull
{
    UIImageView *ribbonImgView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, 0, 0);
        self.backgroundColor = [UIColor purpleColor];
        
        UIImage *ribbonImg = [UIImage imageNamed:@""];
    }
    
    return self;
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoing = [touch locationInView:self];
    
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoing = [touch locationInView:self];
    
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoing = [touch locationInView:self];
    
}

@end
