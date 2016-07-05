//
//  UIView+YYGView.m
//  PV
//
//  Created by Sir-Anne-Blair on 16/7/4.
//  Copyright © 2016年 anne-blair. All rights reserved.
//

#import "UIView+YYGView.h"

@implementation UIView (YYGView)
-(CGFloat)x
{
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)x
{
    CGRect rect=self.frame;
    rect.origin.x=x;
    self.frame=rect;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)y
{
    CGRect rect=self.frame;
    rect.origin.y=y;
    self.frame=rect;
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(void)setWidth:(CGFloat)width
{
    CGRect rect=self.frame;
    rect.size.width=width;
    self.frame=rect;
}
-(CGFloat)height
{
    return self.frame.size.height;
}
-(void)setHeight:(CGFloat)height
{
    CGRect rect=self.frame;
    rect.size.height=height;
    self.frame=rect;
}
-(CGFloat)centerX
{
    return self.center.x;
}
-(void)setCenterX:(CGFloat)centerX
{
    CGPoint cp=self.center;
    cp.x=centerX;
    self.center=cp;
}
@end
