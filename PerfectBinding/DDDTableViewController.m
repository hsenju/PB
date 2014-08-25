//
//  DDDTableViewController.m
//  PerfectBinding
//
//  Created by Hikari Senju on 7/10/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import "DDDTableViewController.h"
#import "DDDTableViewCell.h"

#define nsUserDefaultString @"Tab %@ Question %@ Detail %@ DDD %@"
#define cellChecked @"checked"
#define cellUnChecked @"unchecked"


@interface DDDTableViewController ()
@property  (strong, atomic) NSString *tabQuestionDetailNumbers;
@property  (strong, atomic) NSMutableArray *cellsSelected;
@end

@implementation DDDTableViewController
@synthesize dddNumber;
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
    
    [super viewDidLoad];
    self.tableView.allowsMultipleSelection = YES;
    
    tabQuestionDetailNumbers =[NSString stringWithFormat:nsUserDefaultString, [tabNumber stringValue],[questionNumber stringValue], [detailNumber stringValue], [dddNumber stringValue]];
    cellsSelected = [[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionDetailNumbers];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionDetailNumbers] == nil){
        cellsSelected = [[NSMutableArray alloc] initWithCapacity:[self  numberOfRowsInCurrentSection:[tabNumber intValue] question:[questionNumber intValue] detail:[detailNumber intValue] ddd:[dddNumber intValue]]];
        for (int i=0;i<[self  numberOfRowsInCurrentSection:[tabNumber intValue] question:[questionNumber intValue] detail:[detailNumber intValue] ddd:[dddNumber intValue]];i++){
            [cellsSelected addObject:cellUnChecked];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) numberOfRowsInCurrentSection: (int)tab question:(int)question detail:(int)detail ddd:(int)ddd{
    //    [cell.textLabel setText:[DDDTableViewController stringForCellNumber:indexPath.row tabNumber:tabNumber questionNumber:detailNumber questionQuestionNumber:self.questionNumber dddNumber:dddNumber]];
    //+ (NSString *)stringForCellNumber:(NSInteger)cellNumber tabNumber:(NSNumber *)tnumber questionNumber:(NSNumber *)qnumber questionQuestionNumber:(NSNumber *)qqnumber dddNumber: (NSNumber *)dddnumber{
    //if (tab==0){
        if (question== 3){
            if (detail == 12){
                if (ddd == 1){
                    return 13;
                }
                else if (ddd == 2){
                    return 5;
                }
                else if (ddd == 3){
                    return 5;
                }
                else if (ddd == 4){
                    return 3;
                }
            }
            if (detail == 13){
                if (ddd == 1){
                    return 14;
                }
                if (ddd == 2){
                    return 8;
                }
                if (ddd == 3){
                    return 6;
                }
                if (ddd == 4){
                    return 21;
                }
                if (ddd == 5){
                    return 3;
                }
                if (ddd == 6){
                    return 3;
                }
                if (ddd == 7){
                    return 3;
                }
                if (ddd == 8){
                    return 8;
                }
                if (ddd == 9){
                    return 9;
                }
                if (ddd == 10){
                    return 8;
                }
                if (ddd == 11){
                    return 5;
                }
                if (ddd == 12){
                    return 11;
                }
                if (ddd == 13){
                    return 3;
                }
                if (ddd == 14){
                    return 4;
                }
                if (ddd == 15){
                    return 3;
                }
                if (ddd == 16){
                    return 4;
                }
            }
            if(detail == 14){
                if (ddd == 1){
                    return 13;
                }
                if (ddd == 2){
                    return 4;
                }
                if (ddd == 3){
                    return 6;
                }
                if (ddd == 4){
                    return 3;
                }
                if (ddd == 5){
                    return 3;
                }
                if (ddd == 6){
                    return 17;
                }
                if (ddd == 7){
                    return 3;
                }
                if (ddd == 8){
                    return 3;
                }
                if (ddd == 9){
                    return 4;
                }
            }
            if (detail == 16){
                if (ddd == 1){
                    return 10;
                }
                if (ddd == 2){
                    return 4;
                }
                if (ddd == 3){
                    return 3;
                }
            }
        }
    //}
    return 0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self  numberOfRowsInCurrentSection:[tabNumber intValue] question:[questionNumber intValue] detail:[detailNumber intValue] ddd:[dddNumber intValue]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"DetailsCell";
    DDDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    if (!cell) {
        cell = [[DDDTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
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
    }else {
        cell.userInteractionEnabled = YES;
        cell.textLabel.font = [UIFont systemFontOfSize:18.0f];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)configureCell:(DDDTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell.textLabel setText:[DDDTableViewController stringForCellNumber:indexPath.row tabNumber:tabNumber questionNumber:detailNumber questionQuestionNumber:self.questionNumber dddNumber:dddNumber]];
}

#pragma mark - PAPActivityFeedViewController

+ (NSString *)stringForCellNumber:(NSInteger)cellNumber tabNumber:(NSNumber *)tnumber questionNumber:(NSNumber *)qnumber questionQuestionNumber:(NSNumber *)qqnumber dddNumber: (NSNumber *)dddnumber{
    //if ([tnumber intValue]== 0){
    if ([qqnumber intValue]== 2){
        if ([qnumber intValue] == 12){
            if ([dddnumber intValue] == 1){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Architecture:", nil);
                } else if ((int) cellNumber == 1) {
                    return NSLocalizedString(@"MArch Architecture", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"SMArchS Architecture Studies", nil);
                } else if ((int)cellNumber == 4)  {
                    return NSLocalizedString(@"SMBT Building Technology", nil);
                } else if ((int)cellNumber == 5)  {
                    return NSLocalizedString(@"SMBT Building Technology", nil);
                } else if ((int)cellNumber == 6)  {
                    return NSLocalizedString(@"SMACT Art, Culture and Technology", nil);
                } else if ((int)cellNumber == 7)  {
                    return NSLocalizedString(@"PhD Architecture: Building Technology", nil);
                } else if ((int)cellNumber == 8)  {
                    return NSLocalizedString(@"PhD Architecture: Design and Computation", nil);
                } else if ((int)cellNumber == 9)  {
                    return NSLocalizedString(@"PhD Architecture: History and Theory of Architecture", nil);
                } else if ((int)cellNumber == 10)  {
                    return NSLocalizedString(@"School of Engineering and Applied Sciences", nil);
                } else if ((int)cellNumber == 11)  {
                        return NSLocalizedString(@"PhD Architecture: History and Theory of Art", nil);
                } else if ((int)cellNumber == 12)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            else if ([dddnumber intValue] == 2){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Media Arts and Sciences :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM Media Technology", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"SM Media Arts and Sciences", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"PhD Media Arts and Sciences", nil);
                } else if ((int)cellNumber == 4)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            else if ([dddnumber intValue] == 3){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Urban Studies and Planning :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"MCP City Planning", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"SM Urban Studies Planning", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"PhD Urban and Regional Planning", nil);
                } else if ((int)cellNumber == 4)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            else if ([dddnumber intValue] == 4){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Center for Real Estate:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"MSRED", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
        }
        if ([qnumber intValue] == 13){
            if ([dddnumber intValue] == 1){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Aeronautics and Astronautics:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM & MBA Engineering and Management", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"PhD/ScD Aeronautics and Astronautics", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"PhD/ScD Aerospace Computational Engineering", nil);
                } else if ((int)cellNumber == 4)  {
                    return NSLocalizedString(@"PhD/ScDAir-Breathing Propulsion", nil);
                } else if ((int)cellNumber == 5)  {
                    return NSLocalizedString(@"PhD/ScDAir Transportation Systems", nil);
                } else if ((int)cellNumber == 6)  {
                    return NSLocalizedString(@"PhD/ScD Autonomous Systems", nil);
                } else if ((int)cellNumber == 7)  {
                    return NSLocalizedString(@"PhD/ScD Communications and Networks", nil);
                } else if ((int)cellNumber == 8)  {
                    return NSLocalizedString(@"PhD/ScD Controls", nil);
                } else if ((int)cellNumber == 9)  {
                    return NSLocalizedString(@"PhD/ScD Humans in Aerospace", nil);
                } else if ((int)cellNumber == 10)  {
                    return NSLocalizedString(@"PhD/ScD Materials and Structures", nil);
                } else if ((int)cellNumber == 11)  {
                    return NSLocalizedString(@"PhD/ScD Space Propulsion", nil);
                } else if ((int)cellNumber == 12)  {
                    return NSLocalizedString(@"PhD/ScD Space Systems", nil);
                } else if ((int)cellNumber == 13)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 2){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Biological Engineering :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM Toxicology", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"SM and MBA Engineering and Management", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"MEng Biomedical Engineering", nil);
                } else if ((int)cellNumber == 4)  {
                    return NSLocalizedString(@"PhD/ScD Applied Biosciences", nil);
                } else if ((int)cellNumber == 5)  {
                    return NSLocalizedString(@"PhD/ScD Bioengineering", nil);
                } else if ((int)cellNumber == 6)  {
                    return NSLocalizedString(@"PhD/ScD Biological Engineering", nil);
                } else if ((int)cellNumber == 7)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 3){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Chemical Engineering  :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM Chemical Engineering Practice", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"SM and MBA Engineering and Management", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"PhD/ScD Chemical Engineering", nil);
                } else if ((int)cellNumber == 4)  {
                    return NSLocalizedString(@"PhD Chemical Engineering Practice", nil);
                } else if ((int)cellNumber == 5)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 4){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Civil and Environmental Engineering :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM and MBA Engineering and Management", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"MEng Civil and Environmental Engineering", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"PhD/ScD Biological Oceanography", nil);
                } else if ((int)cellNumber == 4)  {
                    return NSLocalizedString(@"PhD/ScD Chemical Oceanography", nil);
                } else if ((int)cellNumber == 5)  {
                    return NSLocalizedString(@"PhD/ScD Civil and Environmental Engineering", nil);
                } else if ((int)cellNumber == 6)  {
                    return NSLocalizedString(@"PhD/ScD Civil and Environmental Systems", nil);
                } else if ((int)cellNumber == 7)  {
                    return NSLocalizedString(@"PhD/ScD Civil Engineering", nil);
                } else if ((int)cellNumber == 8)  {
                    return NSLocalizedString(@"PhD/ScD Coastal Engineering", nil);
                } else if (cellNumber == 9) {
                    return NSLocalizedString(@"PhD/ScD Construction Engineering and Management", nil);
                } else if ((int)cellNumber == 10) {
                    return NSLocalizedString(@"PhD/ScD Environmental Biologyt", nil);
                } else if ((int)cellNumber == 12)  {
                    return NSLocalizedString(@"PhD/ScD Environmental Chemistry", nil);
                } else if ((int)cellNumber == 13)  {
                    return NSLocalizedString(@"PhD/ScD Environmental Engineering", nil);
                } else if ((int)cellNumber == 14)  {
                    return NSLocalizedString(@"PhD/ScD Environmental Fluid Mechanics", nil);
                } else if ((int)cellNumber == 15)  {
                    return NSLocalizedString(@"PhD/ScD Geotechnical and Geoenvironmental Engineering", nil);
                } else if ((int)cellNumber == 16)  {
                    return NSLocalizedString(@"PhD/ScD Hydrology", nil);
                } else if ((int)cellNumber == 17)  {
                    return NSLocalizedString(@"PhD/ScD Information Technology", nil);
                } else if ((int)cellNumber == 18)  {
                    return NSLocalizedString(@"PhD/ScD Oceanographic Engineering", nil);
                } else if ((int)cellNumber == 19)  {
                    return NSLocalizedString(@"PhD/ScD Structures and Materials", nil);
                } else if ((int)cellNumber == 19)  {
                    return NSLocalizedString(@"PhD/ScD Transportation", nil);
                } else if ((int)cellNumber == 20)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 5){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Computation for Design and Optimization :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM Computation for Design and Optimization", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 6){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Computational and Systems Biology :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"PhD Computational and Systems Biology", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 7){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Computer Science and Molecular Biology :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"MEngComputer Science and Molecular Biology", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 8){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Electrical Engineering and Computer Science:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM and MBA Engineering and Management", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"MEng Electrical Engineering and Computer Science", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"PhD/ScD Computer Sciences", nil);
                } else if ((int)cellNumber == 4)  {
                    return NSLocalizedString(@"PhD/ScD Computer Science and Engineering", nil);
                } else if ((int)cellNumber == 5)  {
                    return NSLocalizedString(@"PhD/ScD Electrical Engineerings", nil);
                } else if ((int)cellNumber == 6)  {
                    return NSLocalizedString(@"PhD/ScD Electrical Engineering and Computer Science", nil);
                } else if ((int)cellNumber == 7)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 9){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Engineering Systems Course", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM Engineering and management", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"SM Engineering Systems", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"SM Technology and Policy", nil);
                } else if ((int)cellNumber == 4)  {
                    return NSLocalizedString(@"SM and MBA Engineering and Management ", nil);
                } else if ((int)cellNumber == 5)  {
                    return NSLocalizedString(@"MEng Logistics", nil);
                } else if (cellNumber == 6) {
                    return NSLocalizedString(@"PhD Engineering Systems", nil);
                } else if ((int)cellNumber == 7) {
                    return NSLocalizedString(@"PhD Technology, Management, and Policy", nil);
                } else if ((int)cellNumber == 8)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 10){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Health Sciences and Technology ", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"MD Medical Sciences (Harvard Medical School)", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"ScD/PhD Health Sciences and Technology", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"ScD/PhD Health Sciences and Technology, Bioastronautics", nil);
                } else if ((int)cellNumber == 4)  {
                    return NSLocalizedString(@"ScD/PhD Health Sciences and Technoogy, Bioinformatics and Integrative Genomics", nil);
                } else if ((int)cellNumber == 5)  {
                    return NSLocalizedString(@"ScD/PhD Health Sciences and Technology, Medical Engineering and Medical Physics", nil);
                } else if ((int)cellNumber == 6) {
                    return NSLocalizedString(@"ScD/PhD Health Sciences and Technology, Speech and Hearing Bioscience and Technology", nil);
                } else if ((int)cellNumber == 7)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 11){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Materials Science and Engineering :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM Materials Science and Engineering ", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"PhD/ScD Archaeological Materials", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"PhD/ScD Materials Science and Technology", nil);
                } else if ((int)cellNumber == 4)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 12){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"	Mechanical Engineering :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM Mechanical Engineering ", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"SM Naval Architecture and Marine Engineering", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"SM Ocean Engineering", nil);
                } else if ((int)cellNumber == 4)  {
                    return NSLocalizedString(@"SM Oceanographic Engineering", nil);
                } else if ((int)cellNumber == 5)  {
                    return NSLocalizedString(@"MEng Manufacturing", nil);
                } else if ((int)cellNumber == 6)  {
                    return NSLocalizedString(@"SM/MBA Engineering/Management ", nil);
                } else if ((int)cellNumber == 7)  {
                    return NSLocalizedString(@"PhD/ScD Mechanical Engineering", nil);
                } else if ((int)cellNumber == 8)  {
                    return NSLocalizedString(@"PhD/ScD naval Architecture and Marine Engineering ", nil);
                } else if ((int)cellNumber == 9)  {
                    return NSLocalizedString(@"PhD/ScD Ocean Engineering", nil);
                } else if ((int)cellNumber == 9)  {
                    return NSLocalizedString(@"PhD/ScD Oceanographic Engineering", nil);
                } else if ((int)cellNumber == 10)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 13){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Microbiology:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"PhD Microbiology", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 14){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Nuclear Science and Engineering :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM Nuclear Science and Engineering", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"PhD/ScD Nuclear Science and Engineering", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 15){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Polymer Science and Technology:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"PhD Polymer Science and Technology", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 16){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Transportation:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM Transportation", nil);
                } else if ((int)cellNumber == 2) {
                    return NSLocalizedString(@"PhD Transportation", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
        }
        if([qnumber intValue] == 14){
            if ([dddnumber intValue] == 1){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Biology, PhD :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"Biochemistry", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Biological Oceanography", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"Biophysical Chemistry and Molecular Structure", nil);
                } else if ((int)cellNumber == 4) {
                    return NSLocalizedString(@"Cell Biology", nil);
                } else if ((int)cellNumber == 5)  {
                    return NSLocalizedString(@"Computational and Systems Biology", nil);
                } else if ((int)cellNumber == 6)  {
                    return NSLocalizedString(@"Developmental Biology", nil);
                } else if ((int)cellNumber == 7)  {
                    return NSLocalizedString(@"Genetics", nil);
                } else if ((int)cellNumber == 8)  {
                    return NSLocalizedString(@"Immunology", nil);
                } else if ((int)cellNumber == 9) {
                    return NSLocalizedString(@"Microbiology", nil);
                } else if ((int)cellNumber == 10)  {
                    return NSLocalizedString(@"Molecular Biology", nil);
                } else if ((int)cellNumber == 11)  {
                    return NSLocalizedString(@"Neurobiology", nil);
                } else if ((int)cellNumber == 12)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 2){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Brain and Cognitive Sciences, PhD :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"Cognitive Science", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Neuroscience", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 3){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Chemistry, PhD/ScD:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"Biological Chemistry", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Inorganic Chemistry", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"Organic Chemistry", nil);
                } else if ((int)cellNumber == 4) {
                    return NSLocalizedString(@"Physical Chemistry", nil);
                } else if ((int)cellNumber == 5)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 4){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Computational and Systems Biology, PhD :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"Computational and Systems Biology", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 5){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Computer Science and Molecular Biology, MEng :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"Computer Science and Molecular Biology", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 6){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Earth, Atmospheric, and Planetary Sciences:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM Chemical Oceanography", nil);
                } else if ((int)cellNumber == 2) {
                    return NSLocalizedString(@"SM Climate Physics and Chemistry", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"SM Earth and Planetary Sciences", nil);
                } else if ((int)cellNumber == 4) {
                    return NSLocalizedString(@"SM Marine Geology and Geophysics", nil);
                } else if ((int)cellNumber == 5) {
                    return NSLocalizedString(@"SM Physical Oceanography", nil);
                } else if ((int)cellNumber == 6)  {
                    return NSLocalizedString(@"PhD/ScD Atmospheric Chemistry", nil);
                } else if ((int)cellNumber == 7) {
                    return NSLocalizedString(@"PhD/ScD Atmospheric Science", nil);
                } else if ((int)cellNumber == 8) {
                    return NSLocalizedString(@"PhD/ScD Chemical Oceanography", nil);
                } else if ((int)cellNumber == 9)  {
                    return NSLocalizedString(@"PhD/ScD Climate Physics and Chemistry", nil);
                } else if ((int)cellNumber == 10) {
                    return NSLocalizedString(@"PhD/ScD Geochemistry", nil);
                } else if ((int)cellNumber == 11) {
                    return NSLocalizedString(@"PhD/ScD Geology", nil);
                } else if ((int)cellNumber == 12) {
                    return NSLocalizedString(@"PhD/ScD Geophysics", nil);
                } else if ((int)cellNumber == 13)  {
                    return NSLocalizedString(@"PhD/ScD Marine Geology and Geophysics", nil);
                } else if ((int)cellNumber == 14) {
                    return NSLocalizedString(@"PhD/ScD Physical Oceanography", nil);
                } else if ((int)cellNumber == 15) {
                    return NSLocalizedString(@"PhD/ScD Planetary Sciences", nil);
                } else if ((int)cellNumber == 16)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 7){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Mathematics:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"PhD Mathematics", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 8){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Microbiology:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"PhD Microbiology", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 9){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Physics:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM Physics", nil);
                } else if ((int)cellNumber == 2) {
                    return NSLocalizedString(@"PhD Physics", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
        }
        if ([qnumber intValue] == 16){
            if ([dddnumber intValue] == 1){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Management:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"MBA Business Administration", nil);
                } else if ((int)cellNumber == 2) {
                    return NSLocalizedString(@"MFin Finance", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"SM Management", nil);
                } else if ((int)cellNumber == 4) {
                    return NSLocalizedString(@"SM Management of Technology", nil);
                } else if ((int)cellNumber == 5) {
                    return NSLocalizedString(@"SM Management Research", nil);
                } else if ((int)cellNumber == 6)  {
                    return NSLocalizedString(@"SM Management Studies", nil);
                } else if ((int)cellNumber == 7) {
                    return NSLocalizedString(@"SM/MBA Engineering/Management", nil);
                } else if ((int)cellNumber == 8) {
                    return NSLocalizedString(@"PhD Management", nil);
                } else if ((int)cellNumber == 9)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 2){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Operations Research :", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"SM Operations Research", nil);
                } else if ((int)cellNumber == 2) {
                    return NSLocalizedString(@"PhD Operations Research", nil);
                } else if ((int)cellNumber == 3)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
            if ([dddnumber intValue] == 3){
                if (cellNumber == 0) {
                    return NSLocalizedString(@"Systems Design and management:", nil);
                } else if ((int)cellNumber == 1) {
                    return NSLocalizedString(@"Engineering and Management", nil);
                } else if ((int)cellNumber == 2)  {
                    return NSLocalizedString(@"Done", nil);
                } else {
                    return nil;
                }
            }
        }
    }
    //}
     return nil;
}



+ (CGFloat)heightForCellWithContentString:(NSString *)content cellInsetWidth:(CGFloat)cellInset {
    CGFloat horizontalTextSpace = [DDDTableViewCell horizontalTextSpaceForInsetWidth:cellInset];
    
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
    NSString *contentString = [DDDTableViewController stringForCellNumber:(NSUInteger)indexPath.row tabNumber:tabNumber questionNumber:detailNumber questionQuestionNumber:self.questionNumber dddNumber:dddNumber];
    
    return [DDDTableViewController heightForCellWithContentString:contentString cellInsetWidth:0.0f];
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
