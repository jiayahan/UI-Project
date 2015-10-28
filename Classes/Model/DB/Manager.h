//
//  Manager.h
//  UI Project
//
//  Created by 中软mini011 on 15/10/8.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Manager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//保存
- (void)saveContext;

//申请文件字典
- (NSURL *)applicationDocumentsDirectory;


//添加单例
+(id)shareInstance;
@end
