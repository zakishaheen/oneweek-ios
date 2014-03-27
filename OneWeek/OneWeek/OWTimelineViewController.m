//
//  OWTimelineViewController.m
//  OneWeek
//
//  Created by Zaki Shaheen on 3/18/14.
//  Copyright (c) 2014 Zaki Shaheen. All rights reserved.
//

#import "OWTimelineViewController.h"
#import "OWNavigationView.h"


@interface OWTimelineViewController ()
@property (weak, nonatomic) IBOutlet UITableView *_tableView;
@property (nonatomic, strong) OWNavigationView *navView;
@property (nonatomic) BOOL isInputMode;


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

- (void)viewDidLoad{
    
    self.isInputMode = NO;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navView = [[OWNavigationView alloc] initWithFrame:CGRectZero];
    self.navView.delegate = self;
    
    CGFloat barHeight = self.navigationController.navigationBar.frame.size.height + 20;
    CGFloat screenWidth = self.view.frame.size.width;
    
    [self.navView setFrame:CGRectMake(0, barHeight, screenWidth, 56)];
    [self.view addSubview:self.navView];
    

    self._tableView.contentInset = UIEdgeInsetsMake(self.navView.frame.size.height, 0, 0, 0);
    
    

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)settingsTapped:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"OW-Settings" bundle:nil];
    
    UIViewController *controller = [storyboard instantiateInitialViewController];

    [self presentViewController:controller animated:YES completion:^{}];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"measurementCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
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
