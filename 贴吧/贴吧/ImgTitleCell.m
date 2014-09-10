//
//  ImgTitleCell.m
//  贴吧
//
//  Created by Joe on 14-9-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ImgTitleCell.h"

@implementation ImgTitleCell
@synthesize iconImg = _iconImg;
@synthesize titleLable = _titleLable;
@synthesize noticeLabel = _noticeLabel;

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
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ImgTitleCell" owner:nil options:nil];
    self = [array lastObject];
    return self;
}


@end
