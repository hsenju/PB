//
//  LookingForViewController.h
//  PerfectBinding
//
//  Created by Hikari Senju on 5/24/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTableViewController.h"

@interface TableViewController : UITableViewController<UITableViewDelegate,DTableViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UISegmentedControl *segControl;
@property long actualSegmentedIndex;

- (IBAction)segValChanged:(id)sender;

@end