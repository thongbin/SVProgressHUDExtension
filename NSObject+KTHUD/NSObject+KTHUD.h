//
//  NSObject+KTHUD.h
//  HUDDemo
//
//  Created by Kelvin on 2018/7/6.
//  Copyright © 2018年 tanghongbin.me All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YZHUD)


/**
 HUD，当前View显示在主屏幕上才会显示相关HUD
 */

- (void)hud_showLoadingView;
- (void)hud_showLoadingViewWithStatus:(NSString *)status;

/**
 成功 提示
 
 @param msg 提示的内容
 @return hud 持续的时间
 */
- (NSTimeInterval)hud_showSuccessMsg:(NSString *)msg;

/**
 成功 提示
 
 @param msg 提示的内容
 @param completion hud 完成后回调的block，注意⚠️如果当前hud 持续时有其他hud 介入，此block将不会回调，会以介入的hud 为准
 @return hud 持续的时间
 */
- (NSTimeInterval)hud_showSuccessMsg:(NSString *)msg completion:(void (^)(void))completion;

/**
 错误 提示
 
 @param msg 提示的内容
 @return hud 持续的时间
 */
- (NSTimeInterval)hud_showErrorMsg:(NSString *)msg;

/**
 错误 提示
 
 @param msg 提示的内容
 @param completion hud 完成后回调的block，注意⚠️如果当前hud 持续时有其他hud 介入，此block将不会回调，会以介入的hud 为准
 @return hud 持续的时间
 */
- (NSTimeInterval)hud_showErrorMsg:(NSString *)msg completion:(void (^)(void))completion;


/**
 toast 提示

 @param status 提示的内容
 @return toast 持续的时间
 */
- (NSTimeInterval)hud_toastStatus:(NSString *)status;

/**
 toast 提示

 @param status 提示的内容
 @param completion toast 完成后回调的block，注意⚠️如果toast 持续时有其他hud 介入，此block将不会回调，会以介入的hud 为准
 @return toast 持续的时间
 */
- (NSTimeInterval)hud_toastStatus:(NSString *)status completion:(void (^)(void))completion;

- (void)hud_dismiss;
- (void)hud_dismissDelayOneSecond;
- (void)hud_dismissDelay:(NSTimeInterval)timeInterval;
@end
