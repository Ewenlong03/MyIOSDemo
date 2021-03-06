//
//  AppDelegate.m
//  BeeCloudDemo
//
//  Created by RInz on 15/2/5.
//  Copyright (c) 2015年 RInz. All rights reserved.
//

#import "AppDelegate.h"
#import <BCAliPay/BCAliPay.h>
#import <BCWXPay/BCWXPay.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
  //  [BeeCloud initWithAppID:@"c5d1cba1-5e3f-4ba0-941d-9b0a371fe719" andAppSecret:@"39a7a518-9ac8-4a9e-87bc-7885f33cf18c"];
  
    [BeeCloud initWithAppID:@"0950c062-5e41-44e3-8f52-f89d8cf2b6eb" andAppSecret:@"a5571c5a-591e-4fb9-bd92-0283782af00d"];
    [BeeCloud setWillPrintLog:YES];
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    if (BCPayUrlWeChat == [BCUtil getUrlType:url]) {
        return [BCWXPay handleOpenUrl:url];
    } else if (BCPayUrlAlipay == [BCUtil getUrlType:url]) {
        return [BCAliPay handleOpenUrl:url];
    } else {
      
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
   
    if (BCPayUrlWeChat == [BCUtil getUrlType:url]) {
        return [BCWXPay handleOpenUrl:url];
    } else if (BCPayUrlAlipay == [BCUtil getUrlType:url]) {
        return [BCAliPay handleOpenUrl:url];
    } else {
        
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
