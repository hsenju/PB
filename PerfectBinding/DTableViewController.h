//
//  QuestionsDetailsViewController.h
//  PerfectBinding
//
//  Created by Hikari Senju on 6/9/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextAnswerCell.h"

@protocol DTableViewControllerDelegate <NSObject>

- (void)dismissController;

@end

@interface DTableViewController : UITableViewController <TextAnswerCellDelegate,UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, assign) id<DTableViewControllerDelegate> delegate;
@property (strong, nonatomic) NSNumber *questionNumber;
@property (strong, nonatomic) NSNumber *tabNumber;
@property (strong, nonatomic) NSArray *heightArrayOne;
@property (strong, nonatomic) NSArray *heightArrayTwo;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
-(NSInteger) numberOfRowsInCurrentSection: (int)tab question:(int)question;
@end
