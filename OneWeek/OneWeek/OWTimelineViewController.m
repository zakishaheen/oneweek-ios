//
//  OWTimelineViewController.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/18/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "OWTimelineViewController.h"

@interface OWTimelineViewController ()

@end

@implementation OWTimelineViewController

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
- (IBAction)settingsTapped:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"OW-Settings" bundle:nil];
    UIViewController *controller = [storyboard instantiateInitialViewController];
    [self presentViewController:controller animated:YES completion:^{
        
        //
    }];

}

@end
