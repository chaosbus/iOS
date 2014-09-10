//
//  OneViewController.m
//  实践Settings
//
//  Created by Joe on 14-8-8.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "OneViewController.h"
#import "TwoTableViewController.h"
#import "CellSwitch.h"
#import "CellNormal.h"

#import "BlueToothViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    /* 读取一级菜单配置 */
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"One" ofType:@"plist"];
    
    self.confDict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
     self.confGroup = [[self.confDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    NSLog(@"One.plist keys : %@", [self.confDict allKeys]);
    NSLog(@"grou : %@", self.confGroup);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [self.confGroup count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    // 取出组名
    NSString *groupName = [self.confGroup objectAtIndex:section];
    // 根据组名获取成员列表
    NSArray *listMember = [self.confDict objectForKey:groupName];
    return [listMember count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    id vCell;
    
    // 获取当前所在section
    NSInteger section = [indexPath section];
    NSString *groupName = [self.confGroup objectAtIndex:section];
    NSArray *listMember = [self.confDict objectForKey:groupName];
    

//
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId]; // forIndexPath:indexPath];
//    if (nil == cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
//    }
//    
//    // Configure the cell...
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    // 获取当前所在section
//    NSInteger section = [indexPath section];
//    NSString *groupName = [self.confGroup objectAtIndex:section];
//    NSArray *listMember = [self.confDict objectForKey:groupName];
//    
//    cell.textLabel.text = [listMember objectAtIndex:indexPath.row];
    
    


    if (section == 0 && row == 0) {
        NSString *cellId = @"CellSwitch";

        CellSwitch *cell = [tableView dequeueReusableCellWithIdentifier:cellId]; // forIndexPath:indexPath];
        if (nil == cell) {
            cell = [[CellSwitch alloc] init];
        }

        // Configure the cell...
        cell.title.text = [listMember objectAtIndex:indexPath.row];
        cell.icon.image = [UIImage imageNamed:@"icon"];
        
        vCell = cell;
    } else {
        NSString *cellId = @"CellNormal";
        
        
        CellNormal *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (nil == cell) {
            cell = [[CellNormal alloc] init];
        }
        
        // Configure the cell...
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.title.text = [listMember objectAtIndex:indexPath.row];
        cell.icon.image = [UIImage imageNamed:@"icon"];
        
        if (section == 0) {
            if (row ==1)
                cell.detail.text = @"wifi";
            else if (row == 2)
                cell.detail.text = @"关闭";
            else if (row == 4)
                cell.detail.text = @"关闭";
            else if (row == 5)
                cell.detail.text = @"CHINA MOBILE";
            else
                cell.detail.text = nil;
        } else
            cell.detail.text = nil;
        
        vCell = cell;
        
    }
    
    return vCell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 某些不需要导航
//    if (<#condition#>) {
//        <#statements#>
//    }
//
    id detailCtrl;
    
    
    // 获取当前所在section
    NSInteger section = [indexPath section];
    NSString *groupName = [self.confGroup objectAtIndex:section];
    NSArray *listMember = [self.confDict objectForKey:groupName];
    
    
    // Navigation logic may go here, for example:
    // Create the next view controller.
//    TwoTableViewController *detailViewController = [[TwoTableViewController alloc] initWithNibName:@"gaga" bundle:nil];
    
    // Pass the selected object to the new view controller.
    if (0) {
        TwoTableViewController *detailViewController = [[TwoTableViewController alloc] init];
        detailViewController.title = @"hahaha";
        
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleBordered target:nil action:nil];
        
        detailCtrl = detailViewController;
    } else {
        
        BlueToothViewController *detailViewController = [[BlueToothViewController alloc] init];
        detailViewController.title = [listMember objectAtIndex:indexPath.row];;
        
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleBordered target:nil action:nil];
        detailCtrl = detailViewController;

    }
    
    // Push the view controller.
    [self.navigationController pushViewController:detailCtrl animated:YES];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"1";
            break;
        case 1:
            return @"2";
            break;
        case 3:
            return @"3";
            break;
        default:
            break;
    }
    
    return @"asdf";
}

@end
