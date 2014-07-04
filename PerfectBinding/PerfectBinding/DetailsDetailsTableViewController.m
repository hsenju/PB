//
//  DetailsDetailsTableViewController.m
//  PerfectBinding
//
//  Created by Hikari Senju on 6/16/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import "DetailsDetailsTableViewController.h"
#import "DetailsDetailsTableViewCell.h"

#define nsUserDefaultString @"Tab %@ Question %@ Detail %@"
#define cellChecked @"checked"
#define cellUnChecked @"unchecked"

@interface DetailsDetailsTableViewController ()
@property  (strong, atomic) NSString *tabQuestionDetailNumbers;
@property  (strong, atomic) NSMutableArray *cellsSelected;
@end

@implementation DetailsDetailsTableViewController

@synthesize tabNumber;
@synthesize detailNumber;
@synthesize questionNumber;
@synthesize cellsSelected;
@synthesize tabQuestionDetailNumbers;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.allowsMultipleSelection = YES;
    
    tabQuestionDetailNumbers =[NSString stringWithFormat:nsUserDefaultString, [tabNumber stringValue],[questionNumber stringValue], [detailNumber stringValue]];
    cellsSelected = [[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionDetailNumbers];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionDetailNumbers] == nil){
        cellsSelected = [[NSMutableArray alloc] initWithCapacity:[self numberOfRowsInCurrentSection]];
        for (int i=0;i<[self numberOfRowsInCurrentSection];i++){
            [cellsSelected addObject:cellUnChecked];
        }
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

-(NSInteger) numberOfRowsInCurrentSection {
    if ([self.questionNumber intValue]== 2){
        if ([self.detailNumber intValue] == 1){
            return 13;
        }
        else if ([self.detailNumber intValue] == 2){
            return 7;
        }
    }
    if ([self.questionNumber intValue]== 3){
        if ([self.detailNumber intValue] == 1){
            return 64;
            
        }
        else if ([self.detailNumber intValue] == 2){
            return 30;
        }
    }
    return 63;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self  numberOfRowsInCurrentSection];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"DetailsCell";
    DetailsDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    if (!cell) {
        cell = [[DetailsDetailsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
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


- (void)configureCell:(DetailsDetailsTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell.textLabel setText:[DetailsDetailsTableViewController stringForCellNumber:indexPath.row questionNumber:detailNumber questionQuestionNumber:self.questionNumber]];
}

#pragma mark - PAPActivityFeedViewController

+ (NSString *)stringForCellNumber:(NSInteger)cellNumber questionNumber:(NSNumber *)qnumber questionQuestionNumber:(NSNumber *)qqnumber{
    if ([qqnumber intValue]== 2){
        if ([qnumber intValue] == 1){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Harvard Graduate Schools:", nil);
            } else if ((int) cellNumber == 1) {
                return NSLocalizedString(@"Harvard Business School", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Graduate School of Arts and Sciences", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Graduate School of Design", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Harvard Graduate School of Education", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Harvard Kennedy School", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Harvard Law School", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Harvard School of Public Health", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Harvard School of Dental Medicine", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"Harvard Divinity School", nil);
            } else if ((int)cellNumber == 10)  {
                return NSLocalizedString(@"School of Engineering and Applied Sciences", nil);
            } else if ((int)cellNumber == 11)  {
                return NSLocalizedString(@"Harvard Medical School", nil);
            } else if ((int)cellNumber == 12)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 2){
            if (cellNumber == 0) {
                return NSLocalizedString(@"MIT Graduate Schools:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"School of Architecture and Planning", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"School of Engineering", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"School of Humanities, Arts, and Social Sciences", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"MIT Sloan School of Management", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"School of Science", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
    }
    if ([qqnumber intValue]== 3){
        if ([qnumber intValue] == 1){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Harvard Graduate School Departments:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"African and African American Studies", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"American Studies", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Anthropology; Architecture, Landscape Architecture, and Urban Planning", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Astronomy", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Biological Sciences in Dental Medicine", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Biological Sciences in Public Health", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Biophysics", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Biostatistics", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"Business Economics", nil);
            } else if ((int)cellNumber == 10)  {
                return NSLocalizedString(@"Celtic Languages and Literatures", nil);
            } else if ((int)cellNumber == 11)  {
                return NSLocalizedString(@"Chemical Biology", nil);
            } else if ((int)cellNumber == 12)  {
                return NSLocalizedString(@"Chemistry and Chemical Biology", nil);
            } else if ((int)cellNumber == 13)  {
                return NSLocalizedString(@"The Classics", nil);
            } else if ((int)cellNumber == 14)  {
                return NSLocalizedString(@"Comparative Literature", nil);
            } else if ((int)cellNumber == 15)  {
                return NSLocalizedString(@"DMS Bioinformatics and Integrative Genomics", nil);
            } else if ((int)cellNumber == 16)  {
                return NSLocalizedString(@"DMS Biological and Biomedical Sciences", nil);
            } else if ((int)cellNumber == 17)  {
                return NSLocalizedString(@"DMS Immunology", nil);
            } else if ((int)cellNumber == 18)  {
                return NSLocalizedString(@"DMS Neuroscience", nil);
            } else if ((int)cellNumber == 19)  {
                return NSLocalizedString(@"DMS Speech and Hearing Bioscience and Technology", nil);
            } else if ((int)cellNumber == 20)  {
                return NSLocalizedString(@"DMS Virology", nil);
            } else if ((int)cellNumber == 21)  {
                return NSLocalizedString(@"Earth and Planetary Sciences", nil);
            } else if ((int)cellNumber == 22)  {
                return NSLocalizedString(@"East Asian Languages and Civilizations", nil);
            } else if ((int)cellNumber == 23)  {
                return NSLocalizedString(@"Economics", nil);
            } else if ((int)cellNumber == 24)  {
                return NSLocalizedString(@"Education", nil);
            } else if ((int)cellNumber == 25)  {
                return NSLocalizedString(@"Applied Math", nil);
            } else if ((int)cellNumber == 26)  {
                return NSLocalizedString(@"Applied Physics", nil);
            } else if ((int)cellNumber == 27)  {
                return NSLocalizedString(@"Computer Science", nil);
            } else if ((int)cellNumber == 28)  {
                return NSLocalizedString(@"Engineering Sciences", nil);
            } else if ((int)cellNumber == 29)  {
                return NSLocalizedString(@"English", nil);
            } else if ((int)cellNumber == 30)  {
                return NSLocalizedString(@"Film and Visual Studies", nil);
            } else if ((int)cellNumber == 31)  {
                return NSLocalizedString(@"Forestry", nil);
            } else if ((int)cellNumber == 32)  {
                return NSLocalizedString(@"Germanic Languages and Literatures", nil);
            } else if ((int)cellNumber == 33)  {
                return NSLocalizedString(@"Government", nil);
            } else if ((int)cellNumber == 34)  {
                return NSLocalizedString(@"Health Policy", nil);
            } else if ((int)cellNumber == 35)  {
                return NSLocalizedString(@"History", nil);
            } else if ((int)cellNumber == 36)  {
                return NSLocalizedString(@"History of Art and Architecture", nil);
            } else if ((int)cellNumber == 37)  {
                return NSLocalizedString(@"History of Science", nil);
            } else if ((int)cellNumber == 38)  {
                return NSLocalizedString(@"Human Evolutionary Biology", nil);
            } else if ((int)cellNumber == 39)  {
                return NSLocalizedString(@"Inner Asian and Altaic Studies", nil);
            } else if ((int)cellNumber == 40)  {
                return NSLocalizedString(@"Linguistics", nil);
            } else if ((int)cellNumber == 41)  {
                return NSLocalizedString(@"Mathematics", nil);
            } else if ((int)cellNumber == 41)  {
                return NSLocalizedString(@"Middle Eastern Studies", nil);
            } else if ((int)cellNumber == 42)  {
                return NSLocalizedString(@"Molecules, Cells and Organisms", nil);
            } else if ((int)cellNumber == 43)  {
                return NSLocalizedString(@"Engineering and Physical Biology", nil);
            } else if ((int)cellNumber == 44)  {
                return NSLocalizedString(@"Music", nil);
            } else if ((int)cellNumber == 45)  {
                return NSLocalizedString(@"Near Eastern Languages and Civilizations", nil);
            } else if ((int)cellNumber == 46)  {
                return NSLocalizedString(@"Organismic and Evolutionary Biology", nil);
            } else if ((int)cellNumber == 47)  {
                return NSLocalizedString(@"Organizational Behavior", nil);
            } else if ((int)cellNumber == 48)  {
                return NSLocalizedString(@"Philosophy", nil);
            } else if ((int)cellNumber == 49)  {
                return NSLocalizedString(@"Physics", nil);
            } else if ((int)cellNumber == 50)  {
                return NSLocalizedString(@"Political Economy and Government", nil);
            } else if ((int)cellNumber == 51)  {
                return NSLocalizedString(@"Psychology", nil);
            } else if ((int)cellNumber == 52)  {
                return NSLocalizedString(@"Public Policy", nil);
            } else if ((int)cellNumber == 53)  {
                return NSLocalizedString(@"Regional Studies-East Asia", nil);
            } else if ((int)cellNumber == 54)  {
                return NSLocalizedString(@"Regional Studies-Russia, Eastern Europe, and Central Asia", nil);
            } else if ((int)cellNumber == 55)  {
                return NSLocalizedString(@"Religion", nil);
            } else if ((int)cellNumber == 56)  {
                return NSLocalizedString(@"Romance Languages and Literatures", nil);
            } else if ((int)cellNumber == 57)  {
                return NSLocalizedString(@"Slavic Languages and Literatures", nil);
            } else if ((int)cellNumber == 58)  {
                return NSLocalizedString(@"Social Policy", nil);
            } else if ((int)cellNumber == 59)  {
                return NSLocalizedString(@"Sociology", nil);
            } else if ((int)cellNumber == 60)  {
                return NSLocalizedString(@"South Asian Studies", nil);
            } else if ((int)cellNumber == 61)  {
                return NSLocalizedString(@"Statistics", nil);
            } else if ((int)cellNumber == 62)  {
                return NSLocalizedString(@"Systems Biology", nil);
            } else if ((int)cellNumber == 63)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        else if ([qnumber intValue] == 2){
            if (cellNumber == 0) {
                return NSLocalizedString(@"MIT Graduate School Departments:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Architecture", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Media Arts and Sciences", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Urban Studies and Planning", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Aeronautics and Astronautics", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Biological Engineering", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Chemical Engineering", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Civil and Environmental Engineering", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Electrical Engineering and Computer Science", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"Engineering Systems Division (ESD)", nil);
            } else if ((int)cellNumber == 10)  {
                return NSLocalizedString(@"Materials Science and Engineering", nil);
            } else if ((int)cellNumber == 11)  {
                return NSLocalizedString(@"Nuclear Science and Engineering", nil);
            } else if ((int)cellNumber == 12)  {
                return NSLocalizedString(@"Institute for Medical Engineering and Science", nil);
            } else if ((int)cellNumber == 13)  {
                return NSLocalizedString(@"Anthropology", nil);
            } else if ((int)cellNumber == 14)  {
                return NSLocalizedString(@"Comparative Media Studies/Writing", nil);
            } else if ((int)cellNumber == 15)  {
                return NSLocalizedString(@"Economics", nil);
            } else if ((int)cellNumber == 16)  {
                return NSLocalizedString(@"Foreign Languages and Literatures", nil);
            } else if ((int)cellNumber == 17)  {
                return NSLocalizedString(@"History", nil);
            } else if ((int)cellNumber == 18)  {
                return NSLocalizedString(@"Humanities", nil);
            } else if ((int)cellNumber == 19)  {
                return NSLocalizedString(@"Linguistics and Philosophy", nil);
            } else if ((int)cellNumber == 20)  {
                return NSLocalizedString(@"Music and Theater Arts", nil);
            } else if ((int)cellNumber == 21)  {
                return NSLocalizedString(@"Political Science", nil);
            } else if ((int)cellNumber == 22)  {
                return NSLocalizedString(@"Science, Technology, and Society; Management", nil);
            } else if ((int)cellNumber == 23)  {
                return NSLocalizedString(@"Biology", nil);
            } else if ((int)cellNumber == 24)  {
                return NSLocalizedString(@"Brain and Cognitive Sciences", nil);
            } else if ((int)cellNumber == 25)  {
                return NSLocalizedString(@"Chemistry", nil);
            } else if ((int)cellNumber == 26)  {
                return NSLocalizedString(@"Earth, Atmospheric, and Planetary Sciences", nil);
            } else if ((int)cellNumber == 27)  {
                return NSLocalizedString(@"Mathematics", nil);
            } else if ((int)cellNumber == 28)  {
                return NSLocalizedString(@"Physics", nil);
            } else if ((int)cellNumber == 29)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
    }
    return nil;
}



+ (CGFloat)heightForCellWithContentString:(NSString *)content cellInsetWidth:(CGFloat)cellInset {
    CGFloat horizontalTextSpace = [DetailsDetailsTableViewCell horizontalTextSpaceForInsetWidth:cellInset];
    
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
    NSString *contentString = [DetailsDetailsTableViewController stringForCellNumber:(NSUInteger)indexPath.row questionNumber:detailNumber questionQuestionNumber:self.questionNumber ];
    
    return [DetailsDetailsTableViewController heightForCellWithContentString:contentString cellInsetWidth:0.0f];
    //return 70.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0){
        return;
    } else if ([[tableView cellForRowAtIndexPath:indexPath].textLabel.text  isEqual: @"Done"]){
        [[NSUserDefaults standardUserDefaults] setObject:cellsSelected forKey:tabQuestionDetailNumbers];
        [[NSUserDefaults standardUserDefaults] synchronize];
        cellsSelected = nil;
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    } else if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark){
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        cellsSelected[indexPath.row] = cellUnChecked;
    } else if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryNone){
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        cellsSelected[indexPath.row] = cellChecked;
    }
}

@end
