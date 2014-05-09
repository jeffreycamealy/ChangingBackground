//
//  CustomButton.m
//  ChangingBackground
//
//  Created by Siddharth Sukumar on 5/8/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];

    if (highlighted) {
        self.backgroundColor = [UIColor blueColor];
 //       self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.tintColor = [UIColor whiteColor];
    }
    else {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.tintColor = [UIColor blueColor];
    }
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
