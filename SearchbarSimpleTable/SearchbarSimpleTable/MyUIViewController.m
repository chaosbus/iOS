//
//  MyUIViewController.m
//  SearchbarSimpleTable
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
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"team_dictionary" ofType:@"plist"];
    
    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    
    NSArray * tempList = [self.dictData allKeys];
    self.listGroupname = [tempList sortedArrayUsingSelector:@selector(compare:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
