//
//  BackgroundNavigationViewController.h
//  ChangingBackground
//
//  Created by Brock Boland on 6/29/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackgroundNavigationViewController : UINavigationController <UINavigationControllerDelegate>

/// Background image view
@property (strong, nonatomic) UIImageView *backgroundImage;

@end
