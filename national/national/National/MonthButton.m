//
//  MonthButton.m
//  KinderGarden
//
//  Created by Kaden Jack on 2017/6/23.
//  Copyright © 2017年 Kaden Jack. All rights reserved.
//

#import "MonthButton.h"

#import "UIView+Extension.h"

#define KscreenWidth     [UIScreen mainScreen].bounds.size.width

@implementation MonthButton

- (MonthButton *)buttonWithAboveLabelTitle:(NSString *)string{
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = string;
    titleLabel.font = [UIFont systemFontOfSize:16.0];
    titleLabel.textColor = KFontColorC;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    self.nationalLabel = titleLabel;
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.size = CGSizeMake((KscreenWidth-60)/3, 40);
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 5.0f;
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.nationalLabel.frame = CGRectMake(0, 5, self.width, 30);
}


- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (!enabled) {
        self.nationalLabel.textColor = [UIColor lightGrayColor];
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.cornerRadius = 5.0f;
    }
}

@end
