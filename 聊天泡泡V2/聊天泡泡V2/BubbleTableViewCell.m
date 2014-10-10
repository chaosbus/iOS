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

@synthesize message = _message;
@synthesize bubbleView = _bubbleView;
@synthesize sendDate = _sendDate;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _sendDate = [[UILabel alloc] initWithFrame:CGRectZero];
        [_sendDate setFont:[UIFont systemFontOfSize:11]];
        [_sendDate setTextColor:[UIColor darkGrayColor]];
        [_sendDate setBackgroundColor:[UIColor clearColor]];
        
        _message = [[UILabel alloc] initWithFrame:CGRectZero];
        [_message setNumberOfLines:0];
        [_message setFont:[UIFont systemFontOfSize:BUBBLE_FONT_SIZE]];
        [_message setBackgroundColor:[UIColor clearColor]];
        
        _bubbleView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_bubbleView setBackgroundColor:[UIColor clearColor]];
        
        _headView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_headView setBackgroundColor:[UIColor clearColor]];
        
        [self.contentView addSubview:_sendDate];
        [self.contentView addSubview:_bubbleView];
        [self.contentView addSubview:_message];
        [self.contentView addSubview:_headView];
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
    
    _message.text = _data.message;
    _type = _data.type;
//    _sendDate = _data.date;
    
    
    float x, y; // 泡泡的坐标
    float msgBubbleOffset;  // 泡泡x与文本x的偏移。泡泡的引脚左右之分
    float xHead, yHead;    // 头像x坐标
    NSInteger leftCapWidth, topCapHeight;
    NSString *bubbleImage;
    NSString *headImage;

    
    /* 是否显示时间 */
    if (1) {
        _sendDateRect = CGRectMake(0, 0, CELL_WIDTH, 15);
        _sendDate.frame = _sendDateRect;
        [_sendDate setTextAlignment:NSTextAlignmentCenter];
        [_sendDate setHidden:NO];
        [_sendDate setText:@"time's up"];
    } else {    // 不需要显示消息发送时间
        [_sendDate setHidden:YES];
    }

    // lable实际显示大小。保证足够高
    CGSize messageSize = [_message.text sizeWithFont:[UIFont systemFontOfSize:BUBBLE_FONT_SIZE]
                                constrainedToSize:CGSizeMake(CELL_WIDTH - BUBBLE_HEAD_SIZE - BUBBLE_SPACE * 2 - BUBBLE_WIDTH_LEFT, 999)
                                    lineBreakMode:NSLineBreakByWordWrapping];
    
    NSString *head;
    if (NSBubbleTypeMe == _type) {
        x = CELL_WIDTH - BUBBLE_HEAD_SIZE - BUBBLE_SPACE * 2 - messageSize.width - MSG_TO_BUBBLE_HEAD_OFFSET - MSG_TO_BUBBLE_TAIL_OFFSET;
        xHead = CELL_WIDTH - BUBBLE_HEAD_SIZE - BUBBLE_SPACE;
        bubbleImage = @"bubbleMine";
        leftCapWidth = 21;
        topCapHeight = 17;
        msgBubbleOffset = MSG_TO_BUBBLE_HEAD_OFFSET;
        
        [_headView setImage:[UIImage imageNamed:@"001@2x"]];
        [_headView setBackgroundColor:[UIColor redColor]];
    } else {
        x = BUBBLE_HEAD_SIZE + BUBBLE_SPACE * 2;
        xHead = BUBBLE_SPACE;
        bubbleImage = @"bubbleSomeone";
        leftCapWidth = 26;
        topCapHeight = 17;
        msgBubbleOffset = MSG_TO_BUBBLE_TAIL_OFFSET;
        
        [_headView setImage:[UIImage imageNamed:@"012@2x"]];
        [_headView setBackgroundColor:[UIColor greenColor]];
    }
    
    y = 0 + _sendDate.frame.size.height;

    // 聊天泡泡
    CGRect bubbleViewRect = CGRectMake(x, y, messageSize.width + MSG_TO_BUBBLE_HEAD_OFFSET + MSG_TO_BUBBLE_TAIL_OFFSET, messageSize.height + BUBBLE_SPACE * 2);
    [_bubbleView setFrame:bubbleViewRect];
    [_bubbleView setImage:[[UIImage imageNamed:bubbleImage] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight]];
    
    // 聊天信息
    CGRect messageRect = CGRectMake(x + msgBubbleOffset, y + BUBBLE_SPACE / 2, messageSize.width, messageSize.height);
    [_message setFrame:messageRect];
    
    // 头像 上/下对齐
    if (!IS_BUBBLE_ON_TOP) {
        if (bubbleViewRect.size.height > BUBBLE_HEAD_SIZE) {
            yHead = bubbleViewRect.origin.y + bubbleViewRect.size.height - BUBBLE_HEAD_SIZE - 4;
        } else {
            yHead = y - (BUBBLE_HEAD_SIZE - bubbleViewRect.size.height);
        }
    } else {
        yHead = _sendDate.frame.size.height;
    }

    CGRect headRect = CGRectMake(xHead, yHead, BUBBLE_HEAD_SIZE, BUBBLE_HEAD_SIZE);
    
    [_headView setFrame:headRect];
//    [_headView setImage:[[UIImage imageNamed:headImage] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight]];
}

- (NSInteger)heightForBubbleCell
{
    return self.sendDate.frame.size.height + ((self.headView.frame.size.height > self.bubbleView.frame.size.height) ? self.headView.frame.size.height : self.bubbleView.frame.size.height);
}

- (CGFloat)heightBubbleCell:(NSString *)message
{
    CGSize messageSize = [message sizeWithFont:[UIFont systemFontOfSize:BUBBLE_FONT_SIZE]
              constrainedToSize:CGSizeMake(CELL_WIDTH - BUBBLE_HEAD_SIZE - BUBBLE_SPACE * 2 - BUBBLE_WIDTH_LEFT, 999)
                  lineBreakMode:NSLineBreakByWordWrapping];
    
    CGFloat height = messageSize.height + BUBBLE_SPACE * 2;

    return (((height > BUBBLE_HEAD_SIZE) ? height : BUBBLE_HEAD_SIZE) + BUBBLE_SPACE)+15;
}


@end
