//
//  Manager+Helper.h
//  UI Project
//
//  Created by 中软mini011 on 15/10/8.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "Manager.h"

@interface Manager (Helper)

//增
-(BOOL)addUsersInfo:(id)sender;

//删
-(BOOL)removeUsersInfo:(NSString *)userName;

//查询
-(NSArray *)fetchAllUsersInfo;

@end
