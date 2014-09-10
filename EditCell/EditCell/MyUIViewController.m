//
//  MyUIViewController.m
//  EditCell
//
//  Created by Joe on 14-7-30.
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
    
    self.navgationItem.rightBarButtonItem = self.editButtonItem;
    self.navgationItem.title = @"修改删除";
    
    self.txtField.hidden = YES;
    self.txtField.delegate = self;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.listTeams = [[NSMutableArray alloc] initWithObjects:@"A1...", @"b2...", @"c3...", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark --UITableViewDataSource 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listTeams count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    BOOL b_addCell = (indexPath.row == self.listTeams.count);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier] ;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    if (!b_addCell) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = [self.listTeams objectAtIndex:indexPath.row];
    } else {
        self.txtField.frame = CGRectMake(10,0,300, 55);
        self.txtField.text = @"";
        [cell.contentView addSubview:self.txtField];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.listTeams removeObjectAtIndex: indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        [self.listTeams insertObject:self.txtField.text atIndex:[self.listTeams count]];
        
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
        
        [self.tableView reloadData];
    }
    
}

#pragma mark --UITableViewDelegate 协议方法

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.listTeams count]) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.listTeams count]) {
        return NO;
    } else {
        return YES;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark -- UIViewController生命周期方法，用于响应视图编辑状态变化
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    [self.tableView setEditing:editing animated:YES];
    if (editing) {
        self.txtField.hidden = NO;
    } else {
        self.txtField.hidden = YES;
    }
}

#pragma mark -- UITextFieldDelegate委托方法,关闭键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}

#pragma mark -- UITextFieldDelegate委托方法,避免键盘遮挡文本框
- (void) textFieldDidBeginEditing:(UITextField *)textField {
    UITableViewCell *cell = (UITableViewCell*) [[textField superview] superview];
    [self.tableView setContentOffset:CGPointMake(0.0, cell.frame.origin.y) animated:YES];
}

@end
