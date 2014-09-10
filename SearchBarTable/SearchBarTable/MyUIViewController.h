//
//  MyUIViewController.h
//  SearchBarTable
//
//  Created by Joe on 14-7-29.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyUIViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSArray *listTeam;
@property (nonatomic, strong) NSMutableArray *listFilterTeams;

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSUInteger)scope;

@end
