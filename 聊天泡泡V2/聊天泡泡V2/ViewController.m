//
//  ViewController.m
//  聊天泡泡
//
//  Created by Joe on 14-9-16.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "ViewController.h"
#import "BubbleTableViewCell.h"

@interface ViewController ()
@property (nonatomic) NSMutableArray *datalist;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self test];
    NSLog(@"--- %i", [self.datalist count]);
//    self.view.backgroundColor = [UIColor yellowColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test
{
    _datalist = [[NSMutableArray alloc] initWithObjects:
                  [NSBubbleData initBubbleData:@"Marge, there's something that I want to ask you, but I'm afraid, because if you say no, it will destroy me and make me a criminal." sendDate:[NSDate dateWithTimeIntervalSinceNow:-300] dataType:NSBubbleTypeMe],
                  [NSBubbleData initBubbleData:@"Well, I haven't said no to you yet, have I?" sendDate:[NSDate dateWithTimeIntervalSinceNow:-280] dataType:NSBubbleTypeSomeone],
                  [NSBubbleData initBubbleData:@"Marge... Oh, damn it." sendDate:[NSDate dateWithTimeIntervalSinceNow:0] dataType:NSBubbleTypeMe],
                  [NSBubbleData initBubbleData:@"What's wrong?" sendDate:[NSDate dateWithTimeIntervalSinceNow:300]  dataType:NSBubbleTypeSomeone],
                  [NSBubbleData initBubbleData:@"Ohn I wrote down what I wanted to say on a card.." sendDate:[NSDate dateWithTimeIntervalSinceNow:395]  dataType:NSBubbleTypeMe],                 
                 [NSBubbleData initBubbleData:@"MVC架构，设计精巧，使用简单 遵循COC原则，零配置，无xml独创Db + Record模式，灵活便利ActiveRecord支持，使数据库开发极致快速自动加载修改后的java文件，开发过程中无需重启web serverAOP支持，拦截器配置灵活，功能强大Plugin体系结构，扩展性强多视图支持，支持FreeMarker、JSP、Velocity强大的Validator后端校验功能功能齐全，拥有struts2的绝大部分功能体积小仅218K，且无第三方依赖JFinal 极速开发QQ群欢迎您的加入: 222478625、326297041、196337924以下是JFinal实现Blog管理的示例：1. 控制器(支持FreeMarker、JSP、Velocity、JSON等等以及自定义视图渲染)" sendDate:[NSDate dateWithTimeIntervalSinceNow:400]  dataType:NSBubbleTypeSomeone],
                  [NSBubbleData initBubbleData:@"The stupid thing must have fallen out of my pocket." sendDate:[NSDate dateWithTimeIntervalSinceNow:400]  dataType:NSBubbleTypeMe],
                 
                  nil];
//    _datalist = [[NSMutableArray alloc] initWithObjects:
//                 @"Alpha 11111111111 11111111111 111111111 11 11 Cocoa UI component for chat bubbles with avatars and images support Cocoa UI component for chat bubbles with avatars and images support", @"Bravo 2222222222 22 222222222 222222222222 2222222222222 22222asdf asdfasdfasdf asdfw qerqwer qwerqwef222222222", @"Charlie", @"Delta", @"Echo", @"Foxtrot%…………………………………………__________", @"Golf",
//                 @"Hotel", @"India", @"Juliet", @"Kilo11ddddddddddddddddddddddddddddddddddddddddddddddddddddd", @"Lima", @"Mike", @"November……………………………………………………………………………………",
//                 @"Oscar", @"Papa", @"Quebec", @"Romeo", @"Sierra", @"Tango",
//                 @"Uniform", @"Victor", @"Whiskey*****************************", @"Xray", @"Yankee", @"Zulu", nil];
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
    
    cell.textLabel.text =  @"haha";
#else
    BubbleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[BubbleTableViewCell alloc] init];
    }
    
    //    cell.backgroundColor = [UIColor whiteColor];
    
//    [cell setMessage:[self.datalist objectAtIndex:indexPath.row]];
    NSBubbleData *data = [self.datalist objectAtIndex:indexPath.row];
    cell.data = data;
//    cell.message.text = data.message;
//    cell.sendDate.text = data.date;
#endif
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    NSBubbleData *data = [self.datalist objectAtIndex:indexPath.row];
    return [(BubbleTableViewCell*)cell heightBubbleCell:data.message];
}

@end
