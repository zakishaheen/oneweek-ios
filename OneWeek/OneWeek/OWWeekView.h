//
//  OWWeekView.h
//  OneWeek
//
//  Created by Zaki Shaheen on 3/24/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSelectableView.h"
@interface OWWeekView : OWSelectableView{
    NSDate *_date;
}
- (id) initWithDate:(NSDate*)date andFrame:(CGRect)frame;
@end
