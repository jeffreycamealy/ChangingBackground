//
//  AppDelegate.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "NavigationControllerDelegate.h"


@interface AppDelegate () {
    UIWindow *window;
}

@property (strong, nonatomic) NavigationControllerDelegate *navDelegate;

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    [window makeKeyAndVisible];
    
    FirstViewController *firstViewController = FirstViewController.new;
      UINavigationController *navigationController = [UINavigationController.alloc initWithRootViewController:firstViewController];
    
    [navigationController setNavigationBarHidden:YES];
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        _navDelegate = [NavigationControllerDelegate new];
        navigationController.delegate = _navDelegate;
    }
    
    window.rootViewController = navigationController;
    if (IS_IPHONE5) {
       window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue-568h"]];
    } else {
       window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue"]];
    }
    return YES;
}

- (UIWindow *)getWindow
{
    return window;
}

@end
