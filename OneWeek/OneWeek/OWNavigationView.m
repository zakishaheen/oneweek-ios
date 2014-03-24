//
//  OWNavigationView.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/19/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "OWNavigationView.h"
#import "UIColor+CustomColors.h"

#define NAV_ITEM_MARGIN 18.0f
//#define VISUALDEBUG 1

@interface OWNavigationView ()

@property (nonatomic, strong) UIScrollView *navScrollView;
@property (nonatomic, strong) UIImageView *chevronView;
@property (nonatomic) CGFloat displacement;
@property (nonatomic) NSInteger currentIndex;

@end

@implementation OWNavigationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) addNavScrollView{
    CGRect viewBounds = self.bounds;
    
    CGRect navScrollViewRect = CGRectMake(viewBounds.origin.x,
                                          viewBounds.origin.y,
                                          viewBounds.size.width,
                                          viewBounds.size.height);
    
    self.navScrollView = [[UIScrollView alloc] initWithFrame:navScrollViewRect];
    [self.navScrollView setScrollEnabled:NO];
    [self.navScrollView setShowsHorizontalScrollIndicator:NO];
#ifdef VISUALDEBUG
    [self.navScrollView setBackgroundColor:[UIColor whiteColor]];
#else
    [self.navScrollView setBackgroundColor:[UIColor navigationBarGrey]];
#endif
    
    [self addSubview:self.navScrollView];
}

- (void)addHairline {
    CGRect viewBounds = self.bounds;
    
    CGFloat navScrollViewOrigin = self.navScrollView.frame.origin.y;
    CGFloat navScrollViewHeight = self.navScrollView.frame.size.height;
    
    CGRect hairlineRect = CGRectMake(0,
                                     navScrollViewOrigin+navScrollViewHeight,
                                     viewBounds.size.width,
                                     1.0);
    
    UIView *hairline = [[UIView alloc] initWithFrame:hairlineRect];
    
    [hairline setBackgroundColor:[UIColor hairlineColor]];
    [self addSubview:hairline];
}

- (UILabel *) getLabelWithText:(NSString *)text andFontName:(NSString *)fontName andFontSize:(CGFloat)fontSize andFontColor:(UIColor *)fontColor{
    UILabel *result;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[ UIFont fontWithName:fontName size:fontSize],
                                 NSForegroundColorAttributeName: fontColor,
                                 
                                 };
    
    
    
    CGSize labelSize = [text sizeWithAttributes:attributes];
    
    result = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelSize.width, labelSize.height)];
    
    [result setAttributedText:[[NSAttributedString alloc]
                              initWithString:text
                              attributes:attributes]];
    
    result.textAlignment = NSTextAlignmentCenter;
    
    
    return  result;
}

- (UIView *) getViewAtIndex:(int)index{

    UIView *result = [[UIView alloc] initWithFrame:CGRectZero];
    
#ifdef VISUALDEBUG
    [result setBackgroundColor:[UIColor blueColor]];
#else
    [result setBackgroundColor:[UIColor clearColor]];
#endif
    
    NSString *measurementTitle = @"";
    
    if (self.delegate) {
        measurementTitle = [self.delegate titleForItemAtIndex:index];
    }
    
    UILabel *title = [self getLabelWithText:measurementTitle andFontName:@"HelveticaNeue" andFontSize:16.0 andFontColor:[UIColor blackColor]];
    UILabel *subtitle = [self getLabelWithText:@"hello" andFontName:@"HelveticaNeue-Light" andFontSize:12.0 andFontColor:[UIColor rubineRed]];
    

    [result addSubview:title];
    [result addSubview:subtitle];
    
    CGFloat maxWidth = MAX(title.frame.size.width, subtitle.frame.size.width);
    
    CGRect titleNewFrame = title.frame;
    titleNewFrame.size.width = maxWidth;
    title.frame = titleNewFrame;
    
    CGRect subTitleNewFrame = title.frame;
    subTitleNewFrame.size.width = maxWidth;
    subTitleNewFrame.origin.y = titleNewFrame.size.height;
    subtitle.frame = subTitleNewFrame;
    
    result.frame = CGRectMake(0, 0, maxWidth, titleNewFrame.size.height + subTitleNewFrame.size.height);
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(navItemTapped:)];
    [gesture setNumberOfTapsRequired:1];
    [gesture setNumberOfTouchesRequired:1];
    
    [result addGestureRecognizer:gesture];
    
    result.tag = 100 + index;
    
    return result;

}



