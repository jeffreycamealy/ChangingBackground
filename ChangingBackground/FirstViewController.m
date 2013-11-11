//
//  FirstViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *homeVCLabel;
@property (weak, nonatomic) IBOutlet UIButton *goForwardButton;

@end

@implementation FirstViewController
@synthesize goForwardButton;
@synthesize homeVCLabel;

CGRect  labelRect;
CGRect  buttonRect;
id      observer;
UIImage *transitionImage;
UIImage *originalImage;


- (void)simulatePush {
    [UIView animateWithDuration:0.2f animations:^{
        goForwardButton.center = CGPointMake(buttonRect.origin.x - 300, buttonRect.origin.y);
        homeVCLabel.center = CGPointMake(labelRect.origin.x - 300, labelRect.origin.y);
    } completion:^(BOOL finished) {
        SecondViewController *secondViewController = SecondViewController.new;
        secondViewController.view.backgroundColor = [UIColor clearColor];
        secondViewController.backgroundImage = originalImage;
        [self.navigationController pushViewController:secondViewController animated:NO];
    }];
}

- (void)preserveUIElementPositions {
    // Additional UIElements would need to be added here
    buttonRect = goForwardButton.frame;
    labelRect = homeVCLabel.frame;
}

- (IBAction)goForwardButtonPressed {
    [self simulatePush];
}

- (void)changeBackground {
    for (UIView *subview in [self.view subviews]) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            [subview removeFromSuperview];
        }
    }
    UIImageView *oldImageView = [[UIImageView alloc] initWithImage:transitionImage];
    UIImageView *newImageView = [[UIImageView alloc] initWithImage:originalImage];
    [self.view insertSubview:oldImageView atIndex:0];
    [UIView animateWithDuration:2.0f animations:^{
        oldImageView.alpha = 0.0;
        newImageView.alpha = 1.0;
        [self.view insertSubview:newImageView atIndex:0];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:0.2f animations:^{
        goForwardButton.frame = CGRectMake(buttonRect.origin.x, buttonRect.origin.y, buttonRect.size.width, buttonRect.size.height);
        homeVCLabel.frame = CGRectMake(labelRect.origin.x, labelRect.origin.y, labelRect.size.width, labelRect.size.height);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    originalImage = [UIImage imageNamed:@"blue@2x.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:originalImage];
    [self.view insertSubview:backgroundImageView atIndex:0];
    [self preserveUIElementPositions];

    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    observer = [nc addObserverForName:@"Go To VC1" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        transitionImage = note.object;
        [self changeBackground];
    }];
}

@end
