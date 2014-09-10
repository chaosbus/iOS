//
//  main.m
//  oc
//
//  Created by Joe on 14-8-7.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotesJsonParser.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        CGPoint mypt = CGPointMake(33.7, 83.1);
        CGSize mysz = CGSizeMake(800, 600);
        
        CGRect myrec = CGRectMake(10.5, 5.5, 100, 80);
        
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSArray *array01 = [[NSArray alloc] initWithObjects:@"1a", @"2b", @"3c", nil];
        NSData *data02 = [NSKeyedArchiver archivedDataWithRootObject:array01];//通过归档对NSArray进行转码，保存了数组的序列
        NSLog(@"archive : %@", data02);
        
        NSArray *array02 = [NSKeyedUnarchiver unarchiveObjectWithData:data02];//通过发归档进行NSData反转码，返回有序列的数组
        NSLog(@"unarchive : %@", array02);
        
        
//        NotesJsonParser *json = [NotesJsonParser alloc];
//        [json start123];
        
    }
    return 0;
}

