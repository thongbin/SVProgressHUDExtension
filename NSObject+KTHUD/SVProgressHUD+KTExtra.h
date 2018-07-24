//
//  SVProgressHUD+KTExtra.h
//  HUDDemo
//
//  Created by Kelvin on 2018/7/9.
//  Copyright © 2018年 tanghongbin.me All rights reserved.
//

#import "SVProgressHUD.h"

@interface SVProgressHUD (KTExtra)
+ (NSTimeInterval)minimumDismissTimeInterval;
+ (NSTimeInterval)maximumDismissTimeInterval;

+ (void)yz_showLoadingView;
+ (void)yz_showLoadingViewWithContainerView:(UIView *)containerView;

+ (void)yz_showLoadingViewWithStatus:(NSString *)status;
+ (void)yz_showLoadingViewWithContainerView:(UIView *)containerView status:(NSString *)status;

+ (void)yz_showSuccessMsg:(NSString *)msg;
+ (void)yz_showSuccessMsg:(NSString *)msg completion:(SVProgressHUDShowCompletion)completion;
+ (void)yz_showSuccessMsg:(NSString *)msg withContainerView:(UIView *)cView completion:(SVProgressHUDShowCompletion)completion;

+ (void)yz_showErrorMsg:(NSString *)msg;
+ (void)yz_showErrorMsg:(NSString *)msg completion:(SVProgressHUDShowCompletion)completion;
+ (void)yz_showErrorMsg:(NSString *)msg withContainerView:(UIView *)cView completion:(SVProgressHUDShowCompletion)completion;

+ (void)yz_toastStatus:(NSString *)status;
+ (void)yz_toastStatus:(NSString *)status completion:(SVProgressHUDShowCompletion)completion;
+ (void)yz_toastStatus:(NSString *)status withContainerView:(UIView *)cView completion:(SVProgressHUDShowCompletion)completion;

+ (void)yz_dismiss;
+ (void)yz_dismissDelayOneSecond;
+ (void)yz_dismissDelay:(NSTimeInterval)delay;
+ (void)yz_dismissDelay:(NSTimeInterval)delay completion:(SVProgressHUDDismissCompletion)completion;

@end
