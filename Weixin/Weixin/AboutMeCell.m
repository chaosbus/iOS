//
//  AboutMeCell.m
//  Weixin
//
//  Created by Joe on 14-9-5.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "AboutMeCell.h"

@implementation AboutMeCell

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
    NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"AboutMeCell" owner:self options:nil];
    
    return cellArray[0];
}

@end
