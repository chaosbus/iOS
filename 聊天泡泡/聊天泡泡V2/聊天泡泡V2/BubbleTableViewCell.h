//
//  BubbleTableViewCell.h
//  聊天泡泡V2
//
//  Created by Joe on 14-9-17.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BUBBLE_TOP_SPACE    10
#define BUBBLE_WIDTH_LEFT   60  // 左右
#define BUBBLE_HEAD_SIZE    20  // 头像大小
#define BUBBLE_SPACE        8

#define BUBBLE_FONT_SIZE    15

@interface BubbleTableViewCell : UITableViewCell
{
    IBOutlet UILabel *_message;
    IBOutlet UILabel *_sendDate;
    IBOutlet UIImageView *_bubbleView;
}

@property (nonatomic) CGRect messageRect;
@property (nonatomic) CGRect bubbleViewRect;

@end
