//
//  MyUIViewController.h
//  SimpleTable
//
//  Created by Joe on 14-7-28.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyUIViewController : UITableViewController <UITableViewDataSource, UIAlertViewDelegate>


@property (nonatomic, strong) NSMutableArray *listTeams;
@property (nonatomic, strong) NSMutableArray *delList;

- (IBAction)editTeam:(id)sender;

- (IBAction)delTeam:(id)sender;
- (IBAction)addTeam:(id)sender;

@end
