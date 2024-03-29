//
//  BookAppDelegate.m
//  Book
//
//  Created by Thiago Silva on 7/27/12.
//  Copyright (c) 2012 LPJ. All rights reserved.
//

#import "BookAppDelegate.h"
#import "FirstPage.h"
#import "SecondPage.h"
#import "ThirdPage.h"

@implementation BookAppDelegate

@synthesize window;
@synthesize navController;

-(IBAction)loadMenu:(id)sender{
    [self.navController popToViewController:[self.navController.viewControllers objectAtIndex:0] animated:YES];
}

-(IBAction)loadView:(UIButton *)sender{
    if(sender.tag == 1){
        UINavigationController *secondPage = [[SecondPage alloc] initWithNibName:@"SecondPage" bundle: nil];
        [[self navController] pushViewController:secondPage animated:YES];
        //[self.navController popToViewController:[self.navController.viewControllers objectAtIndex:1] animated:YES];
    }else if(sender.tag == 2){
        UINavigationController *thirdPage = [[ThirdPage alloc] initWithNibName:@"ThirdPage" bundle: nil];
        [[self navController] pushViewController:thirdPage animated:YES];
        //[self.navController popToViewController:[self.navController.viewControllers objectAtIndex:1] animated:YES];    
    }
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    UINavigationController *firstPage = [[FirstPage alloc] initWithNibName:@"FirstPage" bundle:nil];
    UINavigationController *secondPage = [[SecondPage alloc] initWithNibName:@"SecondPage" bundle: nil];
    UINavigationController *thirdPage = [[ThirdPage alloc] initWithNibName:@"ThirdPage" bundle: nil];
    
    self.navController = [[UINavigationController alloc] init];
    self.navController.viewControllers = [NSArray arrayWithObjects:firstPage, secondPage, thirdPage, nil];
    self.navController.navigationBarHidden = YES;
    self.window.rootViewController = self.navController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
