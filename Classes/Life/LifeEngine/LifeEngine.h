//
//  LifeEngine.h
//  UI Project
//
//  Created by 中软mini011 on 15/10/13.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LifeHeaderViewData.h"

@interface LifeEngine : NSObject

+(id)shareInstance;

-(LifeHeaderViewData *)getLifeHeaderViewData;

-(NSDictionary *)getLifeTableViewData;

-(NSDictionary *)getNewLifeTableViewData;

@end
