//
//  ImgTitleCell.h
//  贴吧
//
//  Created by Joe on 14-9-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgTitleCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_iconImg;
    __weak IBOutlet UILabel *_titleLable;
    __weak IBOutlet UILabel *_noticeLabel;
}

@property (nonatomic, weak) IBOutlet UIImageView *iconImg;
@property (nonatomic, weak) IBOutlet UILabel *titleLable;
@property (nonatomic, weak) IBOutlet UILabel *noticeLabel;

@end
