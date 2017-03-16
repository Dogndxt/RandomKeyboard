//
//  UIButton+YQLExtension.h
//  随机软键盘
//
//  Created by qingling_yang on 17/3/16.
//  Copyright © 2017年 qianxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YQLExtension)

/**
 * 设置普通状态与高亮状态的背景图片
 */
- (void)yql_setNormalBgI:(NSString *)nbg HighlightedBgI:(NSString *)hbg;

/**
 * 设置普通状态与高亮状态的拉伸后背景图片
 */
- (void)yql_setResizeNormalBgI:(NSString *)nbg HighlightedBgI:(NSString *)hbg;

/**
 * 设置普通状态与高亮状态的文字
 */
- (void)yql_setNormalTitleColor:(UIColor *)nColor Higblighted:(UIColor *)hColor;

@end
