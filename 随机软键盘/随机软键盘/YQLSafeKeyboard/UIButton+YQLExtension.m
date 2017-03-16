//
//  UIButton+YQLExtension.m
//  随机软键盘
//
//  Created by qingling_yang on 17/3/16.
//  Copyright © 2017年 qianxx. All rights reserved.
//

#import "UIButton+YQLExtension.h"

@implementation UIButton (YQLExtension)

- (void)yql_setNormalBgI:(NSString *)nbg HighlightedBgI:(NSString *)hbg {
    [self setBackgroundImage:[UIImage imageNamed:nbg] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:hbg] forState:UIControlStateHighlighted];
}

- (void)yql_setResizeNormalBgI:(NSString *)nbg HighlightedBgI:(NSString *)hbg {

    UIImage *normalImage = [UIImage imageNamed:nbg];
    int normalLeftCap = normalImage.size.width * 0.5;
    int normalTopCap = normalImage.size.height * 0.5;
    [self setBackgroundImage:[normalImage stretchableImageWithLeftCapWidth:normalLeftCap topCapHeight:normalTopCap] forState:UIControlStateNormal];
    
    UIImage *highlightedImage = [UIImage imageNamed:hbg];
    int highlightedImageLeftCap = normalImage.size.width * 0.5;
    int highlightedImageTopCap = normalImage.size.height * 0.5;
    [self setBackgroundImage:[highlightedImage stretchableImageWithLeftCapWidth:highlightedImageLeftCap topCapHeight:highlightedImageTopCap] forState:UIControlStateHighlighted];
}

- (void)yql_setNormalTitleColor:(UIColor *)nColor Higblighted:(UIColor *)hColor {

    [self setTitleColor:nColor forState:UIControlStateNormal];
    [self setTitleColor:hColor forState:UIControlStateHighlighted];
}


@end
