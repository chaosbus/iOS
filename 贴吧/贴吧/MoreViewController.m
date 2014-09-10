//
//  MoreViewController.m
//  贴吧
//
//  Created by Joe on 14-9-9.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "MoreViewController.h"
#import "ImgTitleCell.h"
#import "AboutMeCell.h"

@interface MoreViewController ()

@property (nonatomic, strong) NSArray *moreList;

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"hahahaaha";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
//    self.navigationController.visibleViewController.title = @"FirstTabBar + FirstNav";
//    self.navigationController.title = @"123456";
    self.navigationItem.title = @"更多";
    
    
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"More" ofType:@"plist"];
    _moreList = [[NSArray alloc] initWithContentsOfFile:plistPath];

    NSLog(@"section : %i", _moreList.count);
    for (int i = 0; i<_moreList.count; i++) {
        
        NSArray *a = [_moreList objectAtIndex:i];
        NSLog(@"row : %i", a.count);
        for (int j = 0; j< a.count; j++) {
            NSLog(@"\t %@", a[j]);
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _moreList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = [_moreList objectAtIndex:section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentify;
    NSArray *group = [_moreList objectAtIndex:indexPath.section];
    NSString *title = [group objectAtIndex:indexPath.row];
    
    if (indexPath.section == 0) {
        cellIdentify = @"AboutMe";
        
        AboutMeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
        if (!cell) {
            cell = [[AboutMeCell alloc] init];
        }

        cell.headImg.image = [UIImage imageNamed:@"1"];
        cell.accountLabel.text = @"Account";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    } else {
        cellIdentify = @"ImgTitleCell";
        
        ImgTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
        if (!cell) {
            cell = [[ImgTitleCell alloc] init];
        }
        
        cell.iconImg.image = [UIImage imageNamed:@"2"];
        cell.titleLable.text = title;
        cell.noticeLabel.text = nil;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
//    return cell;
}

#pragma mark - 自动获取cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


#pragma mark - 节头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    tableView.sectionFooterHeight = 1.0;
    return 1;
}

#pragma mark - 节脚
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
