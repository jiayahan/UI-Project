//
//  LifeEngine.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/13.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "LifeEngine.h"

#import "LifeTableViewCellData.h"

@implementation LifeEngine

static LifeEngine * instance = nil;

+(id)shareInstance
{
    if(instance == nil)
    {
        instance = [[LifeEngine alloc] init];
    }
    
    return instance;
}

-(LifeHeaderViewData *)getLifeHeaderViewData
{
    LifeHeaderViewData * lifeHeaderViewData = [[LifeHeaderViewData alloc] init];
    
    lifeHeaderViewData.talkName = @"话题小组";
    
    lifeHeaderViewData.funnyName = @"吃喝玩乐";
    
    return lifeHeaderViewData;
}

-(NSDictionary *)getLifeTableViewData
{
    NSMutableDictionary * dic1 = [[NSMutableDictionary alloc] init];
    
    NSMutableArray * array1 = [[NSMutableArray alloc] init];
    
    LifeTableViewCellData * data1 = [[LifeTableViewCellData alloc] init];
    data1.frontImageName =@"life_talk1.png";
    data1.label1 = @"爱情碎碎念";
    data1.label2 = @"住在我心里最柔软的地方的那个人";
    data1.label3 = @"今日：";
    data1.label4 = @"2498";
    
     NSMutableArray * array2 = [[NSMutableArray alloc] init];
    LifeTableViewCellData * data2 = [[LifeTableViewCellData alloc] init];
    data2.frontImageName =@"life_talk2.png";
    data2.label1 = @"星座与爱情";
    data2.label2 = @"谈谈白羊座的那些事";
    data2.label3 = @"今日：";
    data2.label4 = @"8564";
    
     NSMutableArray * array3 = [[NSMutableArray alloc] init];
    LifeTableViewCellData * data3 = [[LifeTableViewCellData alloc] init];
    data3.frontImageName =@"life_talk3.png";
    data3.label1 = @"恋爱求助小组";
    data3.label2 = @"大声告诉我你们在一起多久了";
    data3.label3 = @"今日：";
    data3.label4 = @"3458";
    
     NSMutableArray * array4 = [[NSMutableArray alloc] init];
    LifeTableViewCellData * data4 = [[LifeTableViewCellData alloc] init];
    data4.frontImageName =@"life_talk4.png";
    data4.label1 = @"异地了又怎样";
    data4.label2 = @"异地，你们各自的生活怎么样？";
    data4.label3 = @"今日：";
    data4.label4 = @"1957";
    
     NSMutableArray * array5 = [[NSMutableArray alloc] init];
    LifeTableViewCellData * data5 = [[LifeTableViewCellData alloc] init];
    data5.frontImageName =@"life_talk5.png";

    data5.label1 = @"我们要结婚了";
    data5.label2 = @"我是个警察他是个军人";
    data5.label3 = @"今日：";
    data5.label4 = @"1178";
    
     NSMutableArray * array6 = [[NSMutableArray alloc] init];
    LifeTableViewCellData * data6 = [[LifeTableViewCellData alloc] init];
    data6.frontImageName =@"life_talk6.png";
    data6.label1 = @"微爱建议反馈版";
    data6.label2 = @"微爱的人物。";
    data6.label3 = @"今日：";
    data6.label4 = @"404";
    
    [array1 addObject:data1];
    [array2 addObject:data2];
    [array3 addObject:data3];
    [array4 addObject:data4];
    [array5 addObject:data5];
    [array6 addObject:data6];
    
    [dic1 setObject:array1 forKey:@"array1"];
    [dic1 setObject:array2 forKey:@"array2"];
    [dic1 setObject:array3 forKey:@"array3"];
    [dic1 setObject:array4 forKey:@"array4"];
    [dic1 setObject:array5 forKey:@"array5"];
    [dic1 setObject:array6 forKey:@"array6"];

    
    return dic1;
}

-(NSDictionary *)getNewLifeTableViewData
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    
    NSMutableArray * array1 = [[NSMutableArray alloc] init];
    
    LifeTableViewCellData * data1 = [[LifeTableViewCellData alloc] init];
    data1.frontImageName =@"Funny_1.png";
    data1.label1 = @"为爱下厨做美食";
    data1.label2 = @"美味中式培根意面";
    data1.label3 = @"今日：";
    data1.label4 = @"981";
    
    NSMutableArray * array2 = [[NSMutableArray alloc] init];
    LifeTableViewCellData * data2 = [[LifeTableViewCellData alloc] init];
    data2.frontImageName =@"Funny_2.png";
    data2.label1 = @"亲手给TA做个礼物";
    data2.label2 = @"可爱萌团子书签";
    data2.label3 = @"今日：";
    data2.label4 = @"248";
    
    NSMutableArray * array3 = [[NSMutableArray alloc] init];
    LifeTableViewCellData * data3 = [[LifeTableViewCellData alloc] init];
    data3.frontImageName =@"Funny_3.png";
    data3.label1 = @"手牵手看世界";
    data3.label2 = @"印度：与茶有关的旅途";
    data3.label3 = @"今日：";
    data3.label4 = @"52";
    
    NSMutableArray * array4 = [[NSMutableArray alloc] init];
    LifeTableViewCellData * data4 = [[LifeTableViewCellData alloc] init];
    data4.frontImageName =@"Funny_4.png";
    data4.label1 = @"情侣电影推荐";
    data4.label2 = @"夏洛特烦恼";
    data4.label3 = @"今日：";
    data4.label4 = @"263";
    
    NSMutableArray * array5 = [[NSMutableArray alloc] init];
    LifeTableViewCellData * data5 = [[LifeTableViewCellData alloc] init];
    data5.frontImageName =@"Funny_5.png";
    data5.label1 = @"我们在阳光下读书";
    data5.label2 = @"《泡芙小姐》的爱情";
    data5.label3 = @"今日：";
    data5.label4 = @"11";
    
    NSMutableArray * array6 = [[NSMutableArray alloc] init];
    LifeTableViewCellData * data6 = [[LifeTableViewCellData alloc] init];
    data6.frontImageName =@"Funny_6.png";
    data6.label1 = @"情侣应该怎么穿";
    data6.label2 = @"更新超越了情侣装的情侣装";
    data6.label3 = @"今日：";
    data6.label4 = @"102";
    
    [array1 addObject:data1];
    [array2 addObject:data2];
    [array3 addObject:data3];
    [array4 addObject:data4];
    [array5 addObject:data5];
    [array6 addObject:data6];
    
    [dic setObject:array1 forKey:@"array1"];
    [dic setObject:array2 forKey:@"array2"];
    [dic setObject:array3 forKey:@"array3"];
    [dic setObject:array4 forKey:@"array4"];
    [dic setObject:array5 forKey:@"array5"];
    [dic setObject:array6 forKey:@"array6"];
    
    
    return dic;

}
@end
