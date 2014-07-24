//
//  QuestionsDetailsViewController.h
//  PerfectBinding
//
//  Created by Hikari Senju on 6/9/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextAnswerCell.h"

@interface DetailsViewController : UITableViewController <TextAnswerCellDelegate>
@property (strong, nonatomic) NSNumber *questionNumber;
@property (strong, nonatomic) NSNumber *tabNumber;
@property (strong, nonatomic) IBOutlet UITextField *answerTextField;
@end
