//
//  EngineInterface.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/8.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "EngineInterface.h"
#import "Manager+Helper.h"
#import "UsersInfo.h"

@interface EngineInterface()
{
    NSMutableArray * array;
}

@end

@implementation EngineInterface

static EngineInterface * instance = nil;

+(id)shareInstance
{
    @synchronized(self)
    {
        if (instance == nil)
        {
            instance = [[EngineInterface alloc] init];
        }
    }
    return instance;
}

//添加
-(BOOL)addObjectToDB:(id)sender
{
    return YES;
}

//查询
-(NSArray *)fetchAllDBInfo
{
    return nil;
}

//删除
-(BOOL)removeDBInfo:(NSString *)userName
{
    return YES;
}

@end
