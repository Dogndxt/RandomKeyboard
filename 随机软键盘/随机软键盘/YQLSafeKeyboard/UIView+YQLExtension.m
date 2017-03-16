//
//  UIView+YQLExtension.m
//  随机软键盘
//
//  Created by qingling_yang on 17/3/16.
//  Copyright © 2017年 qianxx. All rights reserved.
//

#import "UIView+YQLExtension.h"

@interface UIView ()

@end

@implementation UIView (YQLExtension)

#pragma mark - 快速设置控件的frame
- (void)setYql_x:(CGFloat)Yql_x
{
    CGRect frame = self.frame;
    frame.origin.x = Yql_x;
    self.frame = frame;
}

- (void)setYql_y:(CGFloat)Yql_y
{
    CGRect frame = self.frame;
    frame.origin.y = Yql_y;
    self.frame = frame;
}

- (CGFloat)yql_x
{
    return self.frame.origin.x;
}

- (CGFloat)yql_y
{
    return self.frame.origin.y;
}

- (void)setYql_centerX:(CGFloat)Yql_centerX
{
    CGPoint center = self.center;
    center.x = Yql_centerX;
    self.center = center;
}

- (CGFloat)yql_centerX
{
    return self.center.x;
}

- (void)setYql_centerY:(CGFloat)Yql_centerY
{
    CGPoint center = self.center;
    center.y = Yql_centerY;
    self.center = center;
}

- (CGFloat)yql_centerY
{
    return self.center.y;
}

- (void)setYql_width:(CGFloat)Yql_width
{
    CGRect frame = self.frame;
    frame.size.width = Yql_width;
    self.frame = frame;
}

- (void)setYql_height:(CGFloat)Yql_height
{
    CGRect frame = self.frame;
    frame.size.height = Yql_height;
    self.frame = frame;
}

- (CGFloat)yql_height
{
    return self.frame.size.height;
}

- (CGFloat)yql_width
{
    return self.frame.size.width;
}

- (void)setYql_size:(CGSize)Yql_size
{
    CGRect frame = self.frame;
    frame.size = Yql_size;
    self.frame = frame;
}

- (CGSize)yql_size
{
    return self.frame.size;
}

- (void)setYql_origin:(CGPoint)Yql_origin
{
    CGRect frame = self.frame;
    frame.origin = Yql_origin;
    self.frame = frame;
}

- (CGPoint)yql_origin
{
    return self.frame.origin;
}

- (void)yql_addAnimationAtPoint:(CGPoint)point {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    CGFloat diameter = [self yql_getShapeDiameterForPoint:point];
    shapeLayer.frame = CGRectMake(floor(point.x - diameter * 0.5), floor(point.y - diameter * 0.5), diameter, diameter);
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0.0, 0.0, diameter, diameter)].CGPath;
    [self.layer addSublayer:shapeLayer];
    shapeLayer.fillColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0].CGColor;
    // animate
    CGFloat scale = 100.0 / shapeLayer.frame.size.width;
    NSString *timingFunctionName = kCAMediaTimingFunctionDefault; //inflating ? kCAMediaTimingFunctionDefault : kCAMediaTimingFunctionDefault;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1.0)];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunctionName];
    animation.removedOnCompletion = YES;
    animation.duration = 3.0;
    shapeLayer.transform = [animation.toValue CATransform3DValue];
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        [shapeLayer removeFromSuperlayer];
    }];
    [shapeLayer addAnimation:animation forKey:@"shapeBackgroundAnimation"];
    [CATransaction commit];
}



// 计算离屏幕的边框最大的距离
- (CGFloat)yql_getShapeDiameterForPoint:(CGPoint)point
{
    CGPoint cornerPoints[] = {
        {0.0, 0.0},
        {0.0, self.bounds.size.height},
        {self.bounds.size.width, self.bounds.size.height},
        {self.bounds.size.width, 0.0}
    };
    
    CGFloat radius = 0.0;
    for (int i = 0; i < 4; i++)
    {
        CGPoint p = cornerPoints[i];
        CGFloat d = sqrt( pow(p.x - point.x, 2.0) + pow(p.y - point.y, 2.0));
        if (d > radius)
        {
            radius = d;
        }
    }
    return radius * 2.0;
}


@end
