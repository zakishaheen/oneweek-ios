//
//  OWSelectMeasurementsViewController.h
//  OneWeek
//
//  Created by Zaki Shaheen on 3/18/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OWSelectMeasurementsViewController : UIViewController< UITableViewDataSource,
UITableViewDelegate>
@property (strong, nonatomic) NSMutableArray *measurements;
@property (weak, nonatomic) IBOutlet UITableView *_tableView;

@end
