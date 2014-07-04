//
//  LookingForViewController.m
//  PerfectBinding
//
//  Created by Hikari Senju on 5/24/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//
#import <Parse/Parse.h>
#import "TableView.h"
#import "TableViewCell.h"
#import "DetailsViewController.h"

@interface TableView ()

@end

@implementation TableView

@synthesize actualSegmentedIndex;
@synthesize segControl;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        actualSegmentedIndex = 0;
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) numberOfRowsInSection: (NSInteger)index {
    if (index == 0){
        return 4;
    }else if (index == 1){
        return 12;
    }else{
        return 36;}
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self numberOfRowsInSection: segControl.selectedSegmentIndex];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"QuestionsCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    //cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        // iOS 7 separator
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            cell.separatorInset = UIEdgeInsetsZero;
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell.textLabel setText:[TableView stringForCellNumber:indexPath.row tab:segControl.selectedSegmentIndex]];

}

#pragma mark - PAPActivityFeedViewController

+ (NSString *)stringForCellNumber:(NSInteger)cellNumber tab:(NSInteger)segInd{
    if (segInd == 0){
        if (cellNumber == 0) {
            return NSLocalizedString(@"1. Are you here for: ", nil);
        } else if ((int)cellNumber == 1)  {
            return NSLocalizedString(@"2. Would you like to be connected with people with whom you have mutual friends on Facebook?", nil);
        } else if ((int)cellNumber == 2)  {
            return NSLocalizedString(@"3. Would you like to meet people from: ", nil);
        } else if ((int)cellNumber == 3)  {
            return NSLocalizedString(@"4. I would not like to be connected with people in the following departments", nil);
        } else {
            return nil;
        }
    } else if (segInd == 1){
        if (cellNumber == 0) {
            return NSLocalizedString(@"1. Sex:", nil);
        } else if ((int)cellNumber == 1)  {
            return NSLocalizedString(@"2. Orientation: ", nil);
        } else if ((int)cellNumber == 2)  {
            return NSLocalizedString(@"3. University: ", nil);
        } else if ((int)cellNumber == 3)  {
            return NSLocalizedString(@"4. Department: ", nil);
        } else if ((int)cellNumber == 4)  {
            return NSLocalizedString(@"5. Age: ", nil);
        } else if ((int)cellNumber == 5)  {
            return NSLocalizedString(@"6. Height: ", nil);
        } else if ((int)cellNumber == 6)  {
            return NSLocalizedString(@"7. Ethnicity: ", nil);
        } else if ((int)cellNumber == 7)  {
            return NSLocalizedString(@"8. Religion : ", nil);
        } else if ((int)cellNumber == 8)  {
            return NSLocalizedString(@"9. Nationality: ", nil);
        } else if ((int)cellNumber == 9)  {
            return NSLocalizedString(@"10. Languages: ", nil);
        } else if ((int)cellNumber == 10)  {
            return NSLocalizedString(@"11. Drinks: ", nil);
        } else if ((int)cellNumber == 11)  {
            return NSLocalizedString(@"12. Smokes: ", nil);
        } else {
            return nil;
        }
    }else{
        if (cellNumber == 0) {
            return NSLocalizedString(@"1. Have you been in a serious relationship at some point in the past six months?", nil);
        } else if ((int)cellNumber == 1)  {
            return NSLocalizedString(@"2. Berry Line, Pinkberry, or Yogurt Land? ", nil);
        } else if ((int)cellNumber == 2)  {
            return NSLocalizedString(@"3. Do you consider yourself an introvert or extravert?", nil);
        } else if ((int)cellNumber == 3)  {
            return NSLocalizedString(@"4. Langdell, Lamont, or Widener? ", nil);
        } else if ((int)cellNumber == 4)  {
            return NSLocalizedString(@"5. Have you noticed the “young lady”-“young man” newspaper salesman in Harvard Square? ", nil);
        } else if ((int)cellNumber == 5)  {
            return NSLocalizedString(@"6. Did you do some form of exercise in the past four days?", nil);
        } else if ((int)cellNumber == 6)  {
            return NSLocalizedString(@"7. When is the last time you got drunk? ", nil);
        } else if ((int)cellNumber == 7)  {
            return NSLocalizedString(@"8. On a scale of 0 to 10, 10 being extremely shy and 0 being not shy at all, how shy are you? ", nil);
        } else if ((int)cellNumber == 8)  {
            return NSLocalizedString(@"9. Hong Kong or Yenching? ", nil);
        } else if ((int)cellNumber == 9)  {
            return NSLocalizedString(@"10. How much does physical attractiveness matter in a match?", nil);
        } else if ((int)cellNumber == 10)  {
            return NSLocalizedString(@"11. Have you ever lived in the graduate student residence halls? ", nil);
        } else if ((int)cellNumber == 11)  {
            return NSLocalizedString(@"12. Would you prefer your partner to be more or less sexually experienced than you? ", nil);
        } else if ((int)cellNumber == 12)  {
            return NSLocalizedString(@"13. Would you prefer to date someone in the hard sciences or humanities? ", nil);
        } else if ((int)cellNumber == 13)  {
            return NSLocalizedString(@"14. Do you like the taste of beer?", nil);
        } else if ((int)cellNumber == 14)  {
            return NSLocalizedString(@"15. What hair color do you prefer?", nil);
        } else if ((int)cellNumber == 15)  {
            return NSLocalizedString(@"16. How many inches taller or shorter than you is your ideal partner?", nil);
        } else if ((int)cellNumber == 16)  {
            return NSLocalizedString(@"17. Do you think that in general, men and women can be close friends without any romantic feelings developing?", nil);
        } else if ((int)cellNumber == 17)  {
            return NSLocalizedString(@"18. How important is it that you be able to engage in intellectual discussions with your partner?", nil);
        } else if ((int)cellNumber == 18)  {
            return NSLocalizedString(@"19. Assuming a relationship is going well, how long does it take before sex happens?", nil);
        } else if ((int)cellNumber == 19)  {
            return NSLocalizedString(@"20. Does arguing with your partner arouse you?", nil);
        } else if ((int)cellNumber == 20)  {
            return NSLocalizedString(@"21. The distribution of income and wealth in the US is primarily a function of: ", nil);
        } else if ((int)cellNumber == 21)  {
            return NSLocalizedString(@"22. I am more interested in working in: ", nil);
        } else if ((int)cellNumber == 22)  {
            return NSLocalizedString(@"23. Would you like to be married within the next five years?", nil);
        } else if ((int)cellNumber == 23)  {
            return NSLocalizedString(@"24. If your partner is overweight, is that:", nil);
        } else if ((int)cellNumber == 24)  {
            return NSLocalizedString(@"25. How often do you go to Boston? ", nil);
        } else if ((int)cellNumber == 25)  {
            return NSLocalizedString(@"26. On economic issues, do you wish the Obama administration was more the right, more to the left, or right where it is?", nil);
        } else if ((int)cellNumber == 26)  {
            return NSLocalizedString(@"27. In a serious relationship would you contact your partner everyday?", nil);
        } else if ((int)cellNumber == 27)  {
            return NSLocalizedString(@"28. Which character flows annoy you most?", nil);
        } else if ((int)cellNumber == 28)  {
            return NSLocalizedString(@"29. In terms of race, would you prefer dating someone with a similar or different racial background to yours?", nil);
        } else if ((int)cellNumber == 29)  {
            return NSLocalizedString(@"30. Would you want for there to be an afterlife where everyone would be rewarded for good acts and punished for bad acts, in proportion?", nil);
        } else if ((int)cellNumber == 30)  {
            return NSLocalizedString(@"31. How many children do you want to have?", nil);
        } else if ((int)cellNumber == 31)  {
            return NSLocalizedString(@"32. Are you intense or go-with-the-flow?", nil);
        } else if ((int)cellNumber == 32)  {
            return NSLocalizedString(@"33. Is commitment or passion more important in a relationship?", nil);
        } else if ((int)cellNumber == 33)  {
            return NSLocalizedString(@"34. How long do you want your next relationship to last? ", nil);
        } else if ((int)cellNumber == 34)  {
            return NSLocalizedString(@"35. How excited are you abou the prospect of a blind, 30 minute date? ", nil);
        } else if ((int)cellNumber == 35)  {
            return NSLocalizedString(@"Done ", nil);
        } else {
            return nil;
        }
    }
}

