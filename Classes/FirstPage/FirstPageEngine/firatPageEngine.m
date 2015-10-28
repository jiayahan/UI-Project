//
//  firatPageEngine.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/15.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "firatPageEngine.h"
#import "setUpTableViewData.h"

@implementation firatPageEngine

static firatPageEngine * instance = nil;

+(id)shareInstance
{
    if (instance == nil)
    {
        instance = [[firatPageEngine alloc] init];
    }
    
    return instance;
}

-(NSDictionary *)getSetUpTableViewData
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    
    NSMutableArray * array1 = [[NSMutableArray alloc] init];
    
    setUpTableViewData * data11 = [[setUpTableViewData alloc] init];
    
    data11.imageViewName = @"setting-1@2x.png";
    data11.labelName = @"个人资料";
    
    [array1 addObject:data11];
    
    
    NSMutableArray * array2 = [[NSMutableArray alloc] init];
    
    setUpTableViewData * data21 = [[setUpTableViewData alloc] init];
    data21.imageViewName = @"setting-2@2x.png";
    data21.labelName =@"主题颜色";
    [array2 addObject:data21];
    
    setUpTableViewData * data22 = [[setUpTableViewData alloc] init];
    data22.imageViewName = @"setting-3@2x.png";
    data22.labelName =@"表情商店";
    [array2 addObject:data22];
    
    setUpTableViewData * data23 = [[setUpTableViewData alloc] init];
    data23.imageViewName = @"setting-4@2x.png";
    data23.labelName =@"头像装饰";
    [array2 addObject:data23];
    
    NSMutableArray * array3 = [[NSMutableArray alloc] init];
    setUpTableViewData * data31 = [[setUpTableViewData alloc] init];
    data31.imageViewName = @"setting-5@2x.png";
    data31.labelName = @"使用设置";
    [array3 addObject:data31];
    setUpTableViewData * data32 = [[setUpTableViewData alloc] init];
    data32.imageViewName = @"setting-6@2x.png";
    data32.labelName = @"帮助中心";
    [array3 addObject:data32];


    NSMutableArray * array4 = [[NSMutableArray alloc] init];
    
    setUpTableViewData * data41 = [[setUpTableViewData alloc] init];
    data41.imageViewName = @"setting-7@2x.png";
    data41.labelName =@"如果喜欢，请给微爱好评";
    [array4 addObject:data41];
    
    setUpTableViewData * data42 = [[setUpTableViewData alloc] init];
    data42.imageViewName = @"setting-8@2x.png";
    data42.labelName =@"关于微爱";
    [array4 addObject:data42];
    
    setUpTableViewData * data43 = [[setUpTableViewData alloc] init];
    data43.imageViewName = @"setting-9@2x.png";
    data43.labelName =@"加入微爱";
    [array4 addObject:data43];

    
    NSMutableArray * array5 = [[NSMutableArray alloc] init];
    setUpTableViewData * data51 = [[setUpTableViewData alloc] init];
    data51.imageViewName = @"setting-10@2x.png";
    data51.labelName = @"情侣推荐应用";
    [array5 addObject:data51];
    setUpTableViewData * data52 = [[setUpTableViewData alloc] init];
    data52.imageViewName = @"setting-11@2x.png";
    data52.labelName = @"退出微爱";
    [array5 addObject:data52];
    
    
    [dic setObject:array1 forKey:@"array1"];
    [dic setObject:array2 forKey:@"array2"];
    [dic setObject:array3 forKey:@"array3"];
    [dic setObject:array4 forKey:@"array4"];
    [dic setObject:array5 forKey:@"array5"];
    
    
    
    
    
    return dic;
}

@end
