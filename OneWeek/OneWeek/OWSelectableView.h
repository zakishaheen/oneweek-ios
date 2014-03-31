//
//  OWSelectableView.h
//  OneWeek
//
//  Created by Zaki Shaheen on 3/27/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OWSelectableView : UIView

@property (nonatomic, setter = setIsSelected:) BOOL isSelected;
@property (nonatomic, setter = setHasContent:) BOOL hasContent;
@property (nonatomic, setter = setIsCurrent:) BOOL isCurrent;


- (void) applyFormatting;
@end
