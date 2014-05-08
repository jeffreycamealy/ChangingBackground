//
//  AppDelegate.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "MyNavigationController.h"

@interface AppDelegate ()<UINavigationControllerDelegate>
{
    UIWindow *window;
    MyNavigationController *navController;
}
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    [window makeKeyAndVisible];
    
    FirstViewController *firstViewController = FirstViewController.new;
    navController = [MyNavigationController.alloc initWithRootViewController:firstViewController];
    [navController setNavigationBarHidden:YES];
    window.rootViewController = navController;
    navController.delegate = self;
    navController.imageView = [UIImageView.alloc initWithFrame:UIScreen.mainScreen.bounds];
    navController.imageView.image = [UIImage imageNamed:@"blue.png"];
    [navController.view insertSubview:navController.imageView atIndex:0];
    
    return YES;
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [navController backgroundCheck];
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush)
    {
        [UIView animateWithDuration:.25 animations:^{
            fromVC.view.frame = CGRectMake(-320, 0, fromVC.view.frame.size.width, fromVC.view.frame.size.height);
        }];
    }
    return nil;
}





@end
