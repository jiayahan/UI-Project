
//  NewFuction.m
//  UI Project
//
//  Created by 中软mini011 on 15/10/8.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "NewFuction.h"

#define Image_Count 5
#define Image_Height 130
#define Enter_Button 1000
#define Register_Button 2000

//类的延展
@interface NewFuction()<UIScrollViewDelegate>
{
    UIScrollView * _scrollView;
    
    CGFloat _imageHeight;
    
    UIImageView * _imageView;
    
    UIPageControl * _pageControl;
    
    NSTimer * _timer;
}

@property(nonatomic,assign)HWScrollViewType type;

@property(nonatomic,strong)NSArray * imageArrays;

@end

@implementation NewFuction

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {

    }
    
    return self;
}

+(id)showNewFuction:(HWScrollViewType)type ImageArray:(NSArray *)image
{
    [UIApplication sharedApplication].statusBarHidden = YES;
    
    NewFuction * new = [[NewFuction alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    
    new.type = type;
    
    new.imageArrays = image;
    
    [new showUI];
    
    return new;
}

-(void)showUI
{
    [self initUI];
    
    [self initScrollViewWithImage];
    
    [self initPageControll];
    
    if (_type == HWScrollViewTypeBanner)
    {
        _timer =[NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        
        self.frame = CGRectMake(0, 64, Screen_Width, Image_Height);
    }
}

-(void)nextPage
{
    if (_pageControl.numberOfPages>1)
    {
        _pageControl.currentPage = (_pageControl.currentPage+1)%_pageControl.numberOfPages;
        
        [_scrollView setContentOffset:CGPointMake(_pageControl.currentPage*_scrollView.bounds.size.width, 0) animated:YES];
    }
}

#pragma mark- initUI
-(void)initUI
{
    //创建UIScrollView，判断UIScrollView是在哪用（方法的抽出）
    
    _scrollView = [[UIScrollView alloc] init];
    
    if (_type == HWScrollViewTypeBanner)
    {
        _imageHeight = Image_Height;
        
        _scrollView.frame = CGRectMake(0, 0, Screen_Width, Image_Height);
    }else
    {
        _imageHeight = Screen_Height;
        
        _scrollView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
    }
    
    //代理
    _scrollView.delegate = self;
    
    //pagingEnabled为yes时会自动滚动到边界
    _scrollView.pagingEnabled = YES;
    
    //bounces默认为yes,滚动超过边界时会反弹回来
    _scrollView.bounces = NO;
    
    //滚动是否显示水平滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    //滚动是否显示垂直滚动条
    _scrollView.showsVerticalScrollIndicator = NO;
    
    //设置起始坐标
    _scrollView.contentOffset = CGPointZero;
    
    [self addSubview:_scrollView];
}

#pragma mark- initScrollViewWithImage
-(void)initScrollViewWithImage
{
    _scrollView.contentSize = CGSizeMake(Screen_Width*[_imageArrays count], _imageHeight);
    
    for (int index = 0; index < [_imageArrays count]; index++)
    {
        NSString * name = [_imageArrays objectAtIndex:index];
        
        UIImage * image = [UIImage imageNamed:name];
        
        _imageView = [[UIImageView alloc] initWithImage:image];
        
        _imageView.frame = CGRectMake(index*Screen_Width, 0, Screen_Width, _imageHeight);
        
        //图片默认不可点击，设置为可点击
        _imageView.userInteractionEnabled = YES;
        
        _imageView.tag = index;
        
        if (_type == HWScrollViewTypeBanner)
        {
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ImageClicked:)];
            
            _imageView.userInteractionEnabled = YES;
            
            
            [_imageView addGestureRecognizer:tap];
        }
        
        
        if (_type != HWScrollViewTypeBanner)
        {
            if (index == [_imageArrays count]-1)
            {
                
                UIButton * enterBtn =  [self addButtonWithName:@"登录" Tag:Enter_Button Rect:CGRectMake(15, Screen_Height-50, 140, 36)];
                
                [_imageView addSubview:enterBtn];
                
                UIButton * registerBtn = [self addButtonWithName:@"注册" Tag:Register_Button Rect:CGRectMake(CGRectGetMaxX(enterBtn.frame)+12, Screen_Height-50, 140, 36)];
                
                [_imageView addSubview:registerBtn];


            }
//
//            UIButton * enterBtn =  [self addButtonWithName:@"注册" Tag:Enter_Button Rect:CGRectMake(15, Screen_Height-50, 140, 36)];
//            
//              [_imageView addSubview:enterBtn];
//            
//            UIButton * registerBtn = [self addButtonWithName:@"登录" Tag:Register_Button Rect:CGRectMake(CGRectGetMaxX(enterBtn.frame)+12, Screen_Height-50, 140, 36)];
//            
//            [_imageView addSubview:registerBtn];
        }
        
        [_scrollView addSubview:_imageView];
    }

}

#pragma mark- UIButton
-(UIButton *)addButtonWithName:(NSString *)name Tag:(NSInteger)tag Rect:(CGRect)rect
{
    UIButton *btn = [[UIButton alloc] initWithFrame:rect];
    
    btn.tag = tag;
    
    [btn setTitle:name forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor whiteColor];
    
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


-(void)ImageClicked:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(newFuctionImageViewWithIndex:)])
    {
        UITapGestureRecognizer * tap = (UITapGestureRecognizer *)sender;
        
        UIImageView * currectImageView = (UIImageView *)tap.view;
        
        [_delegate newFuctionImageViewWithIndex:currectImageView.tag];
    }
}

-(void)BtnClicked:(id)sender
{
    if (sender && [sender isKindOfClass:[UIButton class]])
    {
        UIButton * button = (UIButton *)sender;
        
        switch (button.tag)
        {
            case Enter_Button:
            case Register_Button:
            {
                //两秒之内将图片从透明度100降到0
                [UIView animateWithDuration:2 delay:0 options: UIViewAnimationOptionCurveEaseInOut  animations:^{} completion:^(BOOL finished){
                    [self removeFromSuperview];}];
            }
                break;
                
            default:
                break;
        }
    }
}

#pragma mark- initPageControll
-(void)initPageControll
{
    
    if (_type == HWScrollViewTypeBanner)
    {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(Screen_Width/2-100/2, _imageHeight-30, 100, 44)];
        
        _pageControl.numberOfPages = [_imageArrays count];
        
        _pageControl.currentPage = 0;

        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        
        _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    }else
    {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(Screen_Width/2-100/2, _imageHeight-88, 100, 44)];
        
        _pageControl.numberOfPages = [_imageArrays count];
        
        _pageControl.currentPage = 0;

        //小圆点的底色
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        
        //当前小圆点的颜色
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    
    
    
    [_scrollView addSubview:_pageControl];
}

//scrollView的代理，实现多个页面都显示Pagecontrol(如果不写代理，则只在第一个界面显示）
#pragma mark- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    
    int page = (int)floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1;
    
    if (_type == HWScrollViewTypeBanner)
    {
        _pageControl.frame = CGRectMake(Screen_Width*page+Screen_Width/2-100/2, Image_Height-30, 100, 44);
        
        _pageControl.currentPage = page;
    }else
    {
        _pageControl.frame = CGRectMake(Screen_Width*page+Screen_Width/2-100/2, Screen_Height-88, 100, 44);
        
        _pageControl.currentPage = page;
    }
    
}
@end
