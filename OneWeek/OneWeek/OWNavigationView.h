//
//  OWNavigationView.h
//  OneWeek
//
//  Created by Zaki Shaheen on 3/19/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OWNavigationViewDelegate <NSObject>

- (int) numberOfItems;
- (NSString *) titleForItemAtIndex:(int)index;

@end
@interface OWNavigationView : UIView
@property (nonatomic, assign) IBOutlet  id<OWNavigationViewDelegate> delegate;
@end
