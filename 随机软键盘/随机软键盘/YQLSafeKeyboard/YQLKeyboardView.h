//
//  YQLKeyboardView.h
//  随机软键盘
//
//  Created by qingling_yang on 17/3/16.
//  Copyright © 2017年 qianxx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YQLKeyboardBtnNumTeyp)
{
    YQLKeyboardBtnNumOne = 1,
    YQLKeyboardBtnNumTwo = 2,
    YQLKeyboardBtnNumThree = 3,
    YQLKeyboardBtnNumFour = 4,
    YQLKeyboardBtnNumFive = 5,
    YQLKeyboardBtnNumSix = 6,
    YQLKeyboardBtnNumSeven = 7,
    YQLKeyboardBtnNumEight = 8,
    YQLKeyboardBtnNumNine = 9,
    YQLKeyboardBtnNumHide = 10, // 隐藏按键
    YQLKeyboardBtnNumZero = 11,
    YQLKeyboardBtnNumDelete = 12 // 删除按键
};


@protocol YQLKeyboardViewDelegate <NSObject>

@optional
/**
 *  键盘按钮被点击就告诉代理对象
 *
 *  @param btn 对应的被点击按键(取出tag对应的值)  
 */
- (void)keyboardViewBtnClick:(UIButton *)btn;

@end

@interface YQLKeyboardView : UIView

/**
 *  快速创建对象
 */
+ (instancetype)keyboardView;

@property (nonatomic, weak) id <YQLKeyboardViewDelegate> delegate;

@end
