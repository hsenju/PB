//
//  QuestionsDetailsViewController.m
//  PerfectBinding
//
//  Created by Hikari Senju on 6/9/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import "DetailsViewController.h"
#import "QuestionDetailsTableViewCell.h"
#import "DetailsDetailsTableViewController.h"
#import "TextAnswerCell.h"

static NSUInteger const kMCNumItems = 4;

#define answerString @"Text Cell Answer"
#define nsUserDefaultString @"Tab %@ Question %@"
#define cellChecked @"checked"
#define cellUnChecked @"unchecked"

@interface DetailsViewController ()
@property  (strong, atomic) NSString *tabQuestionNumbers;
@property  (strong, atomic) NSMutableArray *cellsSelected;
@end

@implementation DetailsViewController
@synthesize questionNumber;
@synthesize tabNumber;
@synthesize cellsSelected;
@synthesize tabQuestionNumbers;
@synthesize answerTextField;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    tabQuestionNumbers =[NSString stringWithFormat:nsUserDefaultString, [tabNumber stringValue],[questionNumber stringValue]];
    cellsSelected = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionNumbers]];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionNumbers] == nil){
        cellsSelected = [[NSMutableArray alloc] initWithCapacity:[self numberOfRowsInCurrentSection]];
        for (int i=0;i<[self numberOfRowsInCurrentSection];i++){
            [cellsSelected addObject:cellUnChecked];
        }
        //r[cellsSelected replaceObjectAtIndex:[self numberOfRowsInCurrentSection]-1 withObject:nil];
    }
    // Do any additional setup after loading the view.
}

