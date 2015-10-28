//
//  TimeEngine.h
//  UI Project
//
//  Created by 中软mini011 on 15/10/12.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimeHeaderViewData.h"

@interface TimeEngine : NSObject

+(id)shareInstance;

-(TimeHeaderViewData *)getTimeHeaderViewData;

@end
