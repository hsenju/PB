//
//  QuestionsTableViewCell.h
//  PerfectBinding
//
//  Created by Hikari Senju on 6/8/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *tableCell;

+ (CGFloat)horizontalTextSpaceForInsetWidth:(CGFloat)insetWidth;

@end
