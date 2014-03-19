//
//  OWSelectMeasurementsViewController.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/18/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "OWSelectMeasurementsViewController.h"
#import "OWBasicDataModel.h"
@interface OWSelectMeasurementsViewController ()

@end

@implementation OWSelectMeasurementsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

	// Do any additional setup after loading the view.
    
    self.measurements = [[OWBasicDataModel allMeasurements] mutableCopy];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)letsGoTapped:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"OW-Main" bundle:nil];
    
    UIViewController *controller = [storyboard instantiateInitialViewController];

    [self presentViewController:controller animated:YES completion:^{
        //
    }];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.measurements count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"measurementCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSDictionary *d = [self.measurements objectAtIndex:indexPath.row];

    cell.textLabel.text = NSLocalizedString([d objectForKey:@"name"], nil);
    
    NSString *selected = [d objectForKey:@"selected"];
    
    if (![selected boolValue]) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NSMutableDictionary *d = [[self.measurements objectAtIndex:indexPath.row] mutableCopy];
    
    
    NSString *selected = [d objectForKey:@"selected"];
    
    if (selected==nil || ![selected boolValue]) {
        d[@"selected"] = @"YES";
    }else{

        d[@"selected"] = @"NO";

    }

    [self.measurements replaceObjectAtIndex:indexPath.row withObject:d];
    [self._tableView reloadData];
    
}

@end
