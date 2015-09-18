//
//  ViewController.m
//  tests‘
//
//  Created by 56hui on 15/9/15.
//  Copyright (c) 2015年 56hui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.backgroundColor=[UIColor clearColor];
    
    for (UIView *subView in [self.webView subviews])
    {
        if ([subView isKindOfClass:[UIScrollView class]])
        {
           // ((UIScrollView *)subView).bounces = NO; //去掉UIWebView的底图
                      [(UIScrollView *)subView setShowsVerticalScrollIndicator:NO]; //右侧的滚动条
            
            for (UIView *scrollview in subView.subviews)
            {
                if ([scrollview isKindOfClass:[UIImageView class]])
                {
                    scrollview.hidden = YES;  //上下滚动出边界时的黑色的图片
                }
            }
        }
    }
    NSURLRequest *request  = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.2.188"]];
    [self.webView loadRequest:request
     ];
    
//    NSString *filepath = [[NSBundle mainBundle]pathForResource:@"download" ofType:@"html"];
//    NSURL *url = [NSURL fileURLWithPath:filepath];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
[self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
