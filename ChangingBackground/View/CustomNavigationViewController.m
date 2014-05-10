//
//  CustomNavigationViewController.m
//  ChangingBackground
//
//  Created by Ihonahan Buitrago on 9/05/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "CustomNavigationViewController.h"

#import "BackgroundViewController.h"


@interface CustomNavigationViewController ()

@property(strong) UIImage *firstBgImage;
@property(strong) UIImage *secondBgImage;


@end

@implementation CustomNavigationViewController

@synthesize firstBackground;
@synthesize secondBackground;

@synthesize firstBgImage;
@synthesize secondBgImage;


- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        if ([rootViewController isKindOfClass:[BackgroundViewController class]]) {
            BackgroundViewController *bgvc = (BackgroundViewController *)rootViewController;
            self.firstBgImage = bgvc.backgroundImage;
            if (self.firstBackground) {
                self.firstBackground.image = self.firstBgImage;
            }
        }
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (!self.firstBackground) {
        self.firstBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        self.firstBackground.image = self.firstBgImage;
        self.firstBackground.contentMode = UIViewContentModeScaleAspectFill;
        self.firstBackground.alpha = 1;
        self.firstBackground.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:self.firstBackground];
        [self.view sendSubviewToBack:self.firstBackground];
    }
    
    if (!self.secondBackground) {
        self.secondBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        self.secondBackground.image = self.secondBgImage;
        self.secondBackground.contentMode = UIViewContentModeScaleAspectFill;
        self.secondBackground.alpha = 0;
        self.secondBackground.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:self.secondBackground];
        [self.view sendSubviewToBack:self.secondBackground];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *prevVw = self.topViewController;
    [super pushViewController:viewController animated:NO];
    
    if (animated) {
        CGFloat sw = self.view.bounds.size.width;
        CGFloat sh = self.view.bounds.size.height;
        viewController.view.frame = CGRectMake(sw, 0, sw, sh);
        prevVw.view.frame = CGRectMake(0, 0, prevVw.view.frame.size.width, prevVw.view.frame.size.height);
        [self.view addSubview:prevVw.view];
        [UIView animateWithDuration:0.5
                              delay:0
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             prevVw.view.frame = CGRectMake(-prevVw.view.frame.size.width, 0, prevVw.view.frame.size.width, prevVw.view.frame.size.height);
                         }
                         completion:^(BOOL finished) {
                             [prevVw.view removeFromSuperview];
                         }];
        [UIView animateWithDuration:0.5
                              delay:0
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             viewController.view.frame = CGRectMake(0, 0, viewController.view.frame.size.width, viewController.view.frame.size.height);
                         }
                         completion:^(BOOL finished) {
                         }];
        
        // Background animations
        if ([viewController isKindOfClass:[BackgroundViewController class]]) {
            BackgroundViewController *bgvc = (BackgroundViewController *)viewController;
            self.secondBgImage = bgvc.backgroundImage;
            if (!self.secondBackground) {
                self.secondBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.contentMode = UIViewContentModeScaleAspectFill;
                self.secondBackground.alpha = 0;
                self.secondBackground.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            } else {
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.alpha = 0;
            }
        }
        self.firstBackground.alpha = 1;
        self.secondBackground.alpha = 0;
        [self.view sendSubviewToBack:self.secondBackground];
        [UIView animateWithDuration:0.5
                              delay:0.5
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             self.firstBackground.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                         }];
        [UIView animateWithDuration:0.5
                              delay:0.5
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             self.secondBackground.alpha = 1;
                         }
                         completion:^(BOOL finished) {
                             self.firstBgImage = self.secondBgImage;
                             self.firstBackground.image = self.firstBgImage;
                             self.firstBackground.alpha = 1;
                             self.secondBackground.alpha = 0;
                             [self.view sendSubviewToBack:self.secondBackground];
                         }];
    }
}


- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController *vc = [super popViewControllerAnimated:NO];
    
    if (animated) {
        UIViewController *vct = self.topViewController;
        vc.view.frame = CGRectMake(0, 0, vc.view.frame.size.width, vc.view.frame.size.height);
        vct.view.frame = CGRectMake(-vct.view.frame.size.width, 0, vct.view.frame.size.width, vct.view.frame.size.height);
        [self.view addSubview:vc.view];
        [UIView animateWithDuration:0.5
                              delay:0
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             vc.view.frame = CGRectMake(vc.view.frame.size.width, 0, vc.view.frame.size.width, vc.view.frame.size.height);
                         }
                         completion:^(BOOL finished) {
                             [vc.view removeFromSuperview];
                         }];
        [UIView animateWithDuration:0.5
                              delay:0
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             vct.view.frame = CGRectMake(0, 0, vct.view.frame.size.width, vct.view.frame.size.height);
                         }
                         completion:^(BOOL finished) {
                         }];

        // Background animations
        if ([vct isKindOfClass:[BackgroundViewController class]]) {
            BackgroundViewController *bgvc = (BackgroundViewController *)vct;
            self.secondBgImage = bgvc.backgroundImage;
            if (!self.secondBackground) {
                self.secondBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.contentMode = UIViewContentModeScaleAspectFill;
                self.secondBackground.alpha = 0;
                self.secondBackground.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            } else {
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.alpha = 0;
            }
        }
        self.firstBackground.alpha = 1;
        self.secondBackground.alpha = 0;
        [self.view sendSubviewToBack:self.secondBackground];
        [UIView animateWithDuration:0.5
                              delay:0.5
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             self.firstBackground.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                         }];
        [UIView animateWithDuration:0.5
                              delay:0.5
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             self.secondBackground.alpha = 1;
                         }
                         completion:^(BOOL finished) {
                             self.firstBgImage = self.secondBgImage;
                             self.firstBackground.image = self.firstBgImage;
                             self.firstBackground.alpha = 1;
                             self.secondBackground.alpha = 0;
                             [self.view sendSubviewToBack:self.secondBackground];
                         }];
    }
    
    return vc;
}


- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    UIViewController *vc = self.topViewController;
    NSArray *vcArrays = [super popToRootViewControllerAnimated:NO];
    
    if (animated) {
        UIViewController *vct = [vcArrays objectAtIndex:0];
        vc.view.frame = CGRectMake(0, 0, vc.view.frame.size.width, vc.view.frame.size.height);
        vct.view.frame = CGRectMake(-vct.view.frame.size.width, 0, vct.view.frame.size.width, vct.view.frame.size.height);
        [self.view addSubview:vc.view];
        [UIView animateWithDuration:0.5
                              delay:0
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             vc.view.frame = CGRectMake(vc.view.frame.size.width, 0, vc.view.frame.size.width, vc.view.frame.size.height);
                         }
                         completion:^(BOOL finished) {
                             [vc.view removeFromSuperview];
                         }];
        [UIView animateWithDuration:0.5
                              delay:0
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             vct.view.frame = CGRectMake(0, 0, vct.view.frame.size.width, vct.view.frame.size.height);
                         }
                         completion:^(BOOL finished) {
                         }];
        
        // Background animations
        if ([vct isKindOfClass:[BackgroundViewController class]]) {
            BackgroundViewController *bgvc = (BackgroundViewController *)vct;
            self.secondBgImage = bgvc.backgroundImage;
            if (!self.secondBackground) {
                self.secondBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.contentMode = UIViewContentModeScaleAspectFill;
                self.secondBackground.alpha = 0;
                self.secondBackground.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            } else {
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.alpha = 0;
            }
        }
        self.firstBackground.alpha = 1;
        self.secondBackground.alpha = 0;
        [self.view sendSubviewToBack:self.secondBackground];
        [UIView animateWithDuration:0.5
                              delay:0.5
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             self.firstBackground.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                         }];
        [UIView animateWithDuration:0.5
                              delay:0.5
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             self.secondBackground.alpha = 1;
                         }
                         completion:^(BOOL finished) {
                             self.firstBgImage = self.secondBgImage;
                             self.firstBackground.image = self.firstBgImage;
                             self.firstBackground.alpha = 1;
                             self.secondBackground.alpha = 0;
                             [self.view sendSubviewToBack:self.secondBackground];
                         }];
    }
    
    return vcArrays;
}


- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *vc = self.topViewController;
    NSArray *vcArrays = [super popToViewController:viewController animated:NO];
    
    if (animated) {
        UIViewController *vct = viewController;
        vc.view.frame = CGRectMake(0, 0, vc.view.frame.size.width, vc.view.frame.size.height);
        vct.view.frame = CGRectMake(-vct.view.frame.size.width, 0, vct.view.frame.size.width, vct.view.frame.size.height);
        [self.view addSubview:vc.view];
        [UIView animateWithDuration:0.5
                              delay:0
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             vc.view.frame = CGRectMake(vc.view.frame.size.width, 0, vc.view.frame.size.width, vc.view.frame.size.height);
                         }
                         completion:^(BOOL finished) {
                             [vc.view removeFromSuperview];
                         }];
        [UIView animateWithDuration:0.5
                              delay:0
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             vct.view.frame = CGRectMake(0, 0, vct.view.frame.size.width, vct.view.frame.size.height);
                         }
                         completion:^(BOOL finished) {
                         }];
        
        // Background animations
        if ([vct isKindOfClass:[BackgroundViewController class]]) {
            BackgroundViewController *bgvc = (BackgroundViewController *)vct;
            self.secondBgImage = bgvc.backgroundImage;
            if (!self.secondBackground) {
                self.secondBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.contentMode = UIViewContentModeScaleAspectFill;
                self.secondBackground.alpha = 0;
                self.secondBackground.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            } else {
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.alpha = 0;
            }
        }
        self.firstBackground.alpha = 1;
        self.secondBackground.alpha = 0;
        [self.view sendSubviewToBack:self.secondBackground];
        [UIView animateWithDuration:0.5
                              delay:0.5
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             self.firstBackground.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                         }];
        [UIView animateWithDuration:0.5
                              delay:0.5
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             self.secondBackground.alpha = 1;
                         }
                         completion:^(BOOL finished) {
                             self.firstBgImage = self.secondBgImage;
                             self.firstBackground.image = self.firstBgImage;
                             self.firstBackground.alpha = 1;
                             self.secondBackground.alpha = 0;
                             [self.view sendSubviewToBack:self.secondBackground];
                         }];
    }
    
    return vcArrays;
}


@end
