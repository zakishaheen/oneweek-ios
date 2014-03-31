//
//  OWSelectableView.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/27/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "OWSelectableView.h"

@implementation OWSelectableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setIsSelected:(BOOL)value{
    _isSelected =value;
    [self applyFormatting];
}
- (void)setHasContent:(BOOL)value{
    _hasContent =value;
    [self applyFormatting];
}
- (void)setIsCurrent:(BOOL)value{
    _isCurrent =value;
    [self applyFormatting];
}

- (void)applyFormatting{
    
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
