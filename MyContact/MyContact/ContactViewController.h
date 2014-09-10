//
//  PersonViewController.h
//  MyContact
//
//  Created by Joe on 14-8-14.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ContactViewController : UITableViewController <UISearchBarDelegate, UITabBarControllerDelegate>

@property (nonatomic, strong) NSArray *listContacts;


@end
