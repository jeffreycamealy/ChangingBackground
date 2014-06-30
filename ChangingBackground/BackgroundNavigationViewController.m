//
//  BackgroundNavigationViewController.m
//  ChangingBackground
//
//  Created by Brock Boland on 6/29/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "BackgroundNavigationViewController.h"
#import "BackgroundImageViewController.h"
#import "PushAnimator.h"

@interface BackgroundNavigationViewController ()
/// The view for the background image
@property (strong, nonatomic) UIImageView *mainBackgroundImageView;
/// The view used as a placeholder for the NEW background image.
@property (strong, nonatomic) UIImageView *fadingBackgroundImageView;

@end


@implementation BackgroundNavigationViewController

-(id)initWithRootViewController:(UIViewController *)rootViewController {
  self = [super initWithRootViewController:rootViewController];
  if (self) {
    // I'll handle this myself
    self.delegate = self;

    // Add a background image view
    self.mainBackgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.mainBackgroundImageView];
    [self.view sendSubviewToBack:self.mainBackgroundImageView];

    // Add the other background image view, used for fading
    self.fadingBackgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.fadingBackgroundImageView];
    [self.view sendSubviewToBack:self.fadingBackgroundImageView];
  }
  return self;
}


-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
  // Make sure that the background image will be visible behind the view controller
  viewController.view.backgroundColor = [UIColor clearColor];

  // If the background image is not set already, set it based on the view
  // controller that is about to show. This ensures that the first view controller
  // shown will have a background image.
  if (!self.mainBackgroundImageView.image && [viewController isKindOfClass:[BackgroundImageViewController class]]) {
    BackgroundImageViewController *bgVC = (BackgroundImageViewController*)viewController;
    self.mainBackgroundImageView.image = bgVC.backgroundImage;
  }
}


// When a new view controller is shown, fade to that view controller's background image
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
  if ([viewController isKindOfClass:[BackgroundImageViewController class]]) {
    BackgroundImageViewController *bgVC = (BackgroundImageViewController*)viewController;

    // Move the "fading" background image view in front of the main one, set
    // it's background image, and make it clear for now
    self.fadingBackgroundImageView.image = bgVC.backgroundImage;
    self.fadingBackgroundImageView.alpha = 0.0;
    [self.view sendSubviewToBack:self.mainBackgroundImageView];

    [UIView animateWithDuration:1.0 animations:^{
      // Fade in the new background
      self.fadingBackgroundImageView.alpha = 1.0;
    } completion:^(BOOL finished) {
      // Once the fade is complete, set the "main" background to use the new image
      self.mainBackgroundImageView.image = self.fadingBackgroundImageView.image;
      [self.view sendSubviewToBack:self.fadingBackgroundImageView];
    }];
  }
}


// Animation for the view transition
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                 animationControllerForOperation:(UINavigationControllerOperation)operation
                                              fromViewController:(UIViewController *)fromVC
                                                toViewController:(UIViewController *)toVC {

  PushAnimator *animator = [[PushAnimator alloc] init];

  if (operation == UINavigationControllerOperationPop) {
    // Popping a view off, so reverse the transition
    animator.reverse = YES;
  }
  return animator;
}


@end