- (void)layoutSubviews{
    [super layoutSubviews];
    [self addNavScrollView];
    [self addHairline];
    
    
    CGRect navScrollViewRect = self.navScrollView.frame;
    
    NSUInteger count = self.delegate !=nil ? [self.delegate numberOfItems] : 0;
    
    CGFloat pointer = 0.0;
    
    CGSize navContentSize = navScrollViewRect.size;
    
    for(int i=0; i < count; i++){
        
        pointer += NAV_ITEM_MARGIN;
        
        UIView *navItem = [self getViewAtIndex:i];
        [self.navScrollView addSubview:navItem];
        
        CGFloat itemHeight = navItem.frame.size.height;
        CGFloat yOffset = (navScrollViewRect.size.height - itemHeight) / 2;
        navItem.frame = CGRectMake(pointer, yOffset, navItem.frame.size.width, navItem.frame.size.height);
        
        pointer += navItem.frame.size.width;
        
        navContentSize.width = pointer;
    }
    
    navContentSize.width += NAV_ITEM_MARGIN;
    
    [self.navScrollView setContentSize:navContentSize];
    
    [self calculateInternals];
    
    [self setupChevronView];

}

- (void)setupChevronView
{
    //    = [[UIView alloc] initWithFrame:CGRectZero];
    
    //18x8
    
    self.chevronView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Chevron"]];
    
    UIView *first = [[self.navScrollView subviews] objectAtIndex:self.currentIndex];
    CGFloat xx = first.frame.origin.x + first.frame.size.width/2 - NAV_ITEM_MARGIN/2;
    CGRect chevronRect = CGRectMake(xx, self.navScrollView.frame.origin.y + self.navScrollView.frame.size.height -2 , 23, 12);
    [self.chevronView setFrame:chevronRect];
    
    [self.chevronView setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.chevronView];
    [self bringSubviewToFront:self.navScrollView];
}


- (void)calculateInternals
{
    int count = [self.delegate numberOfItems];
    UIView *lastView = [self.navScrollView viewWithTag:100 + count - 1];
    CGFloat a = lastView.frame.origin.x;
    CGFloat b = a;
    
    if(a + lastView.frame.size.width + (2 * NAV_ITEM_MARGIN) > self.navScrollView.frame.size.width){
        b = self.navScrollView.frame.size.width - (2 * NAV_ITEM_MARGIN) - lastView.frame.size.width;
    }
    
    NSUInteger n = [self.navScrollView.subviews count];
    self.displacement = (a==b) ? 0 : floorf((a-b)/(n - 1));
    self.currentIndex = 0;
}

- (void) navItemTapped:(UITapGestureRecognizer *)gesture{
    
    UIView *item = [gesture view];
    
    CGPoint newContentOffset = CGPointMake(self.displacement * (item.tag - 100), 0);
    
    self.currentIndex = item.tag - 100;
    
    [self.navScrollView setContentOffset:newContentOffset animated:YES];
    

    [self resetChevronCenter];
    
}


- (void)resetChevronCenter{
    CGFloat center = [self getBaselineCenterOfItemInNavViewAtIndex:self.currentIndex];
    
    [UIView animateWithDuration:.25 animations:^{
        CGPoint newCenter = CGPointMake(center-(self.displacement * self.currentIndex), self.chevronView.center.y);
        [self.chevronView setCenter: newCenter];
        
    }];
}

- (CGFloat) getBaselineCenterOfItemInNavViewAtIndex:(NSUInteger) index{
    CGFloat result = 0.0f;
    
    for(UIView *v in [self.navScrollView subviews]){
        if (v.tag == index + 100) {
            
            CGFloat width,origin;
            
            origin = v.frame.origin.x;
            width = v.frame.size.width;
            
            result = v.center.x;//; - self.navScrollView.contentOffset.x;
            
            break;
        }
    }
    
    
    return result;
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
