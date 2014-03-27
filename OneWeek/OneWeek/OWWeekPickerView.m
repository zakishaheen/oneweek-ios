//
//  OWWeekPickerView.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/22/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "OWWeekPickerView.h"
#import "UIColor+CustomColors.h"
#import "OWWeekView.h"

@interface OWWeekPickerView ()
@property (nonatomic, strong) UIScrollView *navScrollView;
@property (nonatomic) int currentWeek;
@property (nonatomic) int selectedWeek;
@property (nonatomic) int currentYear;
@property (nonatomic) int selectedYear;
@property (nonatomic) int currentPage;
@property (nonatomic, strong) OWWeekView *previousSelected;

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
    
    OWWeekView *result = [[OWWeekView alloc] initWithDate:date andFrame:CGRectMake(0, 0, 80, 40)];
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

- (void) weekTapped:(UITapGestureRecognizer *)obj{
    OWWeekView *v = (OWWeekView *) [obj view];
    
    [self.previousSelected setIsSelected:NO];
    [v setIsSelected:YES];
    
    self.previousSelected = v;
    
    
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
        r.tag = i;
        
        UITapGestureRecognizer  *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(weekTapped:)];
        recognizer.numberOfTapsRequired = 1;
        recognizer.numberOfTouchesRequired = 1;
        [r addGestureRecognizer:recognizer];
        
        r.center = CGPointMake(r.center.x + 80*i, r.center.y);
        [self.navScrollView addSubview:r];
        i++;
    }
    
    OWWeekView *current = (OWWeekView*)[self.navScrollView viewWithTag:i-1];
    [current setIsCurrent:YES];
    [current setIsSelected:YES];
    [current setHasContent:YES];
    self.previousSelected = current;
    
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
