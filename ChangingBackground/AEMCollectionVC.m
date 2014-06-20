//
//  AEMCollectionVC.m
//  ChangingBackground
//
//  Created by Arthur Mayes on 6/20/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "AEMCollectionVC.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface AEMCollectionVC () <FirstViewControllerDelegate, SecondViewControllerDelegate>

@property (nonatomic, weak) FirstViewController *firstViewController;
@property (nonatomic, weak) SecondViewController *secondViewController;

@end

@implementation AEMCollectionVC

#pragma mark - Lazy Instantiation

- (FirstViewController *)firstViewController
{
    if (!_firstViewController) {
        _firstViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"First"];
        _firstViewController.delegate = self;
        [_firstViewController willMoveToParentViewController:self];
        [self addChildViewController:_firstViewController];
    }
    return _firstViewController;
}

- (SecondViewController *)secondViewController
{
    if (!_secondViewController) {
        _secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Second"];
        _secondViewController.delegate = self;
        [_secondViewController willMoveToParentViewController:self];
        [self addChildViewController:_secondViewController];
    }
    return _secondViewController;
}

#pragma mark - Delegate Methods

- (void)segueToFirst
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    if ([self.delegate respondsToSelector:@selector(didGoToFirst)]) {
        [self.delegate didGoToFirst];
    }
}

- (void)segueToSecond
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    if ([self.delegate respondsToSelector:@selector(didGoToSecond)]) {
        [self.delegate didGoToSecond];
    }
}

#pragma mark - UICollectionView Delegate/DataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSArray *array = @[@"firstViewController", @"secondViewController"];
    
    UIViewController *viewController = [self valueForKey:array[indexPath.item]];
    
    [cell.contentView addSubview:viewController.view];
    
    // There would be some additional work to do here if there were more than two VCs
    // But I would have used a navigation controller if there were more than two VCs
    
    return cell;
}

@end
