//
//  SVProgressHUD+KTExtra.m
//  HUDDemo
//
//  Created by Kelvin on 2018/7/9.
//  Copyright © 2018年 tanghongbin.me All rights reserved.
//

#import "SVProgressHUD+KTExtra.h"
#import <objc/runtime.h>

#define YZHUD_Delay 1.5F
#define cornerRadius 3.0

static SVProgressHUDShowCompletion _c;
static CGFloat kMinimumDismissTimeInterval = 1.5;
static CGFloat kMaximumDismissTimeInterval = 5.0;

@implementation SVProgressHUD (KTExtra)

+(void)load{
    
    Method originalMethod = class_getInstanceMethod(self, NSSelectorFromString(@"dismiss"));
    Method swizzledMethod = class_getInstanceMethod(self, NSSelectorFromString(@"b_dismiss"));
    if (class_addMethod(self, NSSelectorFromString(@"b_dismiss"), method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(self, NSSelectorFromString(@"dismiss"), method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

#pragma mark - New Methods
+(NSTimeInterval)minimumDismissTimeInterval
{
    return kMinimumDismissTimeInterval;
}

+(NSTimeInterval)maximumDismissTimeInterval
{
    return kMaximumDismissTimeInterval;
}

+(void)hudAppearance
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wnonnull"
    [SVProgressHUD setInfoImage:nil];
    [SVProgressHUD setMinimumSize:CGSizeMake(40, 40)];
    [SVProgressHUD setCornerRadius:cornerRadius];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:14.0]];
    [SVProgressHUD setMinimumDismissTimeInterval:kMinimumDismissTimeInterval];
    [SVProgressHUD setMaximumDismissTimeInterval:kMaximumDismissTimeInterval];
    [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, -20)];
#pragma clang diagnostic pop
}

+(void)yz_showLoadingView
{
    [[self class] yz_showLoadingViewWithContainerView:nil];
}

+(void)yz_showLoadingViewWithContainerView:(UIView *)containerView
{
    [[self class] hudAppearance];
    [SVProgressHUD setContainerView:containerView];
    [SVProgressHUD setRingRadius:10.0];
    [SVProgressHUD setRingNoTextRadius:10.0];
    [SVProgressHUD show];
}

+(void)yz_showLoadingViewWithStatus:(NSString *)status
{
    [[self class] yz_showLoadingViewWithContainerView:nil status:status];
}

+(void)yz_showLoadingViewWithContainerView:(UIView *)containerView status:(NSString *)status
{
    [[self class] hudAppearance];
    [SVProgressHUD setContainerView:containerView];
    [SVProgressHUD setRingRadius:10.0];
    [SVProgressHUD setRingNoTextRadius:10.0];
    [SVProgressHUD showWithStatus:status];
}

+(void)yz_showErrorMsg:(NSString *)msg
{
    [[self class] yz_showErrorMsg:msg withContainerView:nil completion:nil];
}

+(void)yz_showErrorMsg:(NSString *)msg completion:(SVProgressHUDShowCompletion)completion
{
    [[self class] yz_showErrorMsg:msg withContainerView:nil completion:nil];
}

+(void)yz_showErrorMsg:(NSString *)msg withContainerView:(UIView *)cView completion:(SVProgressHUDShowCompletion)completion
{
    if (!msg) {
        return;
    }
    [[self class] hudAppearance];
    [SVProgressHUD setContainerView:cView];
    [SVProgressHUD showErrorWithStatus:msg];
    if (completion) {
        _c = completion;
    }else{
        _c = nil;
    }
}

+(void)yz_showSuccessMsg:(NSString *)msg
{
    [[self class] yz_showSuccessMsg:msg withContainerView:nil completion:nil];
}

+(void)yz_showSuccessMsg:(NSString *)msg completion:(SVProgressHUDShowCompletion)completion
{
    [[self class] yz_showSuccessMsg:msg withContainerView:nil completion:completion];
}

+(void)yz_showSuccessMsg:(NSString *)msg withContainerView:(UIView *)cView completion:(SVProgressHUDShowCompletion)completion
{
    if (!msg) {
        return;
    }
    [[self class] hudAppearance];
    [SVProgressHUD setContainerView:cView];
    [SVProgressHUD showSuccessWithStatus:msg];
    if (completion) {
        _c = completion;
    }else{
        _c = nil;
    }
}

#pragma mark - toast
+(void)yz_toastStatus:(NSString *)status
{
    [[self class] yz_toastStatus:status withContainerView:nil completion:nil];
}

+(void)yz_toastStatus:(NSString *)status completion:(SVProgressHUDShowCompletion)completion
{
    [[self class] yz_toastStatus:status withContainerView:nil completion:completion];
}

+(void)yz_toastStatus:(NSString *)status withContainerView:(UIView *)cView completion:(SVProgressHUDShowCompletion)completion
{
    if (!status) {
        return;
    }
    [[self class] hudAppearance];
    [SVProgressHUD setContainerView:cView];
    [SVProgressHUD showInfoWithStatus:status];
    if (completion) {
        _c = completion;
    }else{
        _c = nil;
    }
}

#pragma mark - dismiss
+ (void)yz_dismiss{
    [[self class] yz_dismissDelay:0];
}

+(void)yz_dismissDelayOneSecond
{
    [[self class] yz_dismissDelay:1.0];
}

+ (void)yz_dismissDelay:(NSTimeInterval)delay
{
    [[self class] yz_dismissDelay:delay completion:nil];
}

+ (void)yz_dismissDelay:(NSTimeInterval)delay completion:(SVProgressHUDDismissCompletion)completion
{
    [SVProgressHUD setContainerView:nil];
    [SVProgressHUD dismissWithDelay:delay completion:completion];
}

#pragma mark - Private Method
- (void)b_dismiss{
    [[self class] dismissWithDelay:0.0 completion:_c];
}
@end
