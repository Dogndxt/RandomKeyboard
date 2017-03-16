//
//  YQLTextField.h
//  随机软键盘
//
//  Created by qingling_yang on 17/3/16.
//  Copyright © 2017年 qianxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YQLTextField : UITextField

/**
 最多可以输入的字符（数字）
 */
@property(nonatomic, assign) NSUInteger maxNumberInput;

/**
 *  快速创建对象
 */
+ (instancetype)yqlTextField;

@end
