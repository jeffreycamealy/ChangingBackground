//
//  AppDelegate.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "TransitioningDelegate.h"
#import "FirstViewController.h"

@interface AppDelegate () {
}
@property (nonatomic, strong) TransitioningDelegate *transitioningDelegate;

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    [self.window makeKeyAndVisible];
    
    FirstViewController *firstViewController = FirstViewController.new;
    
    self.transitioningDelegate = [TransitioningDelegate new];
    firstViewController.transitioningDelegate = self.transitioningDelegate;
    self.window.rootViewController = firstViewController;
    
    self.blueBackground = [self imageWithImage:[UIImage imageNamed:@"blue"] scaledToSize:CGSizeMake(320, 568)];
    self.greenBackground = [self imageWithImage:[UIImage imageNamed:@"green"] scaledToSize:CGSizeMake(320, 568)];
    
    self.window.backgroundColor = [UIColor colorWithPatternImage:self.blueBackground];
    
    return YES;
}

// the image sizes are too short for 4-inch
- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end

