//
//  AboutMeCell.m
//  贴吧
//
//  Created by Joe on 14-9-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "AboutMeCell.h"

@implementation AboutMeCell
@synthesize headImg = _headImg;
@synthesize accountLabel = _accountLabel;

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
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"AboutMeCell" owner:nil options:nil];
    self = [array lastObject];
    return self;
}

@end
