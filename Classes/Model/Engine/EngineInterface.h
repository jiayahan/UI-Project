//
//  EngineInterface.h
//  UI Project
//
//  Created by 中软mini011 on 15/10/8.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EngineInterface : NSObject

//单例
+(id)shareInstance;

//添加
-(BOOL)addObjectToDB:(id)sender;

//查询
-(NSArray *)fetchAllDBInfo;

//删除
-(BOOL)removeDBInfo:(NSString *)userName;

@end
