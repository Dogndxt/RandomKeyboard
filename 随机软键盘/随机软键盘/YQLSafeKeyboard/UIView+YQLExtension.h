//
//  UIView+YQLExtension.h
//  随机软键盘
//
//  Created by qingling_yang on 17/3/16.
//  Copyright © 2017年 qianxx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YQLAnimationType)
{
    YQLAnimationOpen,// 动画开启
    YQLAnimationClose// 动画关闭
};

@interface UIView (YQLExtension)

#pragma mark - 快速设置控件的frame
@property (nonatomic, assign) CGFloat yql_x;
@property (nonatomic, assign) CGFloat yql_y;
@property (nonatomic, assign) CGFloat yql_centerX;
@property (nonatomic, assign) CGFloat yql_centerY;
@property (nonatomic, assign) CGFloat yql_width;
@property (nonatomic, assign) CGFloat yql_height;
@property (nonatomic, assign) CGPoint yql_origin;
@property (nonatomic, assign) CGSize  yql_size;

/**
 *  在某个点添加动画
 *
 *  @param point 动画开始的点
 */
- (void)yql_addAnimationAtPoint:(CGPoint)point;


@end
