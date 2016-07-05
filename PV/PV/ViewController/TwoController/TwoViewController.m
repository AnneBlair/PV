//
//  TwoViewController.m
//  PV
//
//  Created by Sir-Anne-Blair on 16/7/4.
//  Copyright © 2016年 anne-blair. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController
-(instancetype)init
{
    self=[super init];
    if (self)
    {
        self.tabBarItem.image=[[UIImage imageNamed:@"tab_brand_dis"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage=[[UIImage imageNamed:@"tab_brand"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return  self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=BackGColor
    self.navigationController.navigationBar.barTintColor=NavColor
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
