//
//  MyUIViewController.h
//  EditCell
//
//  Created by Joe on 14-7-30.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyUIViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong) NSMutableArray *listTeams;

@property (weak, nonatomic) IBOutlet UINavigationItem *navgationItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *txtField;


@end
