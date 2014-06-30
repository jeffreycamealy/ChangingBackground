//
//  BackgroundNavigationViewController.m
//  ChangingBackground
//
//  Created by Brock Boland on 6/29/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "BackgroundNavigationViewController.h"
#import "BackgroundImageViewController.h"

@interface BackgroundNavigationViewController ()
/// The view for the background image
@property (strong, nonatomic) UIImageView *backgroundImageView;

@end

@implementation BackgroundNavigationViewController

-(id)initWithRootViewController:(UIViewController *)rootViewController {
  self = [super initWithRootViewController:rootViewController];
  if (self) {
    // I'll handle this myself
    self.delegate = self;

    // Add a background image
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.backgroundImageView];
    [self.view sendSubviewToBack:self.backgroundImageView];
  }
  return self;
}


-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
  // Make sure that the background image will be visible behind the view controller
  viewController.view.backgroundColor = [UIColor clearColor];

  // If the background image is not set already, set it based on the view
  // controller that is about to show. This ensures that the first view controller
  // shown will have a background image.
  if (!self.backgroundImageView.image && [viewController isKindOfClass:[BackgroundImageViewController class]]) {
    BackgroundImageViewController *bgVC = (BackgroundImageViewController*)viewController;
    self.backgroundImageView.image = bgVC.backgroundImage;
  }
}


// When a new view controller is shown, fade to that view controller's background image
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
  if ([viewController isKindOfClass:[BackgroundImageViewController class]]) {
    // TODO fade
    BackgroundImageViewController *bgVC = (BackgroundImageViewController*)viewController;
    self.backgroundImageView.image = bgVC.backgroundImage;
  }
}

@end
