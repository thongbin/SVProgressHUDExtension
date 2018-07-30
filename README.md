# SVProgressHUDExtension
This is an extension for SVProgressHUD, sometimes you need to  do something after show hud with a message. Such as dismiss a view after you show a error message. SVProgressHUD has not provide method of the hud completion handler, so I made this project.

## Usage
Because built base on SVProgressHUD, before usage you must integrate [SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD)

After that, you just copy the files of `NSObject+KTHUD` into your project and import the `NSObject+KTHUD.h`.

eg:

```objc
[self hud_showSuccessMsg:@"我是展示信息" completion:^{
        [self hud_toastStatus:@"展示完了我才出现"];
    }];
```