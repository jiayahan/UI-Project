//
//  TimeEngine.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/12.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "TimeEngine.h"

@implementation TimeEngine

static TimeEngine * instance = nil;

+(id)shareInstance
{
    if (instance == nil)
    {
        instance = [[TimeEngine alloc] init];
    }
    
    return instance;
}

-(TimeHeaderViewData *)getTimeHeaderViewData
{
    TimeHeaderViewData * TimeHeaderData = [[TimeHeaderViewData alloc] init];
    
    TimeHeaderData.imageName = @"Time_HeaderView_4@2x.png";
    
    TimeHeaderData.btn1 = @"btn2.png";
    
    TimeHeaderData.btn2 = @"btn1.png";
    
    return TimeHeaderData;
}
@end
