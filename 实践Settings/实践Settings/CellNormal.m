//
//  CellNormal.m
//  实践Settings
//
//  Created by Joe on 14-8-8.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "CellNormal.h"

@implementation CellNormal

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
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CellNormal" owner:nil options:nil];
    
    self = [array lastObject];
    return self;
}

@end
