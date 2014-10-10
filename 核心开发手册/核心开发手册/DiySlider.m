//
//  DiySlider.m
//  核心开发手册
//
//  Created by Joe on 14-9-26.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "DiySlider.h"

@implementation DiySlider

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)startDrag
{
    self.frame = CGRectInset(self.frame, 0.0f, 10.0f);
    NSLog(@"+ [%f %f]", self.frame.size.width, self.frame.size.height);
}

- (void)endDrag
{
    self.frame = CGRectInset(self.frame, 0.0f, -10.0f);
    NSLog(@"- [%f %f]", self.frame.size.width, self.frame.size.height);
}

- (void)change
{
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        NSLog(@"not");
        return self;
    }
    
    [self setThumbImage:[UIImage imageNamed:@"Swizerland"] forState:UIControlStateNormal];
    
    [self addTarget:self action:@selector(startDrag) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(endDrag) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [self addTarget:self action:@selector(change) forControlEvents:UIControlEventValueChanged];
    
    [self test];
    
    return self;
}

+ (id)initSlider
{
    DiySlider *slider = [[DiySlider alloc] initWithFrame:CGRectMake(20, 100, 200, 20)];
    slider.backgroundColor = [UIColor purpleColor];
    slider.continuous = YES;
    
    return slider;
}


- (void)test
{
    CGRect rect = CGRectMake(50.0, 50.0, 100.0, 100.0);
    CGRect rectToDraw = CGRectInset(rect, 10.0, 0.0);
    NSLog(@"CGRectInset : %@", NSStringFromCGRect(rectToDraw));
}


@end
