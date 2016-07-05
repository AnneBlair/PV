//
//  OneViewController.m
//  PV
//
//  Created by Sir-Anne-Blair on 16/7/4.
//  Copyright © 2016年 anne-blair. All rights reserved.
//

#import "OneViewController.h"
#import "AppDelegate.h"
@interface OneViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UITextField * WebTest;  //要刷的网站
@property (nonatomic,strong) UILabel * UrlLable ;    //标题
@property (nonatomic,strong) UIWebView * WebView;     //得到的网页
@property (nonatomic,assign) BOOL  isVC;               //是否暂停
@property (nonatomic,strong) NSURLRequest * request;    //请求
@property (nonatomic,strong) UITextField * NumText;  //要完成的量
@property (nonatomic,assign) NSInteger  OverNum;   //已完成
@property (nonatomic,strong) UIProgressView * progressView; //进度条
@property (nonatomic,strong) UILabel * OverView;        //已完成
@property (nonatomic,strong) NSTimer * YYGTimer;
@property (nonatomic,strong) UIApplication * app;
@end

@implementation OneViewController
@synthesize UrlLable,request;
-(instancetype)init
{
    self=[super init];
    if (self)
    {
        
        self.tabBarItem.image=[[UIImage imageNamed:@"tab_home_dis"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage=[[UIImage imageNamed:@"tab_home"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self WebViewLogin];  //加载网络
    [self UIViewWidge];  //对界面的设定
    
}

-(void)UIViewWidge
{
    self.isVC=YES;
    self.OverNum=0;
    
    
    
    
    self.view.backgroundColor=BackGColor
    self.navigationController.navigationBar.barTintColor=NavColor
    
    
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.height, WIDE*6/32)];
    label.text=@"刷访问量";
    label.font=[UIFont systemFontOfSize:17.5];
    label.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=label;
    
    //
    UrlLable=[[UILabel alloc]initWithFrame:CGRectMake(WIDE/25, 79, WIDE/3, 45)];
    UrlLable.text=@"WebUrl";
    
    UrlLable.font=[UIFont systemFontOfSize:22];
    UrlLable.textColor=[UIColor whiteColor];
    [self.view addSubview:UrlLable];
    
    //  网站
    self.WebTest=[[UITextField alloc]initWithFrame:CGRectMake(WIDE/25, 124, WIDE*23/25, 35)];
    self.WebTest.backgroundColor=[UIColor colorWithRed:0.72 green:0.67 blue:0.74 alpha:1];
    self.WebTest.clearButtonMode=UITextFieldViewModeWhileEditing;
    self.WebTest.autocapitalizationType=UITextAutocapitalizationTypeNone;
    self.WebTest.textAlignment=NSTextAlignmentLeft;
    self.WebTest.layer.cornerRadius=6;
    [self.view addSubview:self.WebTest];
    
    //要刷的数量
    self.NumText=[[UITextField alloc]initWithFrame:CGRectMake(WIDE/25, 165, WIDE/3,35 )];
    self.NumText.backgroundColor=[UIColor colorWithRed:0.72 green:0.67 blue:0.74 alpha:1];
    self.NumText.placeholder=@"要刷的量";
    self.NumText.textAlignment=NSTextAlignmentCenter;
    self.NumText.clearButtonMode=UITextFieldViewModeWhileEditing;
    self.NumText.autocapitalizationType=UITextAutocapitalizationTypeNone;
    self.NumText.layer.cornerRadius=6;
    [self.view addSubview:self.NumText];

    
    //
    
    UIButton * Login=[[UIButton alloc]initWithFrame:CGRectMake(20, HEIGHT*2/3, WIDE/3, (HEIGHT/4-20)/3)];
    Login.tag=520;
   // Login.backgroundColor=[UIColor colorWithRed:0.86 green:0.65 blue:0.34 alpha:1];
    
    UILabel * Loginlabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, Login.frame.size.width, Login.frame.size.height)];
    Loginlabel.text=@"开始";
    Loginlabel.tag=110;
    Loginlabel.textAlignment=NSTextAlignmentCenter;
    Loginlabel.textColor=[UIColor whiteColor];
    [Login addSubview:Loginlabel];
    Loginlabel.font=[UIFont systemFontOfSize:21];
    Login.layer.cornerRadius=6;
    [Login addTarget:self action:@selector(GoHandler:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:Login];
    //重置
    
    UIButton * ReSet=[[UIButton alloc]initWithFrame:CGRectMake(WIDE-20-WIDE/3, HEIGHT*2/3, WIDE/3, (HEIGHT/4-20)/3)];
    // Login.backgroundColor=[UIColor colorWithRed:0.86 green:0.65 blue:0.34 alpha:1];
    
    UILabel * Resetlabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, Login.frame.size.width, Login.frame.size.height)];
    Resetlabel.text=@"重置";
    Resetlabel.textAlignment=NSTextAlignmentCenter;
    Resetlabel.textColor=[UIColor whiteColor];
    [ReSet addSubview:Resetlabel];
    Resetlabel.font=[UIFont systemFontOfSize:21];
    ReSet.layer.cornerRadius=6;
    [ReSet addTarget:self action:@selector(ResetHandler) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:ReSet];
    
    
    //进度条
    self.progressView=[[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.progressView.frame=CGRectMake(WIDE/25, HEIGHT/2, WIDE*23/25, HEIGHT);
    self.progressView.trackTintColor = [UIColor whiteColor];
    self.progressView.progressTintColor = [UIColor blackColor];
    [self.view addSubview:self.progressView];
    self.progressView.hidden=YES;
    //已完成
    self.OverView=[[UILabel alloc]initWithFrame:CGRectMake(WIDE/3, HEIGHT/2+10, WIDE/3,30)];
//    self.OverView.backgroundColor=[UIColor colorWithRed:0.72 green:0.67 blue:0.74 alpha:1];
    self.OverView.textColor=[UIColor whiteColor];
    self.OverView.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.OverView];
    
    

    
    
}
//重置按钮
-(void)ResetHandler
{
    self.NumText.text=@"";
    self.OverNum=0;
    self.isVC=YES;
    self.progressView.progress=0;
    self.OverView.hidden=YES;
    self.OverView.text=@"";
    [self.YYGTimer invalidate];
    self.YYGTimer=nil;
    UILabel * tempLable=[self.view viewWithTag:110];
    tempLable.text=@"开始";
    UIButton * button=[self.view viewWithTag:520];
    button.hidden=NO;
    
}


