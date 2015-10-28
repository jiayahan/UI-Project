//
//  NewFuction.h
//  UI Project
//
//  Created by 中软mini011 on 15/10/8.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>

//实现代理
@protocol NewFuctionDelegate <NSObject>

-(void)newFuctionImageViewWithIndex:(NSInteger) tag;

@end

@interface NewFuction : UIView

//代理若引用
@property(nonatomic,assign)id<NewFuctionDelegate>delegate;

+(id)showNewFuction:(HWScrollViewType)type ImageArray:(NSArray *)image;

@end