-(void) dealloc {
    cellsSelected = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) numberOfRowsInCurrentSection {
    if ([tabNumber integerValue]== 0){
        return 4;
    }else if ([tabNumber integerValue] == 1){
        if ([questionNumber intValue] == 1 || [questionNumber intValue] == 10){
            return 5;
        }
        else if ([questionNumber intValue] == 4 || [questionNumber intValue] == 5 || [questionNumber intValue] == 8){
            return 3;
        }
        else if ([questionNumber intValue] == 6){
            return 10;
        }
        else if ([questionNumber intValue] == 7){
            return 11;
        }
        return 4;
    }else{
        if ([questionNumber intValue] == 1  || [questionNumber intValue] == 3  || [questionNumber intValue] == 9 || [questionNumber intValue] == 12 ||  [questionNumber intValue] == 13 || [questionNumber intValue] == 14 || [questionNumber intValue] == 17 || [questionNumber intValue] == 19 || [questionNumber intValue] == 22  || [questionNumber intValue] == 23  || [questionNumber intValue] == 25  || [questionNumber intValue] == 28  || [questionNumber intValue] == 34){
            return 5;
        }
        else if ([questionNumber intValue] == 7){
            return 12;
        }
        else if ([questionNumber intValue] == 11  || [questionNumber intValue] == 27  || [questionNumber intValue] == 30  || [questionNumber intValue] == 33){
            return 6;
        }
        else if ([questionNumber intValue] == 15 || [questionNumber intValue] == 18 || [questionNumber intValue] == 20 || [questionNumber intValue] == 21  || [questionNumber intValue] == 24){
            return 3;
        }
        
        return 4;
        
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //return kMCNumItems;
    return [self  numberOfRowsInCurrentSection];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([[DetailsViewController stringForCellNumber:(NSUInteger)indexPath.row%kMCNumItems questionNumber:questionNumber tabNumber:tabNumber] isEqualToString:answerString]){
        
        static NSString *CellIdentifier = @"TextAnswerCell";
        TextAnswerCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        [cell setDelegate:self];
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        
        if (!cell) {
            cell = [[TextAnswerCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            
            // iOS 7 separator
            if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
                cell.separatorInset = UIEdgeInsetsZero;
            }
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
            cell.contentView.backgroundColor = [UIColor whiteColor];
        }
        
        if (![cellsSelected[indexPath.row]  isEqual: @"unchecked"]){
            cell.answerTextField.text = cellsSelected[indexPath.row];}
        
        return cell;
    
    }
    
    static NSString *CellIdentifier = @"DetailsCell";
    QuestionDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    if (!cell) {
        cell = [[QuestionDetailsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        // iOS 7 separator
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            cell.separatorInset = UIEdgeInsetsZero;
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    if ([cellsSelected[indexPath.row]  isEqual: cellChecked]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}

- (void)configureCell:(QuestionDetailsTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell.textLabel setText:[DetailsViewController stringForCellNumber:indexPath.row questionNumber:questionNumber tabNumber:tabNumber]];

}

#pragma mark - PAPActivityFeedViewController

+ (NSString *)stringForCellNumber:(NSInteger)cellNumber questionNumber:(NSNumber *)qnumber tabNumber:(NSNumber *)tnumber{
    if ([tnumber intValue]== 0){
        if ([qnumber intValue] == 0){
            if (cellNumber == 0) {
                return NSLocalizedString(@"What are you here for:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Relationship", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Friendship", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 1){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Would you like to be connected with people with whom you have mutual friends on Facebook", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 2){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Would you like to meet people from graduate schools at", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Harvard", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"MIT", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 3){
            if (cellNumber == 0) {
                return NSLocalizedString(@"I would not like to be connected with people from departments in", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Harvard", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"MIT", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
    } else if ([tnumber intValue]== 1){
        if ([qnumber intValue] == 0){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Sex:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Male", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Female", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 1){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Orientation", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Straight", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Gay", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Bisexual", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 2){
            if (cellNumber == 0) {
                return NSLocalizedString(@"University", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Harvard", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"MIT", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 3){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Department", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Harvard", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"MIT", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 4){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Age", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 5){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Height", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 6){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Ethnicity", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Black/African", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"East Asian", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Hispanic/Latino", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Native American", nil);
            } else if ((int)cellNumber == 5)  {
                    return NSLocalizedString(@"Pacific Islander", nil);
            } else if ((int)cellNumber == 6)  {
                    return NSLocalizedString(@"South Asian", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"White/Caucasian", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Other", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        } else if ([qnumber intValue] == 7){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Religion", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Agnosticism", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Atheism", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Buddhism", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Catholicism", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Christianity", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Islam", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Judaism", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Protestantism", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"Other", nil);
            } else if ((int)cellNumber == 10)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        } else if ([qnumber intValue] == 8){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Nationality", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        } else if ([qnumber intValue] == 9){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Languages", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        } else if ([qnumber intValue] == 10){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Drinks", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Rarely", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Sometimes", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Often", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        } else if ([qnumber intValue] == 11){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Smokes", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
    } else if ([tnumber intValue]== 2){
        if ([qnumber intValue] == 0){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Have you been in a serious relationship at some point in the past six months?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 1){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Berry Line, Pinkberry, or Yogurt Land?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Berry Line", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Pinkberry", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Yogurt Land", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 2){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Do you consider yourself an introvert or extravert?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Introvert", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Extrovert", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 3){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Langdell, Lamont, or Widener?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Langdell", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Lamont", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Widener", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 4){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Have you noticed the “young lady”-“young man” newspaper salesman in Harvard Square?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 5){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Did you do some form of exercise in the past four days?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 6){
            if (cellNumber == 0) {
                return NSLocalizedString(@"When is the last time you got drunk?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 7){
            if (cellNumber == 0) {
                return NSLocalizedString(@"On a scale of 0 to 10, 10 being extremely shy and 0 being not shy at all, how shy are you? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 8){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Hong Kong or Yenching? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Hong Kong", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Yenching", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 9){
            if (cellNumber == 0) {
                return NSLocalizedString(@"How much does physical attractiveness matter in a match?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Not at all", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"A little", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"A lot", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 10){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Have you ever lived in the graduate student residence halls?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 11){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Would you prefer your partner to be more or less sexually experienced than you?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Slightly more", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Slightly less", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"I don’t care", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"None at all", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 12){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Would you prefer to date someone in the hard sciences or humanities?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Hard Sciences", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Humanities", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Doesn’t Matter", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 13){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Do you like the taste of beer?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"A little", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"A lot", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 14){
            if (cellNumber == 0) {
                return NSLocalizedString(@"What hair color do you prefer?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Dark", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Light", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"No preference", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 15){
            if (cellNumber == 0) {
                return NSLocalizedString(@"How many inches taller or shorter than you is your ideal partner?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 16){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Do you think that in general, men and women can be close friends without any romantic feelings developing?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 17){
            if (cellNumber == 0) {
                return NSLocalizedString(@"How important is it that you be able to engage in intellectual discussions with your partner?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Not at all", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"A little", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Not at all", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 18){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Assuming a relationship is going well, how long does it take before sex happens", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 19){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Does arguing with your partner arouse you?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"A little", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"A lot", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 20){
            if (cellNumber == 0) {
                return NSLocalizedString(@"The distribution of income and wealth in the US is primarily a function of:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 21){
            if (cellNumber == 0) {
                return NSLocalizedString(@"What do you want to do once you graduate:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 22){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Would you like to be married within the next five years?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Maybe", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 23){
            if (cellNumber == 0) {
                return NSLocalizedString(@"If your partner is overweight, is that:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"totally fine", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"a deal breaker", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"not preferred", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 24){
            if (cellNumber == 0) {
                return NSLocalizedString(@"How often do you go to Boston? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 25){
            if (cellNumber == 0) {
                return NSLocalizedString(@"On economic issues, do you wish the Obama administration was more the right, more to the left, or right where it is?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"more to the right", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"more to the left", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"right where it is", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 26){
            if (cellNumber == 0) {
                return NSLocalizedString(@"In a serious relationship would you contact your partner everyday?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 27){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Which character flows annoy you most?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Moodiness", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"dependency", nil);
            } else if ((int)cellNumber == 3) {
                return NSLocalizedString(@"jealousy", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"apathy", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 28){
            if (cellNumber == 0) {
                return NSLocalizedString(@"In terms of race, would you prefer dating someone with a similar or different racial background to yours?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Similar", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"different", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"doesn’t matter", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 29){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Would you want for there to be an afterlife where everyone would be rewarded for good acts and punished for bad acts, in proportion?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 30){
            if (cellNumber == 0) {
                return NSLocalizedString(@"How many children do you want to have?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"0", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"1-2", nil);
            } else if ((int)cellNumber == 3) {
                return NSLocalizedString(@"3-4", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"5+", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 31){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Are you intense or go-with-the-flow?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"intense", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"go-with-the-flow", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 32){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Is commitment or passion more important in a relationship?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"commitment more important", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"passion more importan", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 33){
            if (cellNumber == 0) {
                return NSLocalizedString(@"How long do you want your next relationship to last? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"One night", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"a few months to a year", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"several years", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"rest of life", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 34){
            if (cellNumber == 0) {
                return NSLocalizedString(@"How excited are you abou the prospect of a blind, 30 minute date?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"A lot", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"A little", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Not at all", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
    }
    return nil;
}


+ (CGFloat)heightForCellWithContentString:(NSString *)content cellInsetWidth:(CGFloat)cellInset {
    CGFloat horizontalTextSpace = [QuestionDetailsTableViewCell horizontalTextSpaceForInsetWidth:cellInset];
    
    CGSize contentSize = [content boundingRectWithSize:CGSizeMake(horizontalTextSpace, CGFLOAT_MAX)
                                               options:NSStringDrawingUsesLineFragmentOrigin // wordwrap?
                                            attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]}
                                               context:nil].size;
    
    CGFloat singleLineHeight = [@"Test" boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]}
                                                     context:nil].size.height;
    
    // Calculate the added height necessary for multiline text. Ensure value is not below 0.
    CGFloat multilineHeightAddition = contentSize.height - singleLineHeight;
    
    return 48.0f + fmax(0.0f, multilineHeightAddition);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *contentString = [DetailsViewController stringForCellNumber:(NSUInteger)indexPath.row%kMCNumItems questionNumber:questionNumber tabNumber:tabNumber];
    
    return [DetailsViewController heightForCellWithContentString:contentString cellInsetWidth:0.0f];
    //return 70.0;
}

- (void)cell:(TextAnswerCell *)cellView textfieldDidChange:(NSString *)text {
    if (text)
        [cellsSelected replaceObjectAtIndex:1 withObject:text];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailsMoreDetails"]) {
        
        // Get destination view
        DetailsDetailsTableViewController *viewcomp = [segue destinationViewController];
        
        // Pass the information to your destination view
        [viewcomp setDetailNumber:[NSNumber numberWithInteger:[self.tableView indexPathForSelectedRow].row]];
        [viewcomp setQuestionNumber:self.questionNumber];
        [viewcomp setTabNumber:self.tabNumber];
        
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
    if (indexPath.row == 0){
        return;
    }else if ([[tableView cellForRowAtIndexPath:indexPath].textLabel.text  isEqual: @"Done"]){
        [[NSUserDefaults standardUserDefaults] setObject:cellsSelected forKey:tabQuestionNumbers];
        [[NSUserDefaults standardUserDefaults] synchronize];
        cellsSelected = nil;
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    } else if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark){
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        //cellsSelected[indexPath.row] = cellUnChecked;
        [cellsSelected replaceObjectAtIndex:indexPath.row withObject:cellUnChecked];

    }
    else if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryNone){
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        //cellsSelected[indexPath.row] = cellChecked;
        [cellsSelected replaceObjectAtIndex:indexPath.row withObject:cellChecked];

    }
    
    if ([tabNumber intValue]== 0){
        if ([self.questionNumber intValue] == 2 || [self.questionNumber intValue] == 3){
            [self performSegueWithIdentifier:@"detailsMoreDetails" sender:self];
        }
    }
    else if ([tabNumber intValue]== 1){
        if ([self.questionNumber intValue] == 2 || [self.questionNumber intValue] == 3){
            [self performSegueWithIdentifier:@"detailsMoreDetails" sender:self];
        }
    }
}

@end
