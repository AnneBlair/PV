//
//  YYGTabBarController.m
//  PV
//
//  Created by Sir-Anne-Blair on 16/7/4.
//  Copyright © 2016年 anne-blair. All rights reserved.
//

#import "YYGTabBarController.h"
#import "YYGTabBar.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface YYGTabBarController ()

@end


@implementation YYGTabBarController

-(void)viewDidLoad
{
    [super viewDidLoad];
    YYGTabBar *tabBar=[[YYGTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
    
    OneViewController * One=[[OneViewController alloc]init];
    TwoViewController * Two=[[TwoViewController alloc]init];
    ThreeViewController * Three=[[ThreeViewController alloc]init];
    
    UINavigationController * Nav=[[UINavigationController alloc]initWithRootViewController:One];
    UINavigationController * TwoNav=[[UINavigationController alloc]initWithRootViewController:Two];
    UINavigationController * ThreeNav=[[UINavigationController alloc]initWithRootViewController:Three];
    self.viewControllers=@[Nav,TwoNav,ThreeNav];
    
}

@end
