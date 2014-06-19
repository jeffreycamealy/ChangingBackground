//
//  UINavigationController+Retro.h
//  ChangingBackground
//
//  Created by Weien Wang on 10/31/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Retro)

//added to get around annoying iOS 7-style navigation animation
//thanks to http://stackoverflow.com/a/18882232/2284713

- (void)pushViewControllerRetro:(UIViewController *)viewController;
- (void)popViewControllerRetro;

@end
