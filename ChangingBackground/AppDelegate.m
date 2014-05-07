//
//  AppDelegate.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
<<<<<<< HEAD
#import "SecondViewController.h"
=======
>>>>>>> 9f533f8176d1813d633bdf824033d972d70ea3d2

@interface AppDelegate () {
    UIWindow *window;
}
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    [window makeKeyAndVisible];
    
    FirstViewController *firstViewController = FirstViewController.new;
<<<<<<< HEAD
    firstViewController.view.backgroundColor = [UIColor clearColor];
    UINavigationController *navigationController = [UINavigationController.alloc initWithRootViewController:firstViewController];
    [navigationController setNavigationBarHidden:YES];

    UIImage* backGroundImage = [UIImage imageNamed:@"blue"];
    UIImageView* backGround = [[UIImageView alloc]initWithImage:backGroundImage];
    [window addSubview:backGround];
    window.rootViewController = navigationController;

=======
    UINavigationController *navigationController = [UINavigationController.alloc initWithRootViewController:firstViewController];
    [navigationController setNavigationBarHidden:YES];

    window.rootViewController = navigationController;
>>>>>>> 9f533f8176d1813d633bdf824033d972d70ea3d2
    
    return YES;
}

<<<<<<< HEAD

=======
>>>>>>> 9f533f8176d1813d633bdf824033d972d70ea3d2
@end
