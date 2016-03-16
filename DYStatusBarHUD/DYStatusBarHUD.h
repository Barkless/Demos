//
//  DYStatusBarHUD.h
//  DYStatusBarHUD
//
//  Created by 赵德宇 on 16/3/16.
//  Copyright © 2016年 zhaody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DYStatusBarHUD : UIView
/**
 *  显示状态栏提示
 *
 *  @param msg 提示信息
 *  @param img 提示图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)img;
/**
 *  成功状态栏提示
 *
 *  @param msg 提示信息
 */
+ (void)showSuccessWithMessage:(NSString *)msg;
/**
 *  失败状态栏提示
 *
 *  @param msg 提示信息
 */
+ (void)showErrorWithMessage:(NSString *)msg;
/**
 *  加载中状态栏提示
 *
 *  @param msg 提示信息
 */
+ (void)showLoadingWithMessage:(NSString *)msg;
/**
 *  只有文字的状态栏提示
 *
 *  @param msg 提示信息
 */
+ (void)showMessage:(NSString *)msg;
/**
 *  隐藏状态栏提示
 */
+ (void)hide;

@end
