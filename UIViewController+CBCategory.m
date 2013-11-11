//
//  UIViewController+CBCategory.m
//  ChangingBackground
//
//  Created by Jhaybie on 11/11/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "UIViewController+CBCategory.h"

@implementation UIViewController (CBCategory)


+ (void)changeBackgroundImageOfViewController:(UIViewController *)viewController FromOldImage:(UIImage *)oldBackgroundImage toNewImage:(UIImage *)newBackgroundImage {
    //THIS LOOP ONLY WORKS WITH THE ASSUMPTION THAT THE VIEWCONTROLLER ONLY USES UIIMAGEVIEW TO CONTAIN THE BACKGROUND IMAGES;
    //ALL OTHER UIIMAGEVIEWS IN THE VIEWCONTROLLER WILL BE REMOVED!
    for (UIView *subview in [viewController.view subviews]) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            [subview removeFromSuperview];
        }
    }
    UIImageView *oldImageView = [[UIImageView alloc] initWithImage:oldBackgroundImage];
    UIImageView *newImageView = [[UIImageView alloc] initWithImage:newBackgroundImage];
    [viewController.view insertSubview:oldImageView atIndex:0];
    [UIView animateWithDuration:2.0f animations:^{
        oldImageView.alpha = 0.0;
        newImageView.alpha = 1.0;
        [viewController.view insertSubview:newImageView atIndex:0];
    }];
}


@end
