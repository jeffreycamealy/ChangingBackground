//
//  UIViewController+CBCategory.h
//  ChangingBackground
//
//  Created by Jhaybie on 11/11/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CBCategory)

+ (void)changeBackgroundImageOfViewController:(UIViewController *)viewController FromOldImage:(UIImage *)oldBackgroundImage toNewImage:(UIImage *)newBackgroundImage;

@end
