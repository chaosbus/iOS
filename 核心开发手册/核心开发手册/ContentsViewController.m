//
//  ContentsViewController.m
//  核心开发手册
//
//  Created by Joe on 14-10-10.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ContentsViewController.h"
#import "ClassIndex.h"
#import "ButtonViewController.h"
#import "SliderViewController.h"
#import "AlertViewController.h"
#import "RectViewController.h"
#import "StarRankViewController.h"

#define CELL_ID @"Cell"

@interface ContentsViewController ()
{
    NSArray *__classArray;
}
@end

@implementation ContentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.title = @"目录";
    
    
    // 1.注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_ID];
    
    // 2.添加列表子类
    ClassIndex *buttonCls = [ClassIndex classIndexWithTitle:@"动态按键样例" classObject:[ButtonViewController class] identifier:@"ButtonViewController"];
    ClassIndex *sliderCls = [ClassIndex classIndexWithTitle:@"Slider样例" classObject:[SliderViewController class] identifier:@"SliderViewController"];
    ClassIndex *alertCls = [ClassIndex classIndexWithTitle:@"Alert样例" classObject:[AlertViewController class] identifier:@"AlertViewController"];
    ClassIndex *recCls = [ClassIndex classIndexWithTitle:@"Rect样例" classObject:[RectViewController class]];
    ClassIndex *rankCls = [ClassIndex classIndexWithTitle:@"评星样例" classObject:[StarRankViewController class] identifier:@"StarRankViewController"];

    __classArray = @[buttonCls, sliderCls, alertCls, recCls, rankCls];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [__classArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];

    // Configure the cell...
    ClassIndex *ci = [__classArray objectAtIndex:indexPath.row];
    cell.textLabel.text = ci.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClassIndex *ci = [__classArray objectAtIndex:indexPath.row];
    

    if (!ci.identifier) {
        UIViewController *vc = [[ci.controllerClass alloc] init];
        vc.title = ci.title;
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:ci.identifier];
        vc.title = ci.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
