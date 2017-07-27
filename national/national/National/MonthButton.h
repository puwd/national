//
//  MonthButton.h
//  KinderGarden
//
//  Created by Kaden Jack on 2017/6/23.
//  Copyright © 2017年 Kaden Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonthButton : UIButton
- (MonthButton *)buttonWithAboveLabelTitle:(NSString *)string;
/** aboveLabel */
@property (nonatomic, weak) UILabel *nationalLabel;

@end
