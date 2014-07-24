//
//  DetailsDetailsTableViewController.h
//  PerfectBinding
//
//  Created by Hikari Senju on 6/16/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsDetailsTableViewController : UITableViewController
//@property (strong, atomic) NSIndexPath *questionNumber;
@property  (nonatomic, strong) NSNumber *detailNumber;
@property  (nonatomic, strong) NSNumber *questionNumber;
@property  (strong, nonatomic) NSNumber *tabNumber;

-(NSInteger) numberOfRowsInCurrentSection: (int)tab question:(int)question detail:(int)detail;
@end
