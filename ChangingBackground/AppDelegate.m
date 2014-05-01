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

//These UIImageView properties will be added as subviews of window
@property (nonatomic, strong) UIImageView* blueBGImageView;
@property (nonatomic, strong) UIImageView* greenBGImageView;

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    [window makeKeyAndVisible];
    
    //Adding an imageView with the Green image as a subview of window
    self.greenBGImageView = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.greenBGImageView setImage:[UIImage imageNamed:@"green.png"]];
    [window addSubview:self.greenBGImageView];

    //Adding an imageView with the Blue image as a subview of window (on top of greenImageView)
    self.blueBGImageView = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.blueBGImageView setImage:[UIImage imageNamed:@"blue.png"]];
    [window addSubview:self.blueBGImageView];
    
    FirstViewController *firstViewController = FirstViewController.new;
    
    //Making the background color of FirstViewController clearColor so that the imageViews added as subviews of window can be seen.
    [firstViewController.view setBackgroundColor:[UIColor clearColor]];
    
    UINavigationController *navigationController = [UINavigationController.alloc initWithRootViewController:firstViewController];
    [navigationController setNavigationBarHidden:YES];

    window.rootViewController = navigationController;
    
    return YES;
}

// UIView animation changes the alpha of the blueImageView from current value to 0.0 (fully transparent)
// This reveals the greenImageView behind the blueImageView
- (void)fadeFromBlueToGreenImage
{
    [UIView animateWithDuration:2.5
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.blueBGImageView.alpha = 0.0;
                     }
                     completion:nil];
}

// UIView animation changes the alpha of the blueImageView from current value to 1.0 (fully opaque)
// This hides the greenImageView behind the blueImageView
- (void)fadeFromGreenToBlueImage
{
    [UIView animateWithDuration:2.5
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.blueBGImageView.alpha = 1.0;
                     }
                     completion:nil];
}

@end
