//
//  OWWeekPickerView.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/22/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "OWWeekPickerView.h"
#import "UIColor+CustomColors.h"

@interface OWWeekPickerView ()
@property (nonatomic, strong) UIScrollView *navScrollView;
@property (nonatomic) int currentWeek;
@property (nonatomic) int selectedWeek;
@property (nonatomic) int currentYear;
@property (nonatomic) int selectedYear;


@end
@implementation OWWeekPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (UIView *)getView{
    
    UIView *result = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    
    
    NSString *weekFontName = @"HelveticaNeue-Light";
    CGFloat weekFontSize = 12.0f;
    UIColor *weekFontColor = [UIColor darkGrayColor];
    NSString *weekText = @"10 - 17";
    
    NSDictionary *weekAttributes = @{
                                 NSFontAttributeName:[ UIFont fontWithName:weekFontName size:weekFontSize],
                                 NSForegroundColorAttributeName: weekFontColor,
                                 
                                 };
    
    
    UILabel *weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 9, 80, 12)];
    
    [weekLabel setAttributedText:[[NSAttributedString alloc]
                               initWithString:weekText
                               attributes:weekAttributes]];
    [weekLabel setTextAlignment:NSTextAlignmentCenter];
    

    NSString *monthFontName = @"HelveticaNeue-Light";
    CGFloat monthFontSize = 10.0f;
    UIColor *monthFontColor = [UIColor darkGrayColor];
    NSString *monthText = @"MAR'14";
    
    NSDictionary *monthAttributes = @{
                                      NSFontAttributeName:[ UIFont fontWithName:monthFontName size:monthFontSize],
                                      NSForegroundColorAttributeName: monthFontColor,
                                      
                                      };

    UILabel *monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 21, 80, 10)];
    [monthLabel setAttributedText:[[NSAttributedString alloc]
                                  initWithString:monthText
                                  attributes:monthAttributes]];
    [monthLabel setTextAlignment:NSTextAlignmentCenter];
    

    
    [result addSubview:weekLabel];
    [result addSubview:monthLabel];

    
    return result;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self setBackgroundColor:[UIColor navigationBarGrey]];
    
    self.navScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self.navScrollView setPagingEnabled:YES];
    [self.navScrollView setShowsHorizontalScrollIndicator:NO];
    
    for (int i=0; i<8; i++) {
        UIView *r = [self getView];
        r.center = CGPointMake(r.center.x + 80*i, r.center.y);
        [self.navScrollView addSubview:r];
    }
    
    [self.navScrollView setContentSize:CGSizeMake(80*8, 40)];
    
    [self addSubview:self.navScrollView];
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
