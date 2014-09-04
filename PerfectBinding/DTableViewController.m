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
@property  (strong, atomic) UIPickerView *myPickerView;
@end

@implementation DTableViewController
@synthesize questionNumber;
@synthesize tabNumber;
@synthesize cellsSelected;
@synthesize tabQuestionNumbers;
@synthesize myPickerView;

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
    if (!(([tabNumber intValue]== 1)&&([questionNumber intValue] == 3))){
        self.datePicker.hidden = TRUE;
    } else {
        self.datePicker.hidden = FALSE;
    }
    tabQuestionNumbers =[NSString stringWithFormat:nsUserDefaultString, [tabNumber stringValue],[questionNumber stringValue]];
    cellsSelected = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionNumbers]];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionNumbers] == nil){
        cellsSelected = [[NSMutableArray alloc] initWithCapacity:[self numberOfRowsInCurrentSection:[tabNumber intValue] question:[questionNumber intValue]]];
        for (int i=0;i<[self numberOfRowsInCurrentSection:[tabNumber intValue] question:[questionNumber intValue]];i++){
            [cellsSelected addObject:cellUnChecked];
        }
    }
    
    if ((([tabNumber intValue]== 1)&&([questionNumber intValue] == 4))){
        myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
        myPickerView.delegate = self;
        myPickerView.showsSelectionIndicator = YES;
        [self.view addSubview:myPickerView];
        self.heightArrayOne =  [[NSArray alloc] initWithObjects:@"3\'", @"4\'", @"5\'", @"6\'", @"7\'", nil];
        self.heightArrayTwo = [[NSArray alloc] initWithObjects:@"0\''", @"1\''", @"2\''", @"3\''",@"4\''", @"5\''", @"6\''",@"7\''",@"8\''",@"9\''",@"10\''",@"11\''", nil];
        self.tableView.scrollEnabled = FALSE;
    } else {
    
    }
    
    
    // Do any additional setup after loading the view.
}

