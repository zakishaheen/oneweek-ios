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
@property (nonatomic) int currentPage;

@property (nonatomic, strong) NSMutableArray *weeksToShow;


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

- (UIView *)getViewForDate:(NSDate*)date{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *startComponents = [calendar components:NSDayCalendarUnit fromDate:date];
    
    int startDay = startComponents.day;
    
    NSDateComponents *componentsToAdd = [NSDateComponents new];
    componentsToAdd.day = 7;
    NSDate *endDate = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    NSDateComponents *endComponents = [calendar components:NSDayCalendarUnit fromDate:endDate];
    
    int endDay = endComponents.day;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"MMM ''yy"];
    
    NSString *monthString = [[dateFormatter stringFromDate:endDate] uppercaseString];
    
    UIView *result = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    
    
    NSString *weekFontName = @"HelveticaNeue-Light";
    CGFloat weekFontSize = 12.0f;
    UIColor *weekFontColor = [UIColor darkGrayColor];
    NSString *weekText = [NSString stringWithFormat:@"%.2d - %.2d", startDay, endDay];
    
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
    NSString *monthText = monthString;
    
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

- (void) prepareWeeksToShow{
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    
    //get today
    NSDate *today = [NSDate date];
    NSDateComponents *todayComponents = [cal components:NSYearCalendarUnit |
                                         NSMonthCalendarUnit |
                                         NSCalendarUnitWeekOfYear |
                                         NSDayCalendarUnit |
                                         NSWeekdayCalendarUnit
                                               fromDate:today];
    
    today = [cal dateFromComponents:todayComponents];

    //normalise to start of week
    NSDateComponents *subtractiveComponents = [[NSDateComponents alloc] init];
    [subtractiveComponents setDay:-([todayComponents weekday] - [cal firstWeekday])];
    [subtractiveComponents setMonth:0];
    
    NSDate *beginningOfWeek = [cal dateByAddingComponents:subtractiveComponents toDate:today options:0];
    
    
    NSDate *d = [beginningOfWeek copy];
    
    self.weeksToShow = [NSMutableArray new];
    [self.weeksToShow addObject:d];
    int i=0;
    
    do {
        NSDateComponents *subComponents = [[NSDateComponents alloc] init];
        subComponents.weekOfYear = -1;
        d = [cal dateByAddingComponents:subComponents toDate:d options:0];
        
        [self.weeksToShow addObject:d];
        ++i;

    } while (i<11);
    
    [self.weeksToShow sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDate *d1 = (NSDate*)obj1;
        NSDate *d2 = (NSDate*)obj2;
        
        return [d1 compare:d2];
        
    }];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    

    
    [self setBackgroundColor:[UIColor navigationBarGrey]];
    
    self.navScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self.navScrollView setPagingEnabled:YES];
    [self.navScrollView setShowsHorizontalScrollIndicator:NO];
    
    [self prepareWeeksToShow];
    
    int i=0;
    for (NSDate *d in self.weeksToShow) {
        UIView *r = [self getViewForDate:d];
        r.center = CGPointMake(r.center.x + 80*i, r.center.y);
        [self.navScrollView addSubview:r];
        i++;
    }
    
    [self.navScrollView setContentSize:CGSizeMake(80* [self.weeksToShow count], 40)];
    [self.navScrollView setContentOffset:CGPointMake(self.navScrollView.contentSize.width - self.navScrollView.bounds.size.width, 0)];
    
    [self addSubview:self.navScrollView];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
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
