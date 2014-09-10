//
//  WeixinCell.m
//  Weixin
//
//  Created by Joe on 14-9-4.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "WeixinCell.h"

@implementation WeixinCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (id)init
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"WeixinCell" owner:nil options:nil];
    
    self = [array lastObject];
    return self;
}

+ (CGFloat)heightForWeixinCell
{
    return 64;
}

@end
