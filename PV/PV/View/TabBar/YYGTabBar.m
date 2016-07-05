//
//  YYGTabBar.m
//  PV
//
//  Created by Sir-Anne-Blair on 16/7/4.
//  Copyright © 2016年 anne-blair. All rights reserved.
//

#import "YYGTabBar.h"
#import "UIView+YYGView.h"
@implementation YYGTabBar

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int i=1; i<self.subviews.count-1; i++)
    {
        UIView *view=self.subviews[i];
        view.y+=6;
    }
}


@end
