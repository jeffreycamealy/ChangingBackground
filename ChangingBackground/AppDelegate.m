//
//  AppDelegate.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@interface AppDelegate () {
    UIWindow *window;
}
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    
    UIImage* blueBackgroundImage = [UIImage imageNamed:@"blue.png"];
    UIImageView* blueBackground = [[UIImageView alloc] initWithImage:blueBackgroundImage];
    blueBackground.alpha = 0.8;
    [window addSubview:blueBackground];
    
    UIImage* greenBackgroundImage = [UIImage imageNamed:@"green.png"];
    UIImageView* greenBackground = [[UIImageView alloc] initWithImage:greenBackgroundImage];
    greenBackground.alpha = 0.2;
    [window addSubview:greenBackground];
    
    //UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"blue.png"]];
    //window.backgroundColor = background;
    [window makeKeyAndVisible];
    
    FirstViewController *firstViewController = FirstViewController.new;
    UINavigationController *navigationController = [UINavigationController.alloc initWithRootViewController:firstViewController];
    [navigationController setNavigationBarHidden:YES];

    window.rootViewController = navigationController;
    
    return YES;
}

@end
