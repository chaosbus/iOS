//
//  CellSwitch.h
//  实践Settings
//
//  Created by Joe on 14-8-8.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellSwitch : UITableViewCell

@property (nonatomic, assign) IBOutlet UIImageView *icon;
@property (nonatomic, assign) IBOutlet UILabel *title;
@property (nonatomic, assign) IBOutlet UISwitch *sw;

@end
