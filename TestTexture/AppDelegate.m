//
//  AppDelegate.m
//  TestTexture
//
//  Created by junbo.rao on 2022/3/15.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
  
    return YES;
}

//func initDoraemon() {
//    DoraemonManager.shareInstance().addPlugin(withTitle: "内存警告",
//                                              icon: "avatar_decoration_center_lock",
//                                              desc: "模拟内存警告",
//                                              pluginName: "模拟内存警告",
//                                              atModule: "业务工具") {_ in
//        UIApplication.shared.perform(Selector(("_performMemoryWarning")))
//    }
//    // productId为在“平台端操作指南”中申请的产品id
//    DoraemonManager.shareInstance().install(withPid: "88914bd7a6419a09f5393f8516b1bfa2")
//}



#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

@end
