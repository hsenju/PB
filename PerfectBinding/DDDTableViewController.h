//
//  DDDTableViewController.h
//  PerfectBinding
//
//  Created by Hikari Senju on 7/10/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDDTableViewController : UITableViewController
@property  (nonatomic, strong) NSNumber *dddNumber;
@property  (nonatomic, strong) NSNumber *detailNumber;
@property  (nonatomic, strong) NSNumber *questionNumber;
@property  (strong, nonatomic) NSNumber *tabNumber;
-(NSInteger) numberOfRowsInCurrentSection: (int)tab question:(int)question detail:(int)detail ddd:(int)ddd;
@end
