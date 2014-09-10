//
//  AboutMeCell.h
//  Weixin
//
//  Created by Joe on 14-9-5.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutMeCell : UITableViewCell
{
    
    __weak IBOutlet UILabel *nickName;
    __weak IBOutlet UIImageView *headImg;
    __weak IBOutlet UILabel *id;
    __weak IBOutlet UIImageView *optionImg;
    __weak IBOutlet UILabel *optionTitle;
}
@end
