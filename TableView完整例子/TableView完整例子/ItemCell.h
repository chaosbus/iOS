//
//  ItemCell.h
//  TableView完整例子
//
//  Created by Joe on 14-9-2.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *sn;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@end
