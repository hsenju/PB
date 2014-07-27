//
//  QuestionsDetailsViewController.m
//  PerfectBinding
//
//  Created by Hikari Senju on 6/9/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import "DTableViewController.h"
#import "DTableViewCell.h"
#import "DDTableViewController.h"
#import "TextAnswerCell.h"

static NSUInteger const kMCNumItems = 4;

#define answerString @"Text Cell Answer"
#define dateString @""
#define heightString @""
#define nsUserDefaultString @"Tab %@ Question %@"
#define cellChecked @"checked"
#define cellUnChecked @"unchecked"

@interface DTableViewController ()
@property  (strong, atomic) NSString *tabQuestionNumbers;
@property  (strong, atomic) NSMutableArray *cellsSelected;
@end

@implementation DTableViewController
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
    if (!(([tabNumber intValue]== 1)&&([questionNumber intValue] == 4))){
        self.datePicker.hidden = TRUE;
    }
    tabQuestionNumbers =[NSString stringWithFormat:nsUserDefaultString, [tabNumber stringValue],[questionNumber stringValue]];
    cellsSelected = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionNumbers]];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionNumbers] == nil){
        cellsSelected = [[NSMutableArray alloc] initWithCapacity:[self numberOfRowsInCurrentSection:[tabNumber intValue] question:[questionNumber intValue]]];
        for (int i=0;i<[self numberOfRowsInCurrentSection:[tabNumber intValue] question:[questionNumber intValue]];i++){
            [cellsSelected addObject:cellUnChecked];
        }
        //r[cellsSelected replaceObjectAtIndex:[self numberOfRowsInCurrentSection]-1 withObject:nil];
    }
    
    if ((([tabNumber intValue]== 1)&&([questionNumber intValue] == 5))){
        UIPickerView *myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
        myPickerView.delegate = self;
        myPickerView.showsSelectionIndicator = YES;
        [self.view addSubview:myPickerView];
        self.heightArrayOne =  [[NSArray alloc] initWithObjects:@"3\'", @"4\'", @"5\'", @"6\'", @"7\'", nil];
        //self.heightArrayTwo =  [[NSArray alloc] initWithObjects:@"1\"", @"2\"", @"3\"", @"4\"", @"5\"","6\"", @"7\"", @"8\"", @"9\"", @"10\"", @"11\"", nil];
        self.heightArrayTwo = [[NSArray alloc] initWithObjects:@"0\''", @"1\''", @"2\''", @"3\''",@"4\''", @"5\''", @"6\''",@"7\''",@"8\''",@"9\''",@"10\''",@"11\''", nil]; //@"4\''", @"5\''","6\''", @"7\''", @"8\''", @"9\''", @"10\''", @"11\''", nil];
        self.tableView.scrollEnabled = FALSE;
    }
    // Do any additional setup after loading the view.
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    dispatch_async(dispatch_get_main_queue(), ^{
        NSInteger rowOne = [pickerView selectedRowInComponent:0];
        NSString *stringOne = [self.heightArrayOne objectAtIndex:rowOne];
        NSInteger rowTwo = [pickerView selectedRowInComponent:1];
        NSString *stringTwo = [self.heightArrayTwo objectAtIndex:rowTwo];
        
        NSString *newString = [[stringOne stringByAppendingString:@" "]stringByAppendingString:stringTwo];
        
        [cellsSelected replaceObjectAtIndex:1 withObject:newString];
        //[self.tableView reloadData];
        
        NSIndexPath *fifthRow = [NSIndexPath indexPathForRow:1 inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:fifthRow];
        cell.textLabel.text = newString;
        //[[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
    });
    
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 50;
    
    return sectionWidth;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    if (component == 0){
        return self.heightArrayOne.count;}
    else {
        return self.heightArrayTwo.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    if (component == 0){
        return [self.heightArrayOne objectAtIndex:row];}
    else {
        return [self.heightArrayTwo objectAtIndex:row];
    }
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

-(NSInteger) numberOfRowsInCurrentSection: (int)tab question:(int)question {
    if (tab== 0){
        if (question == 3){
            return 18;
        }
        return 4;
    }else if (tab == 1){
        if (question == 1 || question == 10){
            return 5;
        }
        else if (question == 3){
            return 18;
        }
        else if (question == 4 || question == 5 || question == 8){
            return 3;
        }
        else if (question == 6){
            return 10;
        }
        else if (question == 7){
            return 11;
        }
        return 4;
    }else{
        if (question == 1  || question == 3  || question == 9 || question == 12 ||  question == 13 || question == 14 || question == 17 || question == 19 || question == 22  || question == 23  || question == 25  || question == 28  || question == 34){
            return 5;
        }
        else if (question == 7){
            return 12;
        }
        else if (question == 11  || question == 27  || question == 30  || question == 33){
            return 6;
        }
        else if (question == 15 || question == 18 || question == 20 || question == 21  || question == 24){
            return 3;
        }
        
        return 4;
        
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //return kMCNumItems;
    return [self numberOfRowsInCurrentSection:[tabNumber intValue] question:[questionNumber intValue]];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([[DTableViewController stringForCellNumber:(NSUInteger)indexPath.row%kMCNumItems questionNumber:questionNumber tabNumber:tabNumber] isEqualToString:answerString]){
        
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
    DTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    if (!cell) {
        cell = [[DTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
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
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    if (indexPath.row == 0){
        cell.userInteractionEnabled = NO;}
    
    if ((([tabNumber intValue]== 1)&&([questionNumber intValue] == 4 || [questionNumber intValue] == 5)&&(indexPath.row == 1))){
        cell.userInteractionEnabled = NO;
        [cell.textLabel setText:cellsSelected[indexPath.row]];
        if ([cell.textLabel.text isEqualToString:@"unchecked"]){
            [cell.textLabel setText:@""];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)configureCell:(DTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell.textLabel setText:[DTableViewController stringForCellNumber:indexPath.row questionNumber:questionNumber tabNumber:tabNumber]];

}

#pragma mark - PAPActivityFeedViewController

+ (NSString *)stringForCellNumber:(NSInteger)cellNumber questionNumber:(NSNumber *)qnumber tabNumber:(NSNumber *)tnumber{
    if ([tnumber intValue]== 0){
        if ([qnumber intValue] == 0){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Are you here for:", nil);
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
            } else if ((int) cellNumber == 1) {
                return NSLocalizedString(@"Harvard Business School", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Harvard Law School", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Harvard Medical School", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Harvard Graduate School Departments", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Harvard School of Engineering and Applied Sciences", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Harvard Kennedy School", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Harvard School of Public Health", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Harvard School of Dental Medicine", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"Harvard Graduate School of Design", nil);
            } else if ((int)cellNumber == 10)  {
                return NSLocalizedString(@"Harvard Graduate School of Education", nil);
            } else if ((int)cellNumber == 11)  {
                return NSLocalizedString(@"Harvard Divinity School", nil);
            } else if ((int)cellNumber == 12) {
                return NSLocalizedString(@"MIT School of Architecture and Planning", nil);
            } else if ((int)cellNumber == 13)  {
                return NSLocalizedString(@"MIT School of Engineering", nil);
            } else if ((int)cellNumber == 14)  {
                return NSLocalizedString(@"MIT School of Science", nil);
            } else if ((int)cellNumber == 15)  {
                return NSLocalizedString(@"School of Humanities, Arts, and Social Sciences", nil);
            } else if ((int)cellNumber == 16)  {
                return NSLocalizedString(@"Sloan School of Management", nil);
            } else if ((int)cellNumber == 17)  {
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
                return NSLocalizedString(@"University:", nil);
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
                return NSLocalizedString(@"Department:", nil);
            } else if ((int) cellNumber == 1) {
                return NSLocalizedString(@"Harvard Business School", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Harvard Law School", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Harvard Medical School", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Harvard Graduate School Departments", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Harvard School of Engineering and Applied Sciences", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Harvard Kennedy School", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Harvard School of Public Health", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Harvard School of Dental Medicine", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"Harvard Graduate School of Design", nil);
            } else if ((int)cellNumber == 10)  {
                return NSLocalizedString(@"Harvard Graduate School of Education", nil);
            } else if ((int)cellNumber == 11)  {
                return NSLocalizedString(@"Harvard Divinity School", nil);
            } else if ((int)cellNumber == 12) {
                return NSLocalizedString(@"MIT School of Architecture and Planning", nil);
            } else if ((int)cellNumber == 13)  {
                return NSLocalizedString(@"MIT School of Engineering", nil);
            } else if ((int)cellNumber == 14)  {
                return NSLocalizedString(@"MIT School of Science", nil);
            } else if ((int)cellNumber == 15)  {
                return NSLocalizedString(@"School of Humanities, Arts, and Social Sciences", nil);
            } else if ((int)cellNumber == 16)  {
                return NSLocalizedString(@"Sloan School of Management", nil);
            } else if ((int)cellNumber == 17)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
            
        }
        else if ([qnumber intValue] == 4){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Birthday", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(dateString, nil);
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
                return NSLocalizedString(heightString, nil);
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
                return NSLocalizedString(@"Totally fine", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"A deal breaker", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Not preferred", nil);
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
                return NSLocalizedString(@"More to the right", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"More to the left", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Right where it is", nil);
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
                return NSLocalizedString(@"Dependency", nil);
            } else if ((int)cellNumber == 3) {
                return NSLocalizedString(@"Jealousy", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Apathy", nil);
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
                return NSLocalizedString(@"Different", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Doesn’t matter", nil);
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
                return NSLocalizedString(@"Intense", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Go-with-the-flow", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 32){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Is commitment or passion more important in a relationship?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Commitment more important", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Passion more importan", nil);
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
                return NSLocalizedString(@"A few months to a year", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Several years", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Rest of life", nil);
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
    CGFloat horizontalTextSpace = [DTableViewCell horizontalTextSpaceForInsetWidth:cellInset];
    
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
    NSString *contentString = [DTableViewController stringForCellNumber:(NSUInteger)indexPath.row%kMCNumItems questionNumber:questionNumber tabNumber:tabNumber];
    
    return [DTableViewController heightForCellWithContentString:contentString cellInsetWidth:0.0f];
    //return 70.0;
}

- (void)cell:(TextAnswerCell *)cellView textfieldDidChange:(NSString *)text {
    if (text)
        [cellsSelected replaceObjectAtIndex:1 withObject:text];
}
- (IBAction)dateValueChanged:(id)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM dd, YYYY"];
    // NSString *chosenDateString =  [formatter stringFromDate:self.datePicker.date];
    //NSIndexPath *indexPathCell = [NSIndexPath indexPathForRow:1 inSection:0];
    //UITableViewCell *tableCell =[self.tableView cellForRowAtIndexPath:indexPathCell];
    
    //[tableCell.textLabel setText:[formatter stringFromDate:self.datePicker.date] ];

    [cellsSelected replaceObjectAtIndex:1 withObject:[formatter stringFromDate:self.datePicker.date]];
    //[self.tableView reloadData];
    
    NSIndexPath *fifthRow = [NSIndexPath indexPathForRow:1 inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:fifthRow];
    cell.textLabel.text = [formatter stringFromDate:self.datePicker.date];
    //[[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
    });
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailsMoreDetails"]) {
        
        // Get destination view
        DDTableViewController *viewcomp = [segue destinationViewController];
        
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
    }
    
    if ([tabNumber intValue]== 0 || [tabNumber intValue]== 1){
        if ([self.questionNumber intValue] == 2 || [self.questionNumber intValue] == 3){
            [self performSegueWithIdentifier:@"detailsMoreDetails" sender:self];
            return;
        }
    }
    
    if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark){
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        //cellsSelected[indexPath.row] = cellUnChecked;
        [cellsSelected replaceObjectAtIndex:indexPath.row withObject:cellUnChecked];

    }
    else if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryNone){

        BOOL tab1 =([tabNumber intValue]== 0) && ([questionNumber intValue] == 1);
        BOOL tab2 = ([tabNumber intValue]== 1) && (([questionNumber intValue] == 0) || ([questionNumber intValue] == 1) || ([questionNumber intValue] == 6) ||([questionNumber intValue] == 6) || ([questionNumber intValue] == 7) || ([questionNumber intValue] == 10) || ([questionNumber intValue] == 11));
        BOOL tab3 = ([tabNumber intValue]== 2);
        
        if (tab1 || tab2 || tab3 ){
            for (long row = 0, rowCount = [self.tableView numberOfRowsInSection:0]; row < rowCount; ++row) {
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
                cell.accessoryType = UITableViewCellAccessoryNone;
                [cellsSelected replaceObjectAtIndex:row withObject:cellUnChecked];
            }
        }
        
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        //cellsSelected[indexPath.row] = cellChecked;
        [cellsSelected replaceObjectAtIndex:indexPath.row withObject:cellChecked];
    }
    

}

@end
