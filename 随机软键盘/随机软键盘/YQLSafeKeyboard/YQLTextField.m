//
//  YQLTextField.m
//  随机软键盘
//
//  Created by qingling_yang on 17/3/16.
//  Copyright © 2017年 qianxx. All rights reserved.
//

#import "YQLTextField.h"
#import "YQLKeyboardView.h"
#import "UIView+YQLExtension.h"

@interface YQLTextField () <YQLKeyboardViewDelegate>

@end

@implementation YQLTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        self.maxNumberInput = 6;
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.backgroundColor = [UIColor clearColor];
        self.maxNumberInput = 6;
        [self setupSubviews];
    }
    return self;
}

+ (instancetype)yqlTextField {
    YQLTextField *drawTextField = [[self alloc] init];
    return drawTextField;
}

- (void)setupSubviews
{
    YQLKeyboardView *keyboardView = [YQLKeyboardView keyboardView];
    
    keyboardView.delegate = self;
    
    self.font = [UIFont systemFontOfSize:0.0];
    self.inputView = keyboardView;
    [self becomeFirstResponder];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return NO;
}

- (CGRect)caretRectForPosition:(UITextPosition *)position
{
    return CGRectZero;
}

static BOOL textFieldState = YES;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = touches.allObjects.lastObject;
    if (NO == textFieldState) {
        [UIView animateWithDuration:0.5 animations:^{
            [self becomeFirstResponder];
            textFieldState = YES;
        }];
    } else {   // 点击到键盘的 view 上不响应事件
        if ([touch.view isKindOfClass:[YQLKeyboardView class]]) {
            
        } else {
            [UIView animateWithDuration:0.5 animations:^{
                [self resignFirstResponder];
                textFieldState = NO;
            }];
        }
    }
}

#pragma mark - YQLKeyboardViewDelegate
/**
 *  键盘按钮被点击就告诉代理对象
 *
 *  @param btn 对应的被点击按键(取出对应的值)
 */
- (void)keyboardViewBtnClick:(UIButton *)btn
{
    if (btn.tag == YQLKeyboardBtnNumHide)
    {
        [self endEditing:YES];
        return;
    }
    
    if (btn.tag == YQLKeyboardBtnNumDelete)
    {
        if (self.text.length > 0)
        {
            [self deleteBackward]; // 从光标后面删除
        }
        
        [self setNeedsDisplay];
    }
    
    if (self.text.length < _maxNumberInput)
    {
        NSString *temp = nil;
        if (btn.tag == YQLKeyboardBtnNumZero)
        {
            temp = [NSString stringWithFormat:@"%d", 0];
            [self insertText:temp]; // 插入到光标后面
        }
        
        if (btn.tag >= YQLKeyboardBtnNumOne && btn.tag <= YQLKeyboardBtnNumNine)
        {
            temp = [NSString stringWithFormat:@"%ld", (long)btn.tag];
            [self insertText:temp];
        }
        
        [self setNeedsDisplay];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.frame = CGRectMake(self.yql_x, self.yql_y, self.yql_width, self.yql_width / _maxNumberInput);
}

#pragma mark - 绘画
/**
 *  绘画
 */
- (void)drawRect:(CGRect)rect
{
    self.backgroundColor = [UIColor clearColor];
    // 画图
//    UIImage *field = [UIImage imageNamed:@"Safeframe.bundle/password_in"];
//    
//    CGFloat fieldX = 0;
//    CGFloat fieldY = 0;
//    CGFloat fieldW = self.yql_width;
//    CGFloat fieldH = self.yql_height;
//    
//    [field drawInRect:CGRectMake(fieldX, fieldY, fieldW, fieldH)];
    
    CGFloat pointH = 20;
    CGFloat pointW = 12;
    CGFloat margin = 1.0;
    CGFloat pointY = margin;
    CGFloat pointX = 0;

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:20.0];

    for (int i = 0; i < self.text.length; i++)
    {
        NSString *str = [NSString stringWithFormat:@"%c", [self.text characterAtIndex:i]];
        pointX = margin + i * (pointW + margin * 0.2);
        
        [str drawInRect:CGRectMake(pointX, pointY, pointW, pointH) withAttributes:dic];
    }
}


@end
