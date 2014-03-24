//
//  OWInputViewController.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/18/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "OWInputViewController.h"

@interface OWInputViewController ()
@property (weak, nonatomic) IBOutlet UITextField *valueInput;

@end

@implementation OWInputViewController

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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self.valueInput becomeFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int) numberOfItems{
    return 6;
}
- (NSString *) titleForItemAtIndex:(int)index{
    NSArray *temp = @[
                      @{@"name":@"Head"},
                      @{@"name":@"Neck"},
                      @{@"name":@"Breast size"},
                      @{@"name":@"Biceps"},
                      @{@"name":@"Weight"},
                      @{@"name":@"Waist"},
                      
                      ];
    
    return temp[index][@"name"];
}


@end
