//
//  BackgroundImage.m
//  ChangingBackground
//
//  Created by Siddharth Sukumar on 5/7/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "BackgroundView.h"
#import <QuartzCore/QuartzCore.h>


@interface BackgroundView ()
@property CGFloat foregroundAlpha;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation BackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

     }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    if (self){

        NSArray *subViews = [self subviews];
        NSLog(@"subviews = %@", subViews);
        id firstObject = subViews[0];

        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 520)];

        [self insertSubview:self.imageView belowSubview:firstObject];

         NSLog(@"subviews = %@", subViews);


        self.foregroundAlpha = 0;
    }
    return self;
    
}


- (void) animatingTheForegroundImagewithImage : (UIImage *) image {




    self.imageView.image = image;

    CABasicAnimation *theAnimation;

    //within the animation we will adjust the "opacity"value of the layer

    //theAnimation=[CABasicAnimation animationWithKeyPath:@"foregroundAlpha"];
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration=5.0;

    //changing the opacity (1=fully visible, 0=unvisible)
    
    theAnimation.fromValue=[NSNumber numberWithFloat:0.0];
    theAnimation.toValue=[NSNumber numberWithFloat:1.0];
    [self.imageView.layer addAnimation:theAnimation
                                                 forKey:@"animateOpacity"];


}


- (void) drawRect:(CGRect)rect {

    [super drawRect:rect];
    
    [self.backgroundImage drawInRect:rect];


}


@end
