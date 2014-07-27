//
//  DetailsDetailsTableViewController.m
//  PerfectBinding
//
//  Created by Hikari Senju on 6/16/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//
#import "DddTableViewController.h"
#import "DDTableViewController.h"
#import "DDTableViewCell.h"

#define nsUserDefaultString @"Tab %@ Question %@ Detail %@"
#define cellChecked @"checked"
#define cellUnChecked @"unchecked"

@interface DDTableViewController ()
@property  (strong, atomic) NSString *tabQuestionDetailNumbers;
@property  (strong, atomic) NSMutableArray *cellsSelected;
@end

@implementation DDTableViewController

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
        cellsSelected = [[NSMutableArray alloc] initWithCapacity:[self  numberOfRowsInCurrentSection:[self.tabNumber intValue] question:[self.questionNumber intValue] detail:[self.detailNumber intValue]]];
        for (int i=0;i<[self  numberOfRowsInCurrentSection:[self.tabNumber intValue] question:[self.questionNumber intValue] detail:[self.detailNumber intValue]];i++){
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

-(NSInteger) numberOfRowsInCurrentSection: (int)tab question:(int)question detail:(int)detail{
//    if (tab== 0){
        if (question== 2){
            if (detail== 1){
                return 13;
            }
            else if (detail == 2){
                return 7;
            }
        }
        if (question== 3){
            if (detail == 1){
                return 11;
            }
            else if (detail == 2){
                return 5;
            }
            else if (detail == 3){
                return 18;
            }
            else if (detail == 4){
                return 64;
            }
            else if (detail == 5){
                return 7;
            }
            else if (detail == 6){
                return 9;
            }
            else if (detail == 7){
                return 9;
            }
            else if (detail == 8){
                return 8;
            }
            else if (detail == 9){
                return 8;
            }
            else if (detail == 10){
                return 18;
            }
            else if (detail == 11){
                return 6;
            }
            else if (detail == 12){
                return 6;
            }
            else if (detail == 13){
                return 18;
            }
            else if (detail == 14){
                return 11;
            }
            else if (detail == 15){
                return 12;
            }
            else if (detail == 16){
                return 5;
            }
        }
   // }


    return 63;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self  numberOfRowsInCurrentSection:[self.tabNumber intValue] question:[self.questionNumber intValue] detail:[self.detailNumber intValue]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"DetailsCell";
    DDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    if (!cell) {
        cell = [[DDTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
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
    if (indexPath.row == 0){
        cell.userInteractionEnabled = NO;}
    cell.selectionStyle = UITableViewCellSelectionStyleNone;    
    return cell;
}


- (void)configureCell:(DDTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell.textLabel setText:[DDTableViewController stringForCellNumber:indexPath.row tabNumber:tabNumber questionNumber:detailNumber questionQuestionNumber:self.questionNumber]];
}

#pragma mark - PAPActivityFeedViewController

+ (NSString *)stringForCellNumber:(NSInteger)cellNumber tabNumber:(NSNumber *)tnumber questionNumber:(NSNumber *)qnumber questionQuestionNumber:(NSNumber *)qqnumber{
    //if ([tnumber intValue] == 0){
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
                return NSLocalizedString(@"Harvard Business School:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"MBA", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"PhD Accounting & Management", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"PhD Business Economics", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"PhD Health Policy", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"PhD Management", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"PhD Marketing", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"PhD Organizational Behavior", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"PhD Strategy", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"PhD Technology & Operations Management", nil);
            } else if ((int)cellNumber == 10)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 2){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Harvard Law School:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Juris Doctor (JD)", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Master of Laws (LL.M.)", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Doctor of Juridical Science (S.J.D.)", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 3){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Harvard Medical School:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Medical Degree (MD)", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Biological Chemistry and Molecular Pharmacology", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Cell Biology", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Genetics", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Global Health and Social Medicine", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Health Care Policy", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Microbiology and Immunobiology", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Neurobiology", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"Stem Cell and Regenerative Biology", nil);
            } else if ((int)cellNumber == 10)  {
                return NSLocalizedString(@"Systems Biology", nil);
            } else if ((int)cellNumber == 11)  {
                return NSLocalizedString(@"DMS Bioinformatics and Integrative Genomics (BIG)", nil);
            } else if ((int)cellNumber == 12)  {
                return NSLocalizedString(@"DMS Biological and Biomedical Sciences (BBS)", nil);
            } else if ((int)cellNumber == 13)  {
                return NSLocalizedString(@"DMS Immunology", nil);
            } else if ((int)cellNumber == 14)  {
                return NSLocalizedString(@"DMS Neuroscience", nil);
            } else if ((int)cellNumber == 15)  {
                return NSLocalizedString(@"DMS Speech and Hearing Bioscience and Technology (SHBT)", nil);
            } else if ((int)cellNumber == 16)  {
                return NSLocalizedString(@"DMS Virology", nil);
            } else if ((int)cellNumber == 17)  {
                    return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 4){
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
        if ([qnumber intValue] == 5){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Harvard School of Engineering and Applied Sciences :", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Applied Mathematics", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Applied Physics", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Computational Science and Engineering", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Computer Science", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Engineering Sciences", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 6){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Harvard Kennedy School:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Public Policy", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Public Administration/International Development", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Public Administration", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Joint & Concurrent Program", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Political Economy and Government (PEG)", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Health Policy", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Social Policy", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 7){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Harvard School of Public Health:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Biostatistics", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Environmental Health", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Epidemiology", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Genetics and Complex Diseases", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Global Health and Population", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Health Policy and Management", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Immunology and Infectious Diseases", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Nutrition", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Social and Behavioral Sciences", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 8){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Harvard School of Dental Medicine:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Developmental Biology", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Oral and Maxillofacial Surgery", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Oral Health Policy and Epidemiology", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Oral Medicine, Infection, and Immunity", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Restorative Dentistry and Biomaterials Sciences", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Other", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 9){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Harvard Graduate School of Design:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Architecture", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Landscape Architecture", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Urban Planning and Design", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Master in Design Studies", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Doctor of Design", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Doctor of Philosophy", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 10){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Harvard Graduate School of Education:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Doctor of Education Leadership", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Doctor of Philosophy in Education", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Doctor of Education", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Master in Arts in Education", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Master in Education Policy and Management", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Master in Higher Education", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Master in Human Development and Psychology", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Master in International Education Policy", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"Master in Language and Literacy", nil);
            } else if ((int)cellNumber == 10)  {
                return NSLocalizedString(@"Master in Learning and Teaching", nil);
            } else if ((int)cellNumber == 11)  {
                return NSLocalizedString(@"Master in Mind, Brain, and Education", nil);
            } else if ((int)cellNumber == 12)  {
                return NSLocalizedString(@"Master in Prevention Science and Practice", nil);
            } else if ((int)cellNumber == 13)  {
                return NSLocalizedString(@"Master in School Leadership", nil);
            } else if ((int)cellNumber == 14)  {
                return NSLocalizedString(@"Master in Special Studies", nil);
            } else if ((int)cellNumber == 15)  {
                return NSLocalizedString(@"Master in Teacher Education Program", nil);
            } else if ((int)cellNumber == 16)  {
                return NSLocalizedString(@"Master in Technology, Innovation, and Education", nil);
            } else if ((int)cellNumber == 17)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 11){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Harvard Divinity School:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Master of Theological Studies", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Master of Divinity", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Master of Theology", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Doctor of Theology ", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 12){
            if (cellNumber == 0) {
                return NSLocalizedString(@"MIT School of Architecture and Planning:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Architecture", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Media Arts and Sciences ", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Urban Studies and Planning", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Center for Real Estate ", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 13){
            if (cellNumber == 0) {
                return NSLocalizedString(@"MIT School of Engineering :", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Aeronautics and Astronautics ", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Biological Engineering ", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Chemical Engineering", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Civil and Environmental Engineering ", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Computation for Design and Optimization ", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Computational and Systems Biology ", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Computer Science and Molecular Biology ", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Electrical Engineering and Computer Science ", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"Engineering Systems Course", nil);
            } else if ((int)cellNumber == 10)  {
                return NSLocalizedString(@"Health Sciences and Technology ", nil);
            } else if ((int)cellNumber == 11)  {
                return NSLocalizedString(@"Materials Science and Engineering ", nil);
            } else if ((int)cellNumber == 12)  {
                return NSLocalizedString(@"Mechanical Engineering ", nil);
            } else if ((int)cellNumber == 13)  {
                return NSLocalizedString(@"Microbiology", nil);
            } else if ((int)cellNumber == 14)  {
                return NSLocalizedString(@"Nuclear Science and Engineering ", nil);
            } else if ((int)cellNumber == 15)  {
                return NSLocalizedString(@"Polymer Science and Technology", nil);
            } else if ((int)cellNumber == 16)  {
                return NSLocalizedString(@"Transportation", nil);
            } else if ((int)cellNumber == 17)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 14){
            if (cellNumber == 0) {
                return NSLocalizedString(@"MIT School of Science :", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Biology, PhD  ", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Brain and Cognitive Sciences, PhD ", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Chemistry, PhD/ScD", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Computational and Systems Biology, PhD", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"Computer Science and Molecular Biology, MEng", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"Earth, Atmospheric, and Planetary Sciences  ", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"Mathematics", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"Microbiology ", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"Physics", nil);
            } else if ((int)cellNumber == 10)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 15){
            if (cellNumber == 0) {
                return NSLocalizedString(@"School of Humanities, Arts, and Social Sciences:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"SM Comparative Media Studies", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"SM Science Writing", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"SM Economics", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"PhD Economics ", nil);
            } else if ((int)cellNumber == 5)  {
                return NSLocalizedString(@"PhD Linguistics", nil);
            } else if ((int)cellNumber == 6)  {
                return NSLocalizedString(@"PhD Philosophy ", nil);
            } else if ((int)cellNumber == 7)  {
                return NSLocalizedString(@"PhD Political Science", nil);
            } else if ((int)cellNumber == 8)  {
                return NSLocalizedString(@"PhD History", nil);
            } else if ((int)cellNumber == 9)  {
                return NSLocalizedString(@"PhD  Anthropology", nil);
            } else if ((int)cellNumber == 10)  {
                return NSLocalizedString(@"PhD Science, Technology and Society ", nil);
            } else if ((int)cellNumber == 11)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
        if ([qnumber intValue] == 16){
            if (cellNumber == 0) {
                return NSLocalizedString(@"Sloan School of Management:", nil);
            } else if ((int)cellNumber == 1) {
                return NSLocalizedString(@"Management ", nil);
            } else if ((int)cellNumber == 2)  {
                return NSLocalizedString(@"Operations Research  ", nil);
            } else if ((int)cellNumber == 3)  {
                return NSLocalizedString(@"Systems Design and Management", nil);
            } else if ((int)cellNumber == 4)  {
                return NSLocalizedString(@"Done", nil);
            } else {
                return nil;
            }
        }
    }
//        else if ([qnumber intValue] == 2){
//            if (cellNumber == 0) {
//                return NSLocalizedString(@"MIT Graduate School Departments:", nil);
//            } else if ((int)cellNumber == 1) {
//                return NSLocalizedString(@"Architecture", nil);
//            } else if ((int)cellNumber == 2)  {
//                return NSLocalizedString(@"Media Arts and Sciences", nil);
//            } else if ((int)cellNumber == 3)  {
//                return NSLocalizedString(@"Urban Studies and Planning", nil);
//            } else if ((int)cellNumber == 4)  {
//                return NSLocalizedString(@"Aeronautics and Astronautics", nil);
//            } else if ((int)cellNumber == 5)  {
//                return NSLocalizedString(@"Biological Engineering", nil);
//            } else if ((int)cellNumber == 6)  {
//                return NSLocalizedString(@"Chemical Engineering", nil);
//            } else if ((int)cellNumber == 7)  {
//                return NSLocalizedString(@"Civil and Environmental Engineering", nil);
//            } else if ((int)cellNumber == 8)  {
//                return NSLocalizedString(@"Electrical Engineering and Computer Science", nil);
//            } else if ((int)cellNumber == 9)  {
//                return NSLocalizedString(@"Engineering Systems Division (ESD)", nil);
//            } else if ((int)cellNumber == 10)  {
//                return NSLocalizedString(@"Materials Science and Engineering", nil);
//            } else if ((int)cellNumber == 11)  {
//                return NSLocalizedString(@"Nuclear Science and Engineering", nil);
//            } else if ((int)cellNumber == 12)  {
//                return NSLocalizedString(@"Institute for Medical Engineering and Science", nil);
//            } else if ((int)cellNumber == 13)  {
//                return NSLocalizedString(@"Anthropology", nil);
//            } else if ((int)cellNumber == 14)  {
//                return NSLocalizedString(@"Comparative Media Studies/Writing", nil);
//            } else if ((int)cellNumber == 15)  {
//                return NSLocalizedString(@"Economics", nil);
//            } else if ((int)cellNumber == 16)  {
//                return NSLocalizedString(@"Foreign Languages and Literatures", nil);
//            } else if ((int)cellNumber == 17)  {
//                return NSLocalizedString(@"History", nil);
//            } else if ((int)cellNumber == 18)  {
//                return NSLocalizedString(@"Humanities", nil);
//            } else if ((int)cellNumber == 19)  {
//                return NSLocalizedString(@"Linguistics and Philosophy", nil);
//            } else if ((int)cellNumber == 20)  {
//                return NSLocalizedString(@"Music and Theater Arts", nil);
//            } else if ((int)cellNumber == 21)  {
//                return NSLocalizedString(@"Political Science", nil);
//            } else if ((int)cellNumber == 22)  {
//                return NSLocalizedString(@"Science, Technology, and Society; Management", nil);
//            } else if ((int)cellNumber == 23)  {
//                return NSLocalizedString(@"Biology", nil);
//            } else if ((int)cellNumber == 24)  {
//                return NSLocalizedString(@"Brain and Cognitive Sciences", nil);
//            } else if ((int)cellNumber == 25)  {
//                return NSLocalizedString(@"Chemistry", nil);
//            } else if ((int)cellNumber == 26)  {
//                return NSLocalizedString(@"Earth, Atmospheric, and Planetary Sciences", nil);
//            } else if ((int)cellNumber == 27)  {
//                return NSLocalizedString(@"Mathematics", nil);
//            } else if ((int)cellNumber == 28)  {
//                return NSLocalizedString(@"Physics", nil);
//            } else if ((int)cellNumber == 29)  {
//                return NSLocalizedString(@"Done", nil);
//            } else {
//                return nil;
//            }
//        }
    //}
    return nil;
}



+ (CGFloat)heightForCellWithContentString:(NSString *)content cellInsetWidth:(CGFloat)cellInset {
    CGFloat horizontalTextSpace = [DDTableViewCell horizontalTextSpaceForInsetWidth:cellInset];
    
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
    NSString *contentString = [DDTableViewController stringForCellNumber:(NSUInteger)indexPath.row tabNumber:tabNumber questionNumber:detailNumber questionQuestionNumber:self.questionNumber ];
    
    return [DDTableViewController heightForCellWithContentString:contentString cellInsetWidth:0.0f];
    //return 70.0;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailstodd"]) {
        
        // Get destination view
        DDDTableViewController *viewcomp = [segue destinationViewController];
        
        // Pass the information to your destination view
        [viewcomp setDddNumber:[NSNumber numberWithInteger:[self.tableView indexPathForSelectedRow].row]];
        [viewcomp setQuestionNumber:self.questionNumber];
        [viewcomp setTabNumber:self.tabNumber];
        [viewcomp setDetailNumber:self.detailNumber];
    }
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
    } else if (([tabNumber intValue]==0 || [tabNumber intValue]== 1) && [questionNumber intValue]==3 && [detailNumber intValue]>11 &&  [detailNumber intValue]!=15){
        [self performSegueWithIdentifier:@"detailstodd" sender:self];
        return;
    } else if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark){
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        cellsSelected[indexPath.row] = cellUnChecked;
    } else if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryNone){
        if ([tabNumber intValue]== 1){
            for (long row = 0, rowCount = [self.tableView numberOfRowsInSection:0]; row < rowCount; ++row) {
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
                cell.accessoryType = UITableViewCellAccessoryNone;
                [cellsSelected replaceObjectAtIndex:row withObject:cellUnChecked];
            }
        }
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        cellsSelected[indexPath.row] = cellChecked;
    }
}

@end