- (IBAction)segValChanged:(id)sender {
    [self segmentedControllChanged:sender];
}

- (void)segmentedControllChanged:(UISegmentedControl*)segmentedControl
{

    if (segmentedControl.selectedSegmentIndex == 0)
    {
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationRight];
    }
    else if (segmentedControl.selectedSegmentIndex == 1)
    {
        if (actualSegmentedIndex==0){
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationLeft];
        } else if (actualSegmentedIndex==2){
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationRight];
        }
    }
    else
    {
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationLeft];
    }
    actualSegmentedIndex = segmentedControl.selectedSegmentIndex;
}


+ (CGFloat)heightForCellWithContentString:(NSString *)content cellInsetWidth:(CGFloat)cellInset {
    CGFloat horizontalTextSpace = [TableViewCell horizontalTextSpaceForInsetWidth:cellInset];
    
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
    NSString *contentString = [TableView stringForCellNumber:indexPath.row tab:segControl.selectedSegmentIndex];
    
    return [TableView heightForCellWithContentString:contentString cellInsetWidth:0.0f];
    //return 70.0;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"questionsDetail"]) {
        
        // Get destination view
        DetailsViewController *vc = [segue destinationViewController];
        
        // Pass the information to your destination view
        [vc setQuestionNumber:[NSNumber numberWithInteger:[self.tableView indexPathForSelectedRow].row]];
        [vc setTabNumber:[NSNumber numberWithInteger:segControl.selectedSegmentIndex]];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 35){
        [self performSegueWithIdentifier:@"questionsToMain" sender:self];
        
        dispatch_queue_t parseQueue = dispatch_queue_create("Parse Queue",NULL);
        dispatch_async(parseQueue, ^{
            // Perform long running process
            for (int i = 0 ; i<4;i++){
                for(int j = 0; j<[self numberOfRowsInSection:i]; j++){
                    NSString *tabQuestionNumbers =[NSString stringWithFormat:@"Tab %d Question %d", i,j];
                    NSMutableArray * cellsSelected = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionNumbers]];
                    [[PFUser currentUser] setObject:cellsSelected  forKey:[NSString stringWithFormat:@"Tab_%d_Question_%d", i, j]];
                    
                    if (i== 0 || i == 1){
                        if (j == 2 || j == 3){
                            for (int k = 1; k<3;k++){
                                NSString *tabQuestionNumbers =[NSString stringWithFormat:@"Tab %d Question %d Detail %d", i,j,k];
                                NSMutableArray * cellsSelected = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionNumbers]];
                                [[PFUser currentUser] setObject:cellsSelected  forKey:[NSString stringWithFormat:@"Tab_%d_Question_%d_Detail_%d", i, j,k]];
                            }

                        }
                    }
                }
                
            }
            
            [[PFUser currentUser] saveInBackground];
        });

        return;
    }
    [self performSegueWithIdentifier:@"questionsDetail" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBarHidden = NO;
    

    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBarHidden = NO;
    
    
    // Do any additional setup after loading the view.
}

@end
