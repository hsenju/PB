//
//  QuestionsTableViewCell.m
//  PerfectBinding
//
//  Created by Hikari Senju on 6/8/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)answerQuestion:(id)sender {

}

+ (CGFloat)horizontalTextSpaceForInsetWidth:(CGFloat)insetWidth {
    return ([UIScreen mainScreen].bounds.size.width - (insetWidth * 2.0f)) - 72.0f - 46.0f;
}

@end
