//
//  NavigationControllerDelegate.m
//  ChangingBackground
//
//  Created by Stenio Ferreira on 6/18/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "BackgroundChangeTransition.h"

@implementation NavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    BackgroundChangeTransition *transition = [BackgroundChangeTransition new];
    [transition setNavigationControllerOperation: operation];//push or pop
    return transition;
}

@end
