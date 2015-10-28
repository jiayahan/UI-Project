//
//  LifeHeaderView.h
//  UI Project
//
//  Created by 中软mini011 on 15/10/10.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeHeaderViewData.h"

@protocol LifeHeaderViewDelegate <NSObject>

-(void)logoLifeHeaderViewClicked:(id)sender;

@end

@interface LifeHeaderView : UIView

@property(nonatomic,weak)id<LifeHeaderViewDelegate>delegate;

@property(nonatomic,strong)LifeHeaderViewData * Data;

//更新接口
-(void)updateLifeHeaderViewData;

@end
