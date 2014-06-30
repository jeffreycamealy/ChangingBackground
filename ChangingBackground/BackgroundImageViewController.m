//
//  BackgroundImageViewController.m
//  ChangingBackground
//
//  Created by Brock Boland on 6/29/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "BackgroundImageViewController.h"

@interface BackgroundImageViewController ()
/// View for the background image
@property (strong, nonatomic) UIImageView *backgroundImageView;

@end

@implementation BackgroundImageViewController

-(id)init {
  self = [super init];
  if (self) {
    // Add the background image view and send it behind other views
    [self.view addSubview:self.backgroundImageView];
    [self.view sendSubviewToBack:self.backgroundImageView];
  }
  return self;
}


// Lazy-init the background view
-(UIImageView *)backgroundImageView {
  if (!_backgroundImageView) {
    _backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
  }
  return _backgroundImageView;
}

// Override the setter for the backgroundImage property, to update the
// background image when the image is changed
-(void)setBackgroundImage:(UIImage *)backgroundImage {
  _backgroundImage = backgroundImage;
  self.backgroundImageView.image = backgroundImage;
}

@end
