//
//  AEMCollectionVC.h
//  ChangingBackground
//
//  Created by Arthur Mayes on 6/20/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AEMCollectionVCDelegate <NSObject>

- (void)didGoToFirst;
- (void)didGoToSecond;

@end

@interface AEMCollectionVC : UICollectionViewController

@property (nonatomic, weak) id<AEMCollectionVCDelegate> delegate;

@end
