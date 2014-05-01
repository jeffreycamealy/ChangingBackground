//
//  UINavigationController+CustomTransition.h
//  ChangingBackground
//
//  Created by Jomis Kakozhayil on 01/05/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (CustomTransition)

- (void)pushViewControllerWithCustomTansition:(UIViewController *)viewController;
- (void)popViewControllerWithCustomTansition;

@end
