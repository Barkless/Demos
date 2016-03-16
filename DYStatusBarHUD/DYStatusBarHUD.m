//
//  DYStatusBarHUD.m
//  DYStatusBarHUD
//
//  Created by 赵德宇 on 16/3/16.
//  Copyright © 2016年 zhaody. All rights reserved.
//

#import "DYStatusBarHUD.h"

static UIWindow *stWindow_;
static CGFloat  barHeight_ = 20.0;
static NSTimer  *timer_;

#define BarFont [UIFont boldSystemFontOfSize:13]

@implementation DYStatusBarHUD


+ (void)getWindow {
    
    stWindow_.hidden = YES;
    
    stWindow_ = [[UIWindow alloc] init];
    stWindow_.frame = CGRectMake(0, -barHeight_, [UIScreen mainScreen].bounds.size.width, barHeight_);
    stWindow_.backgroundColor = [UIColor blackColor];
    stWindow_.windowLevel = UIWindowLevelAlert;
    stWindow_.hidden = NO;
    
    [UIView animateWithDuration:.2 animations:^{
        CGRect frame = stWindow_.frame;
        frame.origin.y = 0;
        stWindow_.frame = frame;
    }];
    
}

/**
 *  显示状态栏提示
 *
 *  @param msg 提示信息
 *  @param img 提示图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)img {

    [timer_ invalidate];
    
    [self getWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, stWindow_.frame.size.width, barHeight_);
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = BarFont;
    if (img) {
        [button setImage:img forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [stWindow_ addSubview:button];

    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}
/**
 *  成功状态栏提示
 *
 *  @param msg 提示信息
 */
+ (void)showSuccessWithMessage:(NSString *)msg {

    [self showMessage:msg image:[UIImage imageNamed:@"DYStatusBarHUD.bundle/success"]];

}
/**
 *  失败状态栏提示
 *
 *  @param msg 提示信息
 */
+ (void)showErrorWithMessage:(NSString *)msg {

    [self showMessage:msg image:[UIImage imageNamed:@"DYStatusBarHUD.bundle/error"]];

}
/**
 *  加载中状态栏提示
 *
 *  @param msg 提示信息
 */
+ (void)showLoadingWithMessage:(NSString *)msg {

    [timer_ invalidate];
    timer_ = nil;
    
    [self getWindow];
    
    UILabel *label = [[UILabel alloc] initWithFrame:stWindow_.bounds];
    label.text = msg;
    label.font = BarFont;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [stWindow_ addSubview:label];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicator startAnimating];
    [stWindow_ addSubview:indicator];
    
    CGFloat textWidth = [label.text sizeWithAttributes:@{NSFontAttributeName : BarFont}].width;
    indicator.center = CGPointMake((label.frame.size.width - textWidth) / 2.0 - 20, label.center.y);

}
/**
 *  只有文字的状态栏提示
 *
 *  @param msg 提示信息
 */
+ (void)showMessage:(NSString *)msg {

    [self showMessage:msg image:nil];
    
}
/**
 *  隐藏状态栏提示
 */
+ (void)hide {
    
    [UIView animateWithDuration:.2 animations:^{
        CGRect frame = stWindow_.frame;
        frame.origin.y = -barHeight_;
        stWindow_.frame = frame;
    } completion:^(BOOL finished) {
        [timer_ invalidate];
        timer_ = nil;
        stWindow_ = nil;
    }];

}

@end
