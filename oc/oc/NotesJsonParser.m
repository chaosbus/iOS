//
//  NotesJsonParser.m
//  oc
//
//  Created by Joe on 14-8-26.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "NotesJsonParser.h"

@implementation NotesJsonParser

- (void)start123
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Notes" ofType:@"json"];
    NSLog(@"Path : %@", path);
    
    NSData *jsondata = [[NSData alloc] initWithContentsOfFile:path];
    
    NSError *error;
    id obj = [NSJSONSerialization JSONObjectWithData:jsondata options:NSJSONReadingMutableContainers error:&error];
    
    if (!jsondata || error)
        NSLog(@"error...");
    
    
}


@end
