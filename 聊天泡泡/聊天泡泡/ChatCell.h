//
//  ChatCell.h
//  聊天泡泡
//
//  Created by Joe on 14-9-17.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

//头像大小
#define HEAD_SIZE 50.0f
#define TEXT_MAX_HEIGHT 500.0f
//间距
#define INSETS 8.0f
@interface ChatCell : UITableViewCell
{
    UILabel *_message;
    UIImageView *_bubbleView;
}

- (void)setMessage:(NSString *)msg;
@end
