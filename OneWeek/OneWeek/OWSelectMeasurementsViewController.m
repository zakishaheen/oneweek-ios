//
//  OWSelectMeasurementsViewController.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/18/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "OWSelectMeasurementsViewController.h"

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

@end
