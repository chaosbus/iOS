//
//  NoteDAO.h
//  数据持久化-属性列表
//
//  Created by Joe on 14-8-14.
//  Copyright (c) 2014年 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@interface NoteDAO : NSObject

+ (NoteDAO*)sharedManager;
- (NSString*)applicationDocumentsDirectoryFile;
- (void)createEditableCopyOfDatabaseIfNeeded;
- (int)create:(Note*)model;
- (int)modify:(Note*)model;
- (NSMutableArray*)findAll;
- (Note*)findById:(Note*)model;

@end
