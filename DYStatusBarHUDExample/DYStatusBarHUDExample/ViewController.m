//
//  ViewController.m
//  DYStatusBarHUDExample
//
//  Created by 赵德宇 on 16/3/16.
//  Copyright © 2016年 zhaody. All rights reserved.
//

#import "ViewController.h"
#import "DYStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)success:(id)sender {
    [DYStatusBarHUD showSuccessWithMessage:@"下载成功"];
}
- (IBAction)failure:(id)sender {
    [DYStatusBarHUD showErrorWithMessage:@"下载失败"];
}
- (IBAction)loading:(id)sender {
    [DYStatusBarHUD showLoadingWithMessage:@"下载中"];
}
- (IBAction)text:(id)sender {
    [DYStatusBarHUD showMessage:@"DYStatusBarHUD"];
}
- (IBAction)hide:(id)sender {
    [DYStatusBarHUD hide];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
