//
//  MeTableViewCell.m
//  Weixin
//
//  Created by Joe on 14-9-5.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "MeCell.h"

@implementation MeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

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
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"AboutMeViewController" owner:self options:nil];
    return [array objectAtIndex:0];
}

@end
