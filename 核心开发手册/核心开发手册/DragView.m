//
//  DragView.m
//  核心开发手册
//
//  Created by Joe on 14/10/21.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "DragView.h"

@implementation DragView
{
    CGPoint startPoint;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithImage:(UIImage *)image
{
    if (self = [super initWithImage:image]) {
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    startPoint = [[touches anyObject] locationInView:self];
    [self.superview bringSubviewToFront:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self];
    CGFloat x = pt.x - startPoint.x;
    CGFloat y = pt.y - startPoint.y;
    
    CGPoint center = CGPointMake(self.center.x + x, self.center.y + y);
    self.center = center;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
