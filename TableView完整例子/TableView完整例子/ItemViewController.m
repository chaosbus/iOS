//
//  ItemViewController.m
//  TableView完整例子
//
//  Created by Joe on 14-9-1.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ItemViewController.h"
#import "ItemCell.h"
#import "DetailViewController.h"

@interface ItemViewController ()

@property (nonatomic, strong) NSMutableArray *itemList;
@property (nonatomic, strong) NSMutableArray *snList;
@end


@implementation ItemViewController

- (void)initItemArray
{
    _itemList = [[NSMutableArray alloc] initWithObjects:
                 @"Alpha", @"Bravo", @"Charlie", @"Delta", @"Echo", @"Foxtrot", @"Golf",
                 @"Hotel", @"India", @"Juliet", @"Kilo", @"Lima", @"Mike", @"November",
                 @"Oscar", @"Papa", @"Quebec", @"Romeo", @"Sierra", @"Tango",
                 @"Uniform", @"Victor", @"Whiskey", @"Xray", @"Yankee", @"Zulu", nil];
    
    _snList = [[NSMutableArray alloc] initWithObjects:
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7",
                 @"8", @"9", @"10", @"11", @"12", @"13", @"14",
                 @"15", @"16", @"17", @"18", @"19", @"20",
                 @"21", @"22", @"23", @"24", @"25", @"26", nil];
//    NSLog(@"itemList : [%@]\n %i", _itemList, _itemList.count);
}

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        ;
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
//    self = [super initWithStyle:style];
    self = [super init];
    if (self) {
        ;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"例子";
    [self initItemArray];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSLog(@"numberOfRowsInSection : %lu", (unsigned long)self.itemList.count);
    return self.itemList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    NSString *title = [self.itemList objectAtIndex:indexPath.row];
    NSString *sn = [self.snList objectAtIndex:indexPath.row];
    
#if 0
//    NSString *cellIdentify = @"MyCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
//    if (NULL == cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
//    }
//    cell.textLabel.text = title;
//    NSLog(@"cellForRowAtIndexPath : %i, %@", indexPath.row, title);
#else
    NSString *cellIdentify = @"ItemCell";
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (NULL == cell) {
        cell = [[ItemCell alloc] init];
    }
    cell.title.text = title;
    cell.sn.text = sn;
    NSLog(@"cellForRowAtIndexPath : %li, %@", (long)indexPath.row, title);
#endif
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

#pragma mark - 删除,插入Cell
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        /* 1.删除数据源 */
        [self.itemList removeObjectAtIndex:indexPath.row];
        
        /* 2.刷新界面，cell */
#if 0
        //全部重新刷新，耗费资源
        [tableView reloadData];
#else
        // 只刷新移除删除的指定cell
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
#endif
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


// Override to support rearranging the table view.
#pragma mark - 调整Cell顺序
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSLog(@"moveRowAtIndexPath");
    
    /* cell换行，数据源也需要作出修改 */
    [self.itemList exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
}


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
#pragma mark - 选中Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:nil bundle:nil];
    
    // Pass the selected object to the new view controller.
//    NSString *title = [self.itemList objectAtIndex:indexPath.row];
//    NSString *sn = [self.snList objectAtIndex:indexPath.row];
//    detailViewController.objCode = [[NSString alloc] initWithString:title];
//    detailViewController.objSN = [[NSString alloc] initWithString:sn];
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    
#if 0
    /* 这里是取消选择显示的样式 */
    NSLog(@"didSelectRowAtIndexPath : Selected");
    if (tableView.isEditing) {
        NSLog(@"selected - %@", indexPath);
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
#endif
}

#pragma mark - Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


@end
