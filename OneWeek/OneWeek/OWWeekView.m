//
//  OWWeekView.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/24/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "OWWeekView.h"
#import "UIColor+CustomColors.h"

@interface OWWeekView ()
@property (nonatomic, strong) UILabel *weekLabel;
@property (nonatomic, strong) UILabel *monthLabel;

@property (nonatomic) NSString  *weekText;
@property (nonatomic) NSString  *monthText;

@end

@implementation OWWeekView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) initWithDate:(NSDate*)date andFrame:(CGRect)frame{
    date = date;
    
    self = [super initWithFrame:frame];
    if (self) {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        NSDateComponents *startComponents = [calendar components:NSDayCalendarUnit fromDate:date];
        NSInteger startDay = startComponents.day;
        
        NSDateComponents *componentsToAdd = [NSDateComponents new];
        componentsToAdd.day = 7;
        
        NSDate *endDate = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
        NSDateComponents *endComponents = [calendar components:NSDayCalendarUnit fromDate:endDate];
        NSInteger endDay = endComponents.day;
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMM''yy"];
        
        self.weekText = [NSString stringWithFormat:@"%.2d - %.2d", startDay, endDay];
        self.monthText = [[dateFormatter stringFromDate:endDate] uppercaseString];
        
        
        self.weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 9, 80, 12)];
        self.monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 21, 80, 10)];
        
        [self addSubview:self.weekLabel];
        [self addSubview:self.monthLabel];
        
        [self applyFormatting];
    }
    return self;
}

- (void)applyFormatting{
    
    NSString *weekFontName = @"HelveticaNeue-Light";
    NSString *monthFontName = @"HelveticaNeue-Light";
    
    CGFloat weekFontSize = 12.0f;
    CGFloat monthFontSize = 10.0f;
    
    UIColor *weekFontColor = self.isCurrent ? [UIColor rubineRed] : [UIColor darkGrayColor];
    UIColor *monthFontColor = self.isCurrent ? [UIColor rubineRed] : [UIColor darkGrayColor];
    
    //this week
    //selected
    //values
    //thisweek+selected
    //thisweek+values
    //selected+values
    
    UIFont *weekFont = nil;
    
    if (self.isSelected) {
        weekFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:weekFontSize];
        
        if (!self.isCurrent) {
            weekFontColor = [UIColor blackColor];
        }
        
    }else{
        weekFont = [UIFont fontWithName:weekFontName size:weekFontSize];
    }
    
    

    NSDictionary *weekAttributes = @{
                                     NSFontAttributeName:weekFont,
                                     NSForegroundColorAttributeName: weekFontColor,
                                     };
    

    UIFont *monthFont = nil;
    
    if (self.isSelected) {
        monthFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:monthFontSize];
        
        if (!self.isCurrent) {
            monthFontColor = [UIColor blackColor];
        }
    }else{
        monthFont = [UIFont fontWithName:monthFontName size:monthFontSize];
    }
    
    NSDictionary *monthAttributes = @{
                                      NSFontAttributeName:monthFont,
                                      NSForegroundColorAttributeName: monthFontColor,
                                      NSUnderlineStyleAttributeName: [NSNumber numberWithInt: self.hasContent],
                                      
                                      };
    
    [self.weekLabel setAttributedText:[[NSAttributedString alloc]
                                       initWithString:self.weekText
                                       attributes:weekAttributes]];
    
    [self.monthLabel setAttributedText:[[NSAttributedString alloc]
                                        initWithString:self.monthText
                                        attributes:monthAttributes]];
    
    [self.weekLabel setTextAlignment:NSTextAlignmentCenter];
    [self.monthLabel setTextAlignment:NSTextAlignmentCenter];

    
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
