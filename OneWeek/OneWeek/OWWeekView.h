//
//  OWWeekView.h
//  OneWeek
//
//  Created by Zaki Shaheen on 3/24/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OWWeekView : UIView{
    NSDate *_date;
}
@property (nonatomic, setter = setIsSelected:) BOOL isSelected;
@property (nonatomic, setter = setHasContent:) BOOL hasContent;
@property (nonatomic, setter = setIsCurrent:) BOOL isCurrent;

- (id) initWithDate:(NSDate*)date andFrame:(CGRect)frame;
@end
