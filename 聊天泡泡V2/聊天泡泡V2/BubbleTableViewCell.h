//
//  BubbleTableViewCell.h
//  聊天泡泡V2
//
//  Created by Joe on 14-9-17.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSBubbleData.h"

#define IS_BUBBLE_ON_TOP    0   // 头像在泡泡最上面？

#define BUBBLE_FONT_SIZE    13  // 字体大小

#define MSG_TO_BUBBLE_HEAD_OFFSET   8.0f    // 文本与泡泡头间距
#define MSG_TO_BUBBLE_TAIL_OFFSET   15.0f   // 文本与泡泡尾间距
#define BUBBLE_WIDTH_LEFT   80.0f   // 左右空白间距
#define BUBBLE_HEAD_SIZE    40.0f   // 头像大小
#define BUBBLE_SPACE        6.0f    // 头像与泡泡间距

@interface BubbleTableViewCell : UITableViewCell
{
    IBOutlet UILabel *_message;
    IBOutlet UILabel *_sendDate;
    IBOutlet UIImageView *_bubbleView;
    IBOutlet UIImageView *_headView;
}

@property (nonatomic) IBOutlet UILabel *message;
@property (nonatomic) IBOutlet UILabel *sendDate;
@property (nonatomic) IBOutlet UIImageView *bubbleView;
@property (nonatomic) IBOutlet UIImageView *headView;
@property (nonatomic) NSbubbleType type;

@property (nonatomic) CGRect messageRect;
@property (nonatomic) CGRect bubbleViewRect;
@property (nonatomic) CGRect sendDateRect;
@property (nonatomic) NSBubbleData *data;

- (NSInteger)heightForBubbleCell;
- (CGFloat)heightBubbleCell:(NSString *)message;

@end
