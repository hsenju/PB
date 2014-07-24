//
//  QuestionsTabBarViewController.m
//  PerfectBinding
//
//  Created by Hikari Senju on 6/9/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import "QuestionsTabBarViewController.h"
#import "AKTabBarController.h"
#import "LookingForViewController.h"
#import "HomeViewController.h"
#import "questionsViewController.h"
#import "MyProfileViewController.h"

@interface QuestionsTabBarViewController ()

@property (nonatomic, strong) AKTabBarController* tabBarController;

@end

@implementation QuestionsTabBarViewController

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
    
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view.
    // Create and initialize the height of the tab bar to 50px.
    _tabBarController = [[AKTabBarController alloc] initWithTabBarHeight:50];
    
    // Create and initialize with specific height and position atop the view controller
    //_tabBarController = [[AKTabBarController alloc] initWithTabBarHeight:50 position:AKTabBarPositionTop];
    
    // Adding the view controllers to manage.
    [_tabBarController setViewControllers:@[[[LookingForViewController alloc] init], [[questionsViewController alloc] init], [[MyProfileViewController  alloc] init]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
