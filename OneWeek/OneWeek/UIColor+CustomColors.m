//
//  UIColor+CustomColors.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/18/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)
+ (UIColor *) rubineRed{
    UIColor *result = [UIColor colorWithRed:198.0/255.0
                                      green:0.0/255.0
                                       blue:61.0/255.0
                                      alpha:1.0];
    return result;
}

+ (UIColor *) navigationBarGrey{
    return [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
}

+ (UIColor *) hairlineColor{
    return [UIColor colorWithRed:211/255.0 green:211/255.0 blue:211/255.0 alpha:1.0];
}
@end
