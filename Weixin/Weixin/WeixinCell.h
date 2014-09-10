//
//  WeixinCell.h
//  Weixin
//
//  Created by Joe on 14-9-4.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeixinCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *conversationLabel;
@property (weak, nonatomic) IBOutlet UILabel *latestTimeLabel;
@end
