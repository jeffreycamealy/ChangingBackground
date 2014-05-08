//
//  MyNavigationController.m
//  ChangingBackground
//
//  Created by Calvin Hildreth on 5/7/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

-(void)backgroundCheck
{
    NSString *imageName;
    switch (self.viewControllers.count)
    {
        case 1:
            imageName = @"blue.png";
            [self changeBackgroundWithImageNamed:imageName];
            break;
            
        case 2:
            imageName = @"green.png";
            [self changeBackgroundWithImageNamed:imageName];
            break;
            
        default:
            break;
    }
}

-(void)changeBackgroundWithImageNamed:(NSString *)imageName
{
    [UIView transitionWithView:self.view
                      duration:2
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.imageView.image = [UIImage imageNamed:imageName];
                    }
                    completion:NULL];
}

@end
