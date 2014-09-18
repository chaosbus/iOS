//
//  BubbleTableViewCell.m
//  聊天泡泡V2
//
//  Created by Joe on 14-9-17.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "BubbleTableViewCell.h"

#define CELL_HEIGHT self.contentView.frame.size.height
#define CELL_WIDTH  self.contentView.frame.size.width

@implementation BubbleTableViewCell

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

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSString *orgin=_message.text;
    
    CGSize textSize = [orgin sizeWithFont:[UIFont systemFontOfSize:BUBBLE_FONT_SIZE]
                        constrainedToSize:CGSizeMake(CELL_WIDTH - BUBBLE_HEAD_SIZE - BUBBLE_SPACE - BUBBLE_WIDTH_LEFT, 999)
                            lineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect msgRect = CGRectMake(CELL_WIDTH - BUBBLE_HEAD_SIZE - BUBBLE_SPACE - textSize.width-15, (CELL_HEIGHT-textSize.height)/2 -4, textSize.width, textSize.height);
    [_message setFrame:msgRect];
    [_message setNumberOfLines:0];
    //    _message.backgroundColor = [UIColor grayColor];
    
    CGRect bubbleRect = CGRectMake(_message.frame.origin.x-10, _message.frame.origin.y-8, textSize.width+30, textSize.height+20);
    _bubbleView.frame = bubbleRect;
    _bubbleView.image = [[UIImage imageNamed:@"bubbleMine"]stretchableImageWithLeftCapWidth:21 topCapHeight:17];
    //    _bubbleView.backgroundColor = [UIColor greenColor];
}

@end
