//
//  AEMViewController.m
//  ChangingBackground
//
//  Created by Arthur Mayes on 6/20/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "AEMViewController.h"
#import "AEMCollectionVC.h"

@interface AEMViewController () <AEMCollectionVCDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *protectiveView;
@property (weak, nonatomic) IBOutlet UIImageView *blueImageView;
@property (weak, nonatomic) IBOutlet UIImageView *greenImageView;

@end

@implementation AEMViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.protectiveView setImage:[UIImage imageNamed:@"blue"]];
    [self.blueImageView setImage:[UIImage imageNamed:@"blue"]];
    [self.greenImageView setImage:[UIImage imageNamed:@"green"]];
}

#pragma mark - Background Animations

- (void)didGoToFirst
{
    // Protective view is in case of quick-fire button tapping
    [self.protectiveView setImage:[UIImage imageNamed:@"green"]];
    [self.blueImageView setAlpha:0.0];
    [self.view sendSubviewToBack:self.greenImageView];
    [self.view sendSubviewToBack:self.protectiveView];
    
    // Not using weakSelf here, because this is the rootVC
    [UIView animateWithDuration:0.7 delay:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.blueImageView setAlpha:1.0f];
    } completion:nil];
     
}

- (void)didGoToSecond
{
    // Protective view is in case of quick-fire button tapping
    [self.protectiveView setImage:[UIImage imageNamed:@"blue"]];
    [self.greenImageView setAlpha:0.0];
    [self.view sendSubviewToBack:self.blueImageView];
    [self.view sendSubviewToBack:self.protectiveView];
    
    // Not using weakSelf here, because this is the rootVC
    [UIView animateWithDuration:0.7 delay:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.greenImageView setAlpha:1.0f];
    } completion:nil];
     
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toCollection"]) {
        AEMCollectionVC *collectionVC = (AEMCollectionVC *)[segue destinationViewController];
        collectionVC.delegate = self;
    }
}

@end
