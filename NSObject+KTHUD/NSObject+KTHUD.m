//
//  NSObject+KTHUD.m
//  HUDDemo
//
//  Created by Kelvin on 2018/7/6.
//  Copyright © 2018年 tanghongbin.me All rights reserved.
//

#import "NSObject+KTHUD.h"
#import "SVProgressHUD+KTExtra.h"
#import "UIView+KTExtra.h"

@implementation NSObject (YZHUD)
-(void)hud_showLoadingView
{
    [SVProgressHUD yz_showLoadingView];
}

-(void)hud_showLoadingViewWithStatus:(NSString *)status
{
    [SVProgressHUD yz_showLoadingViewWithStatus:status];
}

-(NSTimeInterval)hud_showSuccessMsg:(NSString *)msg
{
    [self situationToPerform:^{
        [SVProgressHUD yz_showSuccessMsg:msg];
    }];
    
    return [[self class] dismissTimeIntervalFor:msg];
}

-(NSTimeInterval)hud_showSuccessMsg:(NSString *)msg completion:(void (^)(void))completion
{
    [self situationToPerform:^{
        [SVProgressHUD yz_showSuccessMsg:msg completion:completion];
    }];
    
    return [[self class] dismissTimeIntervalFor:msg];
}

-(NSTimeInterval)hud_showErrorMsg:(NSString *)msg
{
    [self situationToPerform:^{
        [SVProgressHUD yz_showErrorMsg:msg];
    }];
    
    return [[self class] dismissTimeIntervalFor:msg];
}

-(NSTimeInterval)hud_showErrorMsg:(NSString *)msg completion:(void (^)(void))completion
{
    [self situationToPerform:^{
        [SVProgressHUD yz_showErrorMsg:msg completion:completion];
    }];
    
    return [[self class] dismissTimeIntervalFor:msg];
}

-(NSTimeInterval)hud_toastStatus:(NSString *)status
{
    [self situationToPerform:^{
        [SVProgressHUD yz_toastStatus:status];
    }];
    
    return [[self class] dismissTimeIntervalFor:status];
}

-(NSTimeInterval)hud_toastStatus:(NSString *)status completion:(void (^)(void))completion
{
    [self situationToPerform:^{
        [SVProgressHUD yz_toastStatus:status completion:completion];
    }];
    
    return [[self class] dismissTimeIntervalFor:status];
}

-(void)hud_dismiss
{
    [SVProgressHUD yz_dismiss];
}

-(void)hud_dismissDelayOneSecond
{
    [SVProgressHUD yz_dismissDelayOneSecond];
}

-(void)hud_dismissDelay:(NSTimeInterval)timeInterval
{
    [SVProgressHUD yz_dismissDelay:timeInterval];
}

-(void)hud_dismissDelay:(NSTimeInterval)timeInterval completion:(void (^)(void))completion
{
    [SVProgressHUD yz_dismissDelay:timeInterval completion:completion];
}

#pragma mark - Private
-(void)situationToPerform:(dispatch_block_t) block
{
    if ([self.class isKindOfClass:UIViewController.class] || [self.class isSubclassOfClass:UIViewController.class]) {
        if ([[(UIViewController *)self view] isDisplayedInScreen]) {
            block();
        }
    }
    else if ([self.class isKindOfClass:UIView.class] || [self.class isSubclassOfClass:UIView.class]) {
        if ([(UIView *)self isDisplayedInScreen]) {
            block();
        }
    }else{
        block();
    }
}

+(NSTimeInterval)dismissTimeIntervalFor:(NSString *)msg
{
    NSTimeInterval time = [SVProgressHUD displayDurationForString:msg];
    if (time < [SVProgressHUD minimumDismissTimeInterval]) {
        return [SVProgressHUD minimumDismissTimeInterval];
    }else if(time > [SVProgressHUD maximumDismissTimeInterval]){
        return [SVProgressHUD maximumDismissTimeInterval];
    }else{
        return time;
    }
}
@end
