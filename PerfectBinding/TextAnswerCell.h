//
//  DetailsHeaderCell.h
//  PerfectBinding
//
//  Created by Hikari Senju on 6/16/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextAnswerCellDelegate;

@interface TextAnswerCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField *answerTextField;
@property (nonatomic, strong) id delegate;
@end

@protocol TextAnswerCellDelegate <NSObject>
@optional

- (void)cell:(TextAnswerCell *)cellView textfieldDidChange:(NSString *)text;

@end
