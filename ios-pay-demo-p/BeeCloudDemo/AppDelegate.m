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
    
    [BeeCloud setNetworkTimeout:3];
     [BeeCloud initWithAppID:@"c5d1cba1-5e3f-4ba0-941d-9b0a371fe719" andAppSecret:@"39a7a518-9ac8-4a9e-87bc-7885f33cf18c"];
    //[BeeCloud initWithAppID:@"18aa7652-e8cf-4dfa-96dc-6e9e6a7e3d24" andAppSecret:@"a03b40ab-ba9f-4c6a-8b77-7fe9b5971bf1"];
 //  [BeeCloud initWithAppID:@"f5df67b0-d322-4cc9-b764-3732ae62281a" andAppSecret:@"90168fde-b5af-4f2e-9894-c9fd23044502"];//v3
   // [BeeCloud initWithAppID:@"c45cff08-8b8f-4aa9-acc6-bcf266ae32d1" andAppSecret:@"1a7ded81-96a6-4fa3-9247-3868e246ccfe"];
  // [BeeCloud initWithAppID:@"447f27bf-76ca-4745-85d0-d1847dafc990" andAppSecret:@"95340620-1276-400b-ab3f-9d6467e8e07d"];
    [BeeCloud setWillPrintLog:YES];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if (BCPayUrlWeChat == [BCUtil getUrlType:url]) {
        return [BCWXPay handleOpenUrl:url];
    } else if (BCPayUrlAlipay == [BCUtil getUrlType:url]) {
        return [BCAliPay handleOpenUrl:url];
    } else {
        //other url
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