-(void)GoHandler:(UIButton *)button
{

    for (UILabel * BuLabel in [button subviews])
    {
        if (self.isVC)
        {
            BuLabel.text=@"暂停";
            self.isVC=NO;
            
        }
        else
        {
            BuLabel.text=@"继续";
            self.isVC=YES;
            [self.YYGTimer setFireDate:[NSDate distantFuture]]; //暂停定时器
            self.YYGTimer=nil;
            return;

        }
        
    }
    self.progressView.hidden=NO;
    self.OverView.hidden=NO;
    if (self.UrlLable.text.length==0)
    {
        return;
    }
    self.YYGTimer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.WebTest resignFirstResponder];
    [self.NumText resignFirstResponder];
}
-(void)WebViewLogin
{
    self.WebView=[[UIWebView alloc]initWithFrame:CGRectMake(WIDE, HEIGHT, WIDE, HEIGHT)];
    self.WebView.delegate=self;
    [self.view addSubview:self.WebView];
    
    
}
//开刷

-(void)timer
{
    
    NSURL * Url=[NSURL URLWithString:self.WebTest.text];
    request=[NSURLRequest requestWithURL:Url];
    [self.WebView loadRequest:request];
    
    self.OverNum+=1;
    
    self.OverView.text=[NSString stringWithFormat:@"完成%ld",(long)self.OverNum];
    float Max;
    Max=(float)self.OverNum/(float)[self.NumText.text integerValue];
    self.progressView.progress=Max;
    


    
    if (self.OverNum==(NSInteger)[self.NumText.text integerValue])
    {
        
        [self.YYGTimer setFireDate:[NSDate distantFuture]]; //暂停定时器
        self.YYGTimer=nil;
        UIButton * button=[self.view viewWithTag:520];
        button.hidden=YES;
   
    }
}
#pragma UIWebViewDelegate

//加载完毕
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    NSLog(@"加载完毕%@",[NSThread currentThread]);
    
    
   
}
//加载开始
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"加载开始");
}
//加载失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"加载失败,%@",error);
}

/**拦截请求
 * 每当webView即将发送一个请求之前，都会调用这个方法
 * 返回YES：允许加载这个请求
 * 返回NO：禁止加载这个请求
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
//    if (self.isVC)
//    {
//     return NO;
//    }
    return YES;
}







@end
