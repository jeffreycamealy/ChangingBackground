//
//  BackgroundImage.m
//  ChangingBackground
//
//  Created by Siddharth Sukumar on 5/7/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "BackgroundView.h"

@interface BackgroundView ()
@property (nonatomic, strong) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *foregroundImageView;

@end

@implementation BackgroundView
@synthesize backgroundImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

     }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    if (self) {
        self.backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 535)];

        self.foregroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 535)];

        [self addSubview:self.backgroundImageView];
        [self addSubview:self.foregroundImageView];
    }
    return self;




}


- (void)setBackgroundImage:(UIImage *)backgroundImage {

    self.backgroundImageView.image = backgroundImage;

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
