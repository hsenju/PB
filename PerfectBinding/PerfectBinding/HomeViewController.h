//
//  HomeViewController.h
//  PerfectBinding
//
//  Created by Hikari Senju on 5/24/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *weekly;
@property (strong, nonatomic) IBOutlet UILabel *description;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *location;
@property (strong, nonatomic) IBOutlet UILabel *bottomImage;
@property (strong, nonatomic) IBOutlet UIView *overView;
@property (strong, nonatomic) IBOutlet UILabel *overViewLabel;

@end
