//
//  UIView+YYGView.h
//  PV
//
//  Created by Sir-Anne-Blair on 16/7/4.
//  Copyright © 2016年 anne-blair. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YYGView)
/**
 *  修改x坐标
 */
@property(nonatomic,assign) CGFloat x;
/**
 *  修改y坐标
 */
@property(nonatomic,assign) CGFloat y;

/**
 *  修改width
 */
@property(nonatomic,assign) CGFloat width;
/**
 *  修改height
 */
@property(nonatomic,assign) CGFloat height;
/**
 *  修改中点x坐标
 */
@property(nonatomic,assign) CGFloat centerX;
@end
