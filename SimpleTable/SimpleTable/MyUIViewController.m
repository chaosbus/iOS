//
//  MyUIViewController.m
//  SimpleTable
//
//  Created by Joe on 14-7-28.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "MyUIViewController.h"

@interface MyUIViewController ()

@end

@implementation MyUIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSBundle *bundle = [NSBundle mainBundle];
	NSString *plistPath = [bundle pathForResource:@"team"
                                           ofType:@"plist"];
    
	self.listTeams = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    NSLog(@"plistPath[%@]", plistPath);
    //NSLog(@"listTeams[%@]", self.listTeams);
    
    
    //UITableView *tableView = (UITableView *)self.view;
    
    //tableView.allowsMultipleSelectionDuringEditing = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberOfRowsInSection");
    return [self.listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIndentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
    if (cell == nil) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIndentifier];
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIndentifier];
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIndentifier];
    }
    
    NSUInteger row = [indexPath row];
    NSDictionary *rowDict = [self.listTeams objectAtIndex:row];
    
    // 标题
    cell.textLabel.text = [rowDict objectForKey:@"name"];
    // 子标题
    cell.detailTextLabel.text = [rowDict objectForKey:@"image"];
    
    NSString *imagePath = [rowDict objectForKey:@"image"];
    cell.imageView.image = [UIImage imageNamed:imagePath];
    
    
    //NSLog(@"row:%ld   rowDict:%@", (long)indexPath.row, rowDict);
    NSLog(@"cell: %p   row:%ld", cell, (long)indexPath.row);
    
    /*
    NSString *imagePath = [rowDict objectForKey:@"image"];
    imagePath = [imagePath stringByAppendingString:@".png"];
    cell.imageView.image = [UIImage imageNamed:imagePath];
    */
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}

- (void)addTeam:(id)sender
{
    NSLog(@"addTeam");
    
    /*
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"添加球队" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert show];
    
    //[alert release];
     */
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *newTeam = [alertView textFieldAtIndex:0].text;
    
    UITableView *tableView = (UITableView *)self.view;
    
    [self.listTeams insertObject:newTeam atIndex:0];
    
    //[tableView reloadData];
}

- (void)delTeam:(id)sender
{
    
}

#pragma mark 点击修改按钮
- (void)editTeam:(id)sender
{
    NSLog(@"click edit");
    
    UITableView *tableView = (UITableView*) self.view;
    
    if (tableView.isEditing) {
        [tableView setEditing:NO animated:YES];
    } else {
        [tableView setEditing:YES animated:YES];
    }
}


#pragma mark 修改提交 
/* 
 * 提交会执行 : numberOfRowsInSection -> cellForRowAtIndexPath
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"commitEditingStyple");
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        /* 1.删除数据源 */
        [self.listTeams removeObjectAtIndex:indexPath.row];
        
        
        /* 2.刷新界面，cell */
        //全部重新刷新，耗费资源
        //[tableView reloadData];
        // 只刷新移除删除的指定cell
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    NSLog(@"commitEditingStyle Done");
}

#pragma mark 表排序换行
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSLog(@"moveRowAtIndexPath");
    
    /* cell换行，数据源也需要作出修改 */
    [self.listTeams exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    
}

#pragma mark 设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"heightForRowAtIndexPath");
    return 50;
}


#pragma mark cell被选中时的处理
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected");
    // 设置为未被选中  animated是否需要动画效果
    
    if (tableView.isEditing) {
        NSLog(@"selected - %@", indexPath);
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
