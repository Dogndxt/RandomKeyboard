//
//  YQLKeyboardView.m
//  随机软键盘
//
//  Created by qingling_yang on 17/3/16.
//  Copyright © 2017年 qianxx. All rights reserved.
//

#import "YQLKeyboardView.h"
#import "UIView+YQLExtension.h"
#import "UIButton+YQLExtension.h"


/*******  键盘按钮个数 *******/
static const NSUInteger KeyboardButtons = 12;
/*******  键盘按钮高度 *******/
static const NSUInteger KeyboardHeight = 216;

/******* 屏幕尺寸 *******/
#define YQLMainScreenWidth  [UIScreen mainScreen].bounds.size.width
#define YQLMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define YQLMainScreenBounds [UIScreen mainScreen].bounds

@interface YQLKeyboardView ()


@end

@implementation YQLKeyboardView

+ (instancetype)keyboardView
{
    YQLKeyboardView *keyboardView = [[self alloc] init];
    return keyboardView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        CGFloat width = self.yql_width;
        CGFloat height = KeyboardHeight; // 一般键盘的高度
        CGFloat x = 0;
        CGFloat y = YQLMainScreenHeight + height;
        
        self.frame = CGRectMake(x, y, width, height);
        
        [self setupSubViews];
    }
    return self;
}


/**
 *  设置子视图
 */
- (void)setupSubViews
{
    NSMutableArray *arrM = [NSMutableArray array];
    [arrM removeAllObjects];
    
    for (int i = 0 ; i < 10; i++)
    {
        int j = arc4random_uniform(10);
        NSNumber *number = [[NSNumber alloc] initWithInt:j];
        
        if ([arrM containsObject:number])
        {
            i--;
            continue;
        }
        [arrM addObject:number];
    }
    
    NSNumber *number = [[NSNumber alloc] init];
    
    for (int i = 0; i < KeyboardButtons; i++)
    {
        if (i < 10)
        {
            number = arrM[i];
        }
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i < 9 || i == 10)
        {
            [btn yql_setResizeNormalBgI:@"Safeframe.bundle/c_chaKeyboardButton" HighlightedBgI:@"Safeframe.bundle/c_chaKeyboardButtonSel"];
            
            btn.tag = number.integerValue + 1; // 对应枚举取值对应的值 (也可定义titel取值不用枚举tag)
            [btn setTitle:[NSString stringWithFormat:@"%ld", (long)btn.tag] forState:UIControlStateNormal];
            
            if (btn.tag == 10)
            {
                btn.tag = YQLKeyboardBtnNumZero;
                [btn setTitle:[NSString stringWithFormat:@"%d", 0] forState:UIControlStateNormal];
            }
        }
        else if (9 == i)
        {
            [btn yql_setResizeNormalBgI:@"Safeframe.bundle/c_chaKeyboardButton" HighlightedBgI:@"Safeframe.bundle/c_chaKeyboardButtonSel"];
            btn.tag = i + 1;
            [btn setTitle:[NSString stringWithFormat:@"隐藏"] forState:UIControlStateNormal];
        }
        else
        {
            [btn yql_setResizeNormalBgI:@"Safeframe.bundle/c_number_keyboardDeleteButton" HighlightedBgI:@"Safeframe.bundle/c_number_keyboardDeleteButtonSel"];
            btn.tag = i + 1;
        }
        [self addSubview:btn];
    }
}

- (void)btnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(keyboardViewBtnClick:)])
    {
        [self.delegate keyboardViewBtnClick:btn];
    }
}

/**
 *  布置子视图frame
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin = 10;
    NSUInteger row = 3;
    NSUInteger column = 4;
    CGFloat btnWidth = (self.yql_width - (row + 1) * margin) / row; // 每个按钮的宽
    CGFloat btnHeight = (KeyboardHeight - (column + 1) * margin) / column; // 每个按钮的高
    
    for (int i = 0; i < self.subviews.count; i++)
    {
        UIButton *btn = self.subviews[i];
        
        NSUInteger x = i % row * (margin + btnWidth) + margin;
        NSUInteger y = i / row * (margin + btnHeight) + margin;
        btn.frame = CGRectMake(x, y, btnWidth, btnHeight);
    }
}


@end
