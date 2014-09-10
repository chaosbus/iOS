//
//  AboutMeViewController.m
//  Weixin
//
//  Created by Joe on 14-9-3.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "AboutMeViewController.h"
#import "AboutMeCell.h"

@interface AboutMeViewController ()

@property (nonatomic, strong) NSDictionary *confDict;
@property (nonatomic, strong) NSArray *confGroup;
@end

@implementation AboutMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *aboutmePlistPath = [bundle pathForResource:@"AboutMe" ofType:@"plist"];
    
    self.confDict = [[NSDictionary alloc] initWithContentsOfFile:aboutmePlistPath];
    
    self.confGroup = [[self.confDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    NSLog(@"One.plist keys : %@", [self.confDict allKeys]);
    NSLog(@"group : %@", self.confGroup);
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
    return [[self.confDict objectForKey:[self.confGroup objectAtIndex:section]] count];
}

//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSInteger section = indexPath.section;
//    NSInteger row = indexPath.row;
//    id uCell;
//    
//    if (section == 0) {
//        AboutMeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeCell"];
//        if (NULL == cell) {
//            cell = [[AboutMeCell alloc] init];
//        }
//        cell.nickNameLabel.text = @"Solodisplay";
//        cell.idLabel.text = @"2341234560";
//        cell.headImg.image = [UIImage imageNamed:@"3"];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        
//        uCell = cell;
//    } else {
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OptionCell"];
//        if (NULL == cell) {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OptionCell"];
//        }
//        cell.imageView.image = [UIImage imageNamed:@"asdf"];
//        cell.textLabel.text = [self.confDict objectForKey:[self.confGroup objectAtIndex:section]][row];
//    }
//
////    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
//    
//    // Configure the cell...
//
//    return uCell;
//}


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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
