//
//  TimeHeaderView.h
//  UI Project
//
//  Created by 中软mini011 on 15/10/12.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeHeaderViewData.h"

@protocol TimeHeaderViewDelegate <NSObject>

-(void)logoTimeHeaderViewLeftClicked;

-(void)logoTimeHeaderViewRightClicked;

@end

@interface TimeHeaderView : UIView

@property(nonatomic,weak)id<TimeHeaderViewDelegate>delegate;

@property(nonatomic,strong)TimeHeaderViewData * Data;

-(void)updateTimeHeaderViewData;

@end
