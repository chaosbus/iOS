//
//  NoteDAO.m
//  数据持久化-属性列表
//
//  Created by Joe on 14-8-14.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import "NoteDAO.h"

@implementation NoteDAO

- (void)createEditableCopyOfDatabaseIfNeeded
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *writableDBPath = [self applicationDocumentsDirectoryFile];
    NSLog(@"applicationDocumentsDirectoryFile: %@", writableDBPath);
    
}
@end
