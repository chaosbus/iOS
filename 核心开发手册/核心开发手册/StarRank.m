//
//  TrackTest.m
//  核心开发手册
//
//  Created by Joe on 14-10-11.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "StarRank.h"

#define STAR_NUM    5
#define STAR_WIDTH  26.0f   // 星标图尺寸
#define STAR_SIZE   CGRectMake(0, 0, STAR_WIDTH, STAR_WIDTH)

// 展示的星
#define OFF_ART     [UIImage imageNamed:@"Star-White-Half.png"]
#define ON_ART      [UIImage imageNamed:@"Star-White.png"]

@implementation StarRank
{
    NSInteger value;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, STAR_WIDTH * STAR_NUM * 1.4, 34.0f);
        
        // 每个星的x偏移量
        CGFloat xAxisOffset = STAR_WIDTH;

        for (NSInteger i = 0; i < STAR_NUM; i++) {
            UIImageView *starImgView = [[UIImageView alloc] initWithFrame:STAR_SIZE];
            starImgView.center = CGPointMake(xAxisOffset, 34.0f / 2);
            starImgView.image = OFF_ART;
            [self addSubview:starImgView];
            
            xAxisOffset += 1.5f * STAR_WIDTH;
        }
    }
    
    self.backgroundColor = [UIColor grayColor];
    
    return self;
}


+ (id)handle
{
    return [[self alloc] init];
}

/**
 * 动态更新星值
 */
- (void)updateStarRank:(CGPoint)touchPoint
{
    // 第一个星需要有放大的动画效果
    UIImageView *headStarView = nil;
    // 当前的值
    NSInteger newStarValue = 0;

    for (UIImageView *imgView in [self subviews]) {
        if (touchPoint.x > imgView.frame.origin.x) {
            headStarView = imgView;
            imgView.image = ON_ART;
            
            newStarValue++;
        } else {
            imgView.image = OFF_ART;
        }
    }
    
    if (newStarValue != value) {
        value = newStarValue;
        
        [self sendActionsForControlEvents:UIControlEventValueChanged];
        
        // 选中的星有放大的动画效果
        [UIView animateWithDuration:0.2f
                         animations:^{
                             headStarView.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
                         }
                         completion:^(BOOL finished) {
                             headStarView.transform = CGAffineTransformIdentity;
                         }];
    }
    
}

/*
 * 4个触摸监控事件
 */
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:self];

    // 向TouchDown事件发送事件
    [self sendActionsForControlEvents:UIControlEventTouchDown];
    
    [self updateStarRank:touchPoint];
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:self];

    if (CGRectContainsPoint(self.frame, touchPoint)) {
        // 触摸点在区域内
        [self sendActionsForControlEvents:UIControlEventTouchDragInside];
    } else {
        [self sendActionsForControlEvents:UIControlEventTouchDragOutside];
    }
    
    [self updateStarRank:touchPoint];
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:self];
    
    if (CGRectContainsPoint(self.frame, touchPoint)) {
        // 触摸点在区域内
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    } else {
        [self sendActionsForControlEvents:UIControlEventTouchUpOutside];
    }
}

- (void) cancelTrackingWithEvent:(UIEvent *)event
{
    [self sendActionsForControlEvents:UIControlEventTouchCancel];
}


@end
