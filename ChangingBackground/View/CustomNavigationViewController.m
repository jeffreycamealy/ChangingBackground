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
        self.firstBackground.contentMode = UIViewContentModeScaleAspectFit;
        self.firstBackground.alpha = 1;
        [self.view addSubview:self.firstBackground];
        [self.view sendSubviewToBack:self.firstBackground];
    }
    
    if (!self.secondBackground) {
        self.secondBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        self.secondBackground.image = self.secondBgImage;
        self.secondBackground.contentMode = UIViewContentModeScaleAspectFit;
        self.secondBackground.alpha = 0;
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
    [super pushViewController:viewController animated:animated];
    
    if (animated) {
        if ([viewController isKindOfClass:[BackgroundViewController class]]) {
            BackgroundViewController *bgvc = (BackgroundViewController *)viewController;
            self.secondBgImage = bgvc.backgroundImage;
            if (!self.secondBackground) {
                self.secondBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.contentMode = UIViewContentModeScaleAspectFit;
                self.secondBackground.alpha = 0;
            } else {
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.alpha = 0;
            }
        }
        [UIView animateWithDuration:0.75
                              delay:0.1
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             self.firstBackground.alpha = 0;
                             self.secondBackground.alpha = 1;
                         }
                         completion:^(BOOL finished) {
                             self.firstBgImage = self.secondBgImage;
                             self.firstBackground.image = self.firstBgImage;
                             self.secondBgImage = nil;
                             self.secondBackground.image = nil;
                             self.firstBackground.alpha = 1;
                             self.secondBackground.alpha = 0;
                         }];
    }
}


- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController *vc = [super popViewControllerAnimated:animated];
    
    if (animated) {
        UIViewController *vct = self.topViewController;
        if ([vct isKindOfClass:[BackgroundViewController class]]) {
            BackgroundViewController *bgvc = (BackgroundViewController *)vct;
            self.secondBgImage = bgvc.backgroundImage;
            if (!self.secondBackground) {
                self.secondBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.contentMode = UIViewContentModeScaleAspectFit;
                self.secondBackground.alpha = 0;
            } else {
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.alpha = 0;
            }
        }
        [UIView animateWithDuration:0.75
                              delay:0.1
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             self.firstBackground.alpha = 0;
                             self.secondBackground.alpha = 1;
                         }
                         completion:^(BOOL finished) {
                             self.firstBgImage = self.secondBgImage;
                             self.firstBackground.image = self.firstBgImage;
                             self.secondBgImage = nil;
                             self.secondBackground.image = nil;
                             self.firstBackground.alpha = 1;
                             self.secondBackground.alpha = 0;
                         }];
    }
    
    return vc;
}


- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    NSArray *vcArrays = [super popToRootViewControllerAnimated:animated];
    
    if (animated) {
        UIViewController *vc = [vcArrays objectAtIndex:0];
        if ([vc isKindOfClass:[BackgroundViewController class]]) {
            BackgroundViewController *bgvc = (BackgroundViewController *)vc;
            self.secondBgImage = bgvc.backgroundImage;
            if (!self.secondBackground) {
                self.secondBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.contentMode = UIViewContentModeScaleAspectFit;
                self.secondBackground.alpha = 0;
            } else {
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.alpha = 0;
            }
        }
        [UIView animateWithDuration:0.75
                              delay:0.1
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             self.firstBackground.alpha = 0;
                             self.secondBackground.alpha = 1;
                         }
                         completion:^(BOOL finished) {
                             self.firstBgImage = self.secondBgImage;
                             self.firstBackground.image = self.firstBgImage;
                             self.secondBgImage = nil;
                             self.secondBackground.image = nil;
                             self.firstBackground.alpha = 1;
                             self.secondBackground.alpha = 0;
                         }];
    }
    
    return vcArrays;
}


- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSArray *vcArrays = [super popToViewController:viewController animated:animated];
    
    if (animated) {
        UIViewController *vc = viewController;
        if ([vc isKindOfClass:[BackgroundViewController class]]) {
            BackgroundViewController *bgvc = (BackgroundViewController *)vc;
            self.secondBgImage = bgvc.backgroundImage;
            if (!self.secondBackground) {
                self.secondBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.contentMode = UIViewContentModeScaleAspectFit;
                self.secondBackground.alpha = 0;
            } else {
                self.secondBackground.image = self.secondBgImage;
                self.secondBackground.alpha = 0;
            }
        }
        [UIView animateWithDuration:0.75
                              delay:0.1
                            options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionAllowAnimatedContent)
                         animations:^{
                             self.firstBackground.alpha = 0;
                             self.secondBackground.alpha = 1;
                         }
                         completion:^(BOOL finished) {
                             self.firstBgImage = self.secondBgImage;
                             self.firstBackground.image = self.firstBgImage;
                             self.secondBgImage = nil;
                             self.secondBackground.image = nil;
                             self.firstBackground.alpha = 1;
                             self.secondBackground.alpha = 0;
                         }];
    }
    
    return vcArrays;
}


@end
