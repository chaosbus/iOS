//
//  ViewController.m
//  聊天泡泡
//
//  Created by Joe on 14-9-16.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ViewController.h"
#import "ChatCell.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self test];
    NSLog(@"--- %i", [self.datalist count]);
    self.view.backgroundColor = [UIColor yellowColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test
{
    _datalist = [[NSMutableArray alloc] initWithObjects:
                 @"Alpha 11111111111 11111111111 111111111 11 11 Cocoa UI component for chat bubbles with avatars and images support Cocoa UI component for chat bubbles with avatars and images support", @"Bravo 2222222222 22 222222222 222222222222 2222222222222 22222asdf asdfasdfasdf asdfw qerqwer qwerqwef222222222", @"Charlie", @"Delta", @"Echo", @"Foxtrot%…………………………………………__________", @"Golf",
                 @"Hotel", @"India", @"Juliet", @"Kilo11ddddddddddddddddddddddddddddddddddddddddddddddddddddd", @"Lima", @"Mike", @"November……………………………………………………………………………………",
                 @"Oscar", @"Papa", @"Quebec", @"Romeo", @"Sierra", @"Tango",
                 @"Uniform", @"Victor", @"Whiskey*****************************", @"Xray", @"Yankee", @"Zulu", nil];
}

#pragma mark --UITableViewDataSource 协议方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.datalist count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
#if 0
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.backgroundColor = [UIColor clearColor];

    cell.textLabel.text =  [self.datalist objectAtIndex:indexPath.row];
#else
    ChatCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ChatCell alloc] init];
    }
    
//    cell.backgroundColor = [UIColor whiteColor];
    
    [cell setMessage:[self.datalist objectAtIndex:indexPath.row]];
#endif

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *orgin = [self.datalist objectAtIndex:indexPath.row];
    CGSize textSize = [orgin sizeWithFont:[UIFont systemFontOfSize:15]
                        constrainedToSize:CGSizeMake((320-HEAD_SIZE-3*INSETS-40),TEXT_MAX_HEIGHT)
                            lineBreakMode:NSLineBreakByWordWrapping];
    return 40 + textSize.height;
}

@end
