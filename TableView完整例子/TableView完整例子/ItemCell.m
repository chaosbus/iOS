//
//  ItemCell.m
//  TableView完整例子
//
//  Created by Joe on 14-9-2.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

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
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ItemCell" owner:nil options:nil];
    
    self = [array lastObject];
    return self;
}

@end
