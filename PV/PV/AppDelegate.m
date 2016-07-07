//
//  AppDelegate.m
//  PV
//
//  Created by Sir-Anne-Blair on 16/7/4.
//  Copyright © 2016年 anne-blair. All rights reserved.
//

#import "AppDelegate.h"
#import "YYGTabBarController.h"
#import "OneViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    YYGTabBarController * Bar=[[YYGTabBarController alloc]init];
    Bar.tabBar.tintColor=[UIColor clearColor];
 
    [self.window setRootViewController:Bar];
    [self.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    //本地通知
    if ([[UIDevice currentDevice].systemVersion floatValue]>-8.0)
    {
        UIUserNotificationSettings * settings=[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
     application.applicationIconBadgeNumber=0;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
   
    [self beginBackgroundUpdateTask];
    //执行后台运行代码
    [self endBackgroundUpdateask];
    
}
- (void)beginBackgroundUpdateTask{
    /**
     *  此方法让程序在后台最多运行10分钟，一般用来清除缓存数据和发送统计数据的工作。
     */
    self.backgroundTaskIdentifier = [[UIApplication sharedApplication]beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundUpdateask];
    }];
}
#pragma mark ------------------  结束后台任务 ------------------
- (void)endBackgroundUpdateask
{
    

    UILocalNotification * locaNotification=[[UILocalNotification alloc]init];
    
    locaNotification.alertBody=@"程序已经进入了后台,如果有刷量则也已经暂停！😄😄😄";
    locaNotification.applicationIconBadgeNumber=1;
    locaNotification.fireDate=[NSDate dateWithTimeIntervalSinceNow:10];
    [[UIApplication sharedApplication]scheduleLocalNotification:locaNotification];
    
    
    [[UIApplication sharedApplication]endBackgroundTask:self.backgroundTaskIdentifier];
    self.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