- (void)dealloc
{
    tabQuestionNumbers = nil;
    cellsSelected = nil;
    myPickerView = nil;
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
        
        NSIndexPath *fifthRow = [NSIndexPath indexPathForRow:1 inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:fifthRow];
        cell.textLabel.text = newString;
        [self.tableView reloadRowsAtIndexPaths:@[fifthRow] withRowAnimation:UITableViewRowAnimationFade];
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
        if (question == 2){
            return 18;
        } else {
            return 4;
        }
    }else if (tab == 1){
        if(question == 0){
            return 4;
        } else if (question == 1){
            return 5;
        } else if (question == 2){
            return 18;
        }else if (question == 3){
            return 3;
        }else if (question == 4){
            return 3;
        }else if (question == 5){
            return 10;
        }else if (question == 6){
            return 11;
        }else if (question == 7){
            return 3;
        }else if (question == 8){
            return 3;
        }else if (question == 9){
            return 5;
        }else {
            return 4;
        }
    }else{
        if(question == 0){
            return 3;
        } else if (question == 1){
            return 6;
        } else if (question == 2){
            return 6;
        }else if (question == 3){
            return 6;
        }else if (question == 4){
            return 5;
        }else if (question == 5){
            return 4;
        }else if (question == 6){
            return 5;
        }else if (question == 7){
            return 5;
        }else if (question == 8){
            return 7;
        }else if (question == 9){
            return 7;
        }else if (question == 10){
            return 6;
        }else if (question == 11){
            return 5;
        }else if (question == 12){
            return 5;
        }else if (question == 13){
            return 5;
        }else if (question == 14){
            return 5;
        }else if (question == 15){
            return 5;
        }else if (question == 16){
            return 5;
        }else if (question == 17){
            return 5;
        }else if (question == 18){
            return 7;
        }else if (question == 19){
            return 4;
        }else if (question == 20){
            return 6;
        }else if (question == 21){
            return 6;
        }else if (question == 22){
            return 5;
        }else if (question == 23){
            return 5;
        }else if (question == 24){
            return 4;
        }else if (question == 25){
            return 5;
        }else if (question == 26){
            return 6;
        }else if (question == 27){
            return 5;
        }else if (question == 28){
            return 4;
        }else if (question == 29){
            return 5;
        }else if (question == 30){
            return 7;
        }else if (question == 31){
            return 5;
        }else if (question == 32){
            return 5;
        }else if (question == 33){
            return 5;
        }else if (question == 34){
            return 4;
        }else if (question == 35){
            return 5;
        }else if (question == 36){
            return 5;
        }else {
            return 3;
        }
        
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //return kMCNumItems;
    return [self numberOfRowsInCurrentSection:[tabNumber intValue] question:[questionNumber intValue]];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([[DTableViewController stringForCellNumber:(NSUInteger)indexPath.row questionNumber:questionNumber tabNumber:tabNumber] isEqualToString:answerString]){
        
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
    else {
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
            cell.userInteractionEnabled = NO;
            cell.textLabel.font = [UIFont italicSystemFontOfSize:18.0f];
        } else {
            cell.userInteractionEnabled = YES;
            cell.textLabel.font = [UIFont systemFontOfSize:18.0f];
        }
        
        if ((([tabNumber intValue]== 1)&&([questionNumber intValue] == 3 || [questionNumber intValue] == 4)&&(indexPath.row == 1))){
            cell.userInteractionEnabled = NO;
            [cell.textLabel setText:cellsSelected[indexPath.row]];
            if ([cell.textLabel.text isEqualToString:@"unchecked"]){
                [cell.textLabel setText:@""];
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
}

- (void)configureCell:(DTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell.textLabel setText:[DTableViewController stringForCellNumber:indexPath.row questionNumber:questionNumber tabNumber:tabNumber]];

}


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
        else if ([qnumber intValue] == 3){
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
        else if ([qnumber intValue] == 4){
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
        else if ([qnumber intValue] == 5){
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
        } else if ([qnumber intValue] == 6){
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
        } else if ([qnumber intValue] == 7){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Nationality", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        } else if ([qnumber intValue] == 8){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Languages", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        } else if ([qnumber intValue] == 9){
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
        } else if ([qnumber intValue] == 10){
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
        if ([qnumber intValue] == 0){//
            if (cellNumber == 0) {
                return NSLocalizedString(@"In one to five words, what is the best compliment you’ve ever gotten?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 1){//
            if (cellNumber == 0) {
                return NSLocalizedString(@"What would you say is the biggest challenge to meeting new people at Harvard or MIT? (Check all that apply)", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"I am too busy with work", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Other people are too busy with work", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Not enough people with whom I am compatible", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"I do not know", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 2){
            if (cellNumber == 0) {
                return NSLocalizedString(@"What would you say is the biggest advantage of meeting a graduate student or alum here in Cambridge?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"They will understand the unique joys and trials of graduate school!", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"There is no distinct advantage really, it just might be fun to meet new interesting people.", nil);
            } else if ((int)cellNumber == 3) {
                return NSLocalizedString(@"It will be nice to meet people with similar interests and ambitions. ", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"I don’t know/care", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 3){//
            if (cellNumber == 0) {
                return NSLocalizedString(@"It’s a perfect 68 degrees out and you want to spend some time on the Charles: do you go for a run, bike ride, or picnic?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Run", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Bike", nil);
            } else if ((int)cellNumber == 3) {
                return NSLocalizedString(@"Ride", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Picnic", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 4){//
            if (cellNumber == 0) {
                return NSLocalizedString(@"Do you tend to prefer spending time with people one-on-one, in small groups, or in large gatherings?  ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"One-on-one", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Small groups", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Large gatherings", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 5){//
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
        } else if ([qnumber intValue] == 6){//
            if (cellNumber == 0) {
                return NSLocalizedString(@"Do you prefer teaching or research, or both equally? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Teaching", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Research", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Both equally", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 7){//
            if (cellNumber == 0) {
                return NSLocalizedString(@"Most people think that lying should generally be avoided. Which of the following statements against lying do you find most appealing? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"In general, lying leads to harmful consequences", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Lying is intrinsically bad no matter its consequences", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Lying makes it difficult for a person to become the best person they can be. ", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 8){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Which of the following words would your close friends most likely use to describe you? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Non-judgmental", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Genuine", nil);
            } else if ((int)cellNumber == 3)   {
                return NSLocalizedString(@"Trustworthy ", nil);
            } else if ((int)cellNumber == 4) {
                return NSLocalizedString(@"Fun", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Offers good advice", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 9){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Which of the following character traits do you value most in a friend? (Pick one)", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Non-judgmental", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Genuine", nil);
            } else if ((int)cellNumber == 3)   {
                return NSLocalizedString(@"Trustworthy ", nil);
            } else if ((int)cellNumber == 4) {
                return NSLocalizedString(@"Fun", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Offers good advice", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 10){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Berry Line, Pinkberry, or Yogurt Land?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Berry Line", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Pinkberry", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Yogurt Land", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"JP Licks, please", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 11){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Did you like the most recent horror film you saw? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3) {
                return NSLocalizedString(@"I have never watched a horror film or don’t remember", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 12){
            if (cellNumber == 0) {
                return NSLocalizedString(@"While all important, which of the following benefits of a close friendship or being in relationship would you say you value the most? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Having someone who understands important things about you without having to explicitly explain them ", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Having someone with whom you can enjoy fun activities and common interests", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Having someone available to support you, and whom you can support, in times of need", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 13){
            if (cellNumber == 0) {
                return NSLocalizedString(@"How often do you find yourself in conversations with strangers on the red line or an MBTA bus?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Often, I enjoy striking up conversations with strangers", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"More often than I’d like", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Rarely or never", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 14){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Many people have friends who do not know each other. Do new friends that you make tend to fit in well with your other friends?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Typically, yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Often times, no", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"It just depends on the person", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 15){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Do you to tend to know reasonably well the family members of your very closest friends?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes, we are close", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"I have met them, but do not know them well", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Not at all", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 16){
            if (cellNumber == 0) {
                return NSLocalizedString(@"To what extent do the opinions of family members affect some of the more important decisions you make in your life?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Very little", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Somewhat", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Very much", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 17){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Thinking about times in which you have found yourself talking about your close friends or loved ones to other people, do you feel that you tend to describe them:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"in a more favorable way than perhaps reflects their true attributes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"in a less favorable way than perhaps reflects how you really feel about them", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"pretty accurately", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 18){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Among the following four negative attributes, pick two that are especially characteristic of a bad friend? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Too judgmental/critical", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Not interested enough in doing fun things", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Not open to talking through problems honestly", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Not trustworthy/dependable", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"I don’t know", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 19){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Would you rather meet people with interests that are similar to yours or different than yours?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Similar", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Different", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 20){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Langdell (Law library), Lamont, or Widener?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Langdell", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Lamont", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Widener", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"I do not know/do not care", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 21){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Hayden, Barker, or Rotch? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Hayden", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Barker", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Rotch", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"I do not know/do not care", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 22){
            if (cellNumber == 0) {
                return NSLocalizedString(@"How often do you enjoy going for a drink? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Often", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Sometimes", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Rarely or Never", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 23){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Imagine that psychologists and engineers created a machine that induces whatever desirable experiences you could want. The experiences would be so real that they could not be distinguished from pleasures you experience outside the machine. Would you prefer this machine to real life?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"I don’t understand/care", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 24){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Have you ever traveled a country alone? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 25){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Do you or would you enjoy living in a residential/dorm setting, like the graduate student residence halls?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"I [would] enjoy it", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"It is or probably would be alright", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"I [would] hate it ", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 26){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Do you like to discuss political, economic, and/or cultural issues with your friends?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes, very much", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Yes, but only sometimes", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Rarely", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"I avoid these topics", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 27){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Would you prefer to make new friends in the hard sciences or humanities?", nil);
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
        }else if ([qnumber intValue] == 28){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Does the idea of spending a year of your life on a sailboat sound appealing? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 29){
            if (cellNumber == 0) {
                return NSLocalizedString(@"In general, do you tend to go to your friends or close ones with issues related to grad school or your personal life?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes, I often discuss these kinds of issues with friends", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No, I tend not to do so but think I should do it more often", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"No, I prefer to keep these kinds of issues to myself", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 30){
            if (cellNumber == 0) {
                return NSLocalizedString(@"What’s your favorite “Square” in Cambridge? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Harvard Square", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Kendall Square", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Central Square", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Porter/Davis Square", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"No preference whatsoever", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 31){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Do you like the taste of beer?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"I don’t know", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 32){
            if (cellNumber == 0) {
                return NSLocalizedString(@"How religious/non-religious would you consider yourself? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Religion is an important part of my life", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"I consider myself spiritual, but not religious", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"I am not at all religious", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
            
        }else if ([qnumber intValue] == 33){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Irrespective of how you feel about it, how often do you see your close friends in Cambridge? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"At least every few days", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Maybe once a week", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Every two weeks or longer", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 34){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Do you tend to plan most things in advance or do you go with the flow? ", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Plan most things in advance", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Go with the flow", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 35){
            if (cellNumber == 0) {
                return NSLocalizedString(@"If you had the choice as to whether there was an afterlife where everyone would be rewarded for good acts and punished for bad acts that they did, in proportion, would you want such a place to exist, assuming no other alternatives?", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Yes, I would like such a place to exist", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"No, I would not like such a place to exist", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"This question is nonsensical/confusing", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }else if ([qnumber intValue] == 36){
            if (cellNumber == 0) {
                return NSLocalizedString(@"How excited are you about the prospect of a 30 minute meet-up with a Harvard or MIT student?", nil);
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
        }else if ([qnumber intValue] == 37){
            if (cellNumber == 0) {
                return NSLocalizedString(@"In either technical or “fun” language, please describe what you study in one sentence.", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(answerString, nil);
            } else if ((int)cellNumber == 2)  {
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
    //dispatch_async(dispatch_get_main_queue(), ^{
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
    [self.tableView reloadRowsAtIndexPaths:@[fifthRow] withRowAnimation:UITableViewRowAnimationFade];
    
    formatter = nil;
    //[[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
   // });
    
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
        dispatch_queue_t defaultsQueue = dispatch_queue_create("Defalts Queue",NULL);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0), defaultsQueue, ^{
            [[NSUserDefaults standardUserDefaults] setObject:cellsSelected forKey:tabQuestionNumbers];
            [[NSUserDefaults standardUserDefaults] synchronize];
        });
        [self performSegueWithIdentifier:@"unwindToTableController" sender:self];
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
