//
//  UINavigationController+CustomTransition.m
//  ChangingBackground
//
//  Created by Jomis Kakozhayil on 01/05/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "UINavigationController+CustomTransition.h"

@implementation UINavigationController (CustomTransition)

- (void)pushViewControllerWithCustomTansition:(UIViewController *)viewController
{
    CATransition *transition = [CATransition animation];
    
    transition.duration = 0.25;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.view.layer addAnimation:transition forKey:@"customTransitionPush"];
    
    [self pushViewController:viewController animated:NO];
}

- (void)popViewControllerWithCustomTansition
{
    CATransition *transition = [CATransition animation];
    
    transition.duration = 0.25;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.view.layer addAnimation:transition forKey:@"customTransitionPop"];
    
    [self popViewControllerAnimated:NO];
}

@end
