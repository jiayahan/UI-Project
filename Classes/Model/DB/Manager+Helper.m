//
//  Manager+Helper.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/8.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "Manager+Helper.h"
#import "Users.h"
#import "UsersInfo.h"

@implementation Manager (Helper)

//增
-(BOOL)addUsersInfo:(id)sender
{
    return YES;
}

//删
-(BOOL)removeUsersInfo:(NSString *)userName
{
    return YES;
}

//查询
-(NSArray *)fetchAllUsersInfo
{
    return nil;
}

//查询代码，需要重复使用，单独抽出写方法
-(NSArray *)checkObjectExistWithTable:(NSString *)table Codition:(NSString *)condition
{
    return nil;
}

@end
