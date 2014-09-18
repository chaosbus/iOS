//
//  ChatCell.m
//  聊天泡泡
//
//  Created by Joe on 14-9-17.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ChatCell.h"

#define CELL_HEIGHT self.contentView.frame.size.height
#define CELL_WIDTH self.contentView.frame.size.width

@implementation ChatCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _message = [[UILabel alloc]initWithFrame:CGRectZero];
        _bubbleView = [[UIImageView alloc]initWithFrame:CGRectZero];
        
        [_message setFont:[UIFont systemFontOfSize:15]];
        
        [self.contentView addSubview:_bubbleView];
        [self.contentView addSubview:_message];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor clearColor]];
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


//- (void)myPop
//{
//    UIImage *img=[UIImage imageNamed:@"bubbleMine@2x"];
//    img = [img stretchableImageWithLeftCapWidth:43 topCapHeight:29];
//    self.chatSample.image = img;
//
//
//    UIImage *img0 = [UIImage imageNamed:@"bubbleMine@2x"];
//    UIImageView *img0View = [[UIImageView alloc] initWithImage:img0];
//    [img0View setFrame:CGRectMake(10, 220, 86, 64)];
//    [self. view addSubview:img0View];
//
//}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSString *orgin=_message.text;

    CGSize textSize = [orgin sizeWithFont:[UIFont systemFontOfSize:15]
                        constrainedToSize:CGSizeMake(CELL_WIDTH - HEAD_SIZE - 3 * INSETS - 60, TEXT_MAX_HEIGHT)
                            lineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect msgRect = CGRectMake(CELL_WIDTH - INSETS*2-HEAD_SIZE-textSize.width-15, (CELL_HEIGHT-textSize.height)/2 -4, textSize.width, textSize.height);
    [_message setFrame:msgRect];
    [_message setNumberOfLines:0];
//    _message.backgroundColor = [UIColor grayColor];
    
    CGRect bubbleRect = CGRectMake(_message.frame.origin.x-10, _message.frame.origin.y-8, textSize.width+30, textSize.height+20);
    _bubbleView.frame = bubbleRect;
    _bubbleView.image = [[UIImage imageNamed:@"bubbleMine"]stretchableImageWithLeftCapWidth:21 topCapHeight:17];
//    _bubbleView.backgroundColor = [UIColor greenColor];
}

- (void)setMessage:(NSString *)msg
{
    _message.text = msg;
}

@end
