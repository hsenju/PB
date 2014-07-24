//
//  DetailsHeaderCell.m
//  PerfectBinding
//
//  Created by Hikari Senju on 6/16/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import "TextAnswerCell.h"

@implementation TextAnswerCell
@synthesize  answerTextField;
@synthesize  delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        // Initialization code
    }
    return self;
}

-(void)layoutSubviews
{
    self.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.textLabel.numberOfLines = 0;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)textfieldEditChanged:(id)sender {
    if (delegate && [delegate respondsToSelector:@selector(cell:textfieldDidChange:)]) {
        [delegate cell:self textfieldDidChange:answerTextField.text];
    }
    //[cellsSelected replaceObjectAtIndex:1 withObject:answerTextField.text];
}

- (id<TextAnswerCellDelegate>)delegate {
    return (id<TextAnswerCellDelegate>)delegate;
}

- (void)setDelegate:(id<TextAnswerCellDelegate>)aDelegate {
    if (delegate != aDelegate) {
        delegate = aDelegate;
    }
}

@end
