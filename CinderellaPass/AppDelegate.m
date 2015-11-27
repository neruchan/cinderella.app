//
//  AppDelegate.m
//  CinderellaPass
//
//  Created by Nelson Widjaya on 10/5/15.
//  Copyright © 2015 Starty International. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
//    {
//        self.window.clipsToBounds = YES;
//        [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleDefault];
//        
//        UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
//        if(orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
//        {
//            self.window.frame =  CGRectMake(20, 0,self.window.frame.size.width-20,self.window.frame.size.height);
//            self.window.bounds = CGRectMake(20, 0, self.window.frame.size.width, self.window.frame.size.height);
//        } else
//        {
//            self.window.frame =  CGRectMake(0,20,self.window.frame.size.width,self.window.frame.size.height-20);
//            self.window.bounds = CGRectMake(0, 20, self.window.frame.size.width, self.window.frame.size.height);
//        }
//    }
//    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];

//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
//    ViewController *temp1 = (ViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    [temp1 setTitle:@"tab1"];
//    
//    ViewController *temp2 = (ViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    [temp2 setTitle:@"tab2"];
//    
//    ViewController *temp3 = (ViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    [temp3 setTitle:@"tab3"];
//    
//    ViewController *temp4 = (ViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    [temp4 setTitle:@"tab4"];
//    
//    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    
//    
//    JPTabViewController *tabViewController = [[JPTabViewController alloc] initWithControllers:@[temp1, temp2, temp3, temp4]];
//    
//    [self.window setRootViewController:tabViewController];
//    
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
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
