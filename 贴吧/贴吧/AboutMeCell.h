//
//  AboutMeCell.h
//  贴吧
//
//  Created by Joe on 14-9-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutMeCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_headImg;
    __weak IBOutlet UILabel *_accountLabel;
}

@property (nonatomic, weak) IBOutlet UIImageView *headImg;
@property (nonatomic, weak) IBOutlet UILabel *accountLabel;

#define ABOUTME_CELL_IDENTIFIER  @"AboutMeCell"
@end
