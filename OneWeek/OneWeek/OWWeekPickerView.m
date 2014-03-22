//
//  OWWeekPickerView.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/22/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "OWWeekPickerView.h"
#import "UIColor+CustomColors.h"
@implementation OWWeekPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self setBackgroundColor:[UIColor navigationBarGrey]];
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
