//
//  LookingForViewController.m
//  PerfectBinding
//
//  Created by Hikari Senju on 5/24/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//
#import <Parse/Parse.h>
#import "TableViewController.h"
#import "TableViewCell.h"
#import "DTableViewController.h"
#import "DDTableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

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
        return 39;}
    
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)configureCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell.textLabel setText:[TableViewController stringForCellNumber:indexPath.row tab:segControl.selectedSegmentIndex]];

}

#pragma mark - PAPActivityFeedViewController

+ (NSString *)stringForCellNumber:(NSInteger)cellNumber tab:(NSInteger)segInd{
    if (segInd == 0){
        if (cellNumber == 0) {
            return NSLocalizedString(@"1. Are you here for: ", nil);
        } else if ((int)cellNumber == 1)  {
            return NSLocalizedString(@"2. Would you like to be connected with people with whom you have mutual friends on Facebook?", nil);
        } else if ((int)cellNumber == 2)  {
            return NSLocalizedString(@"3. I would not like to be connected with people in the following departments", nil);
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
            return NSLocalizedString(@"5. Birthday: ", nil);
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
            return NSLocalizedString(@"1. In one to five words, what is the best compliment you’ve ever gotten?", nil);
        } else if ((int)cellNumber == 1)  {
            return NSLocalizedString(@"2. What would you say is the biggest challenge to meeting new people at Harvard or MIT? ", nil);
        } else if ((int)cellNumber == 2)  {
            return NSLocalizedString(@"3. What would you say is the biggest advantage of meeting a graduate student or alum here in Cambridge?", nil);
        } else if ((int)cellNumber == 3)  {
            return NSLocalizedString(@"4. It’s a perfect 68 degrees out and you want to spend some time on the Charles: do you go for a run, bike ride, or picnic?", nil);
        } else if ((int)cellNumber == 4)  {
            return NSLocalizedString(@"5. Do you tend to prefer spending time with people one-on-one, in small groups, or in large gatherings? ", nil);
        } else if ((int)cellNumber == 5)  {
            return NSLocalizedString(@"6. Have you noticed the “young lady”-“young man” newspaper salesman in Harvard Square?", nil);
        } else if ((int)cellNumber == 6)  {
            return NSLocalizedString(@"7. Do you prefer teaching or research, or both equally?", nil);
        } else if ((int)cellNumber == 7)  {
            return NSLocalizedString(@"8. Most people think that lying should generally be avoided. Which of the following statements against lying do you find most appealing?", nil);
        } else if ((int)cellNumber == 8)  {
            return NSLocalizedString(@"9.Which of the following words would your close friends most likely use to describe you? ", nil);
        } else if ((int)cellNumber == 9)  {
            return NSLocalizedString(@"10. Which of the following character traits do you value most in a friend? (Pick one)", nil);
        } else if ((int)cellNumber == 10)  {
            return NSLocalizedString(@"11. Berry Line, Pinkberry, or Yogurt Land? ", nil);
        } else if ((int)cellNumber == 11)  {
            return NSLocalizedString(@"12. Did you like the most recent horror film you saw? ", nil);
        } else if ((int)cellNumber == 12)  {
            return NSLocalizedString(@"13. While all important, which of the following benefits of a close friendship or being in relationship would you say you value the most?", nil);
        } else if ((int)cellNumber == 13)  {
            return NSLocalizedString(@"14. How often do you find yourself in conversations with strangers on the red line or an MBTA bus?", nil);
        } else if ((int)cellNumber == 14)  {
            return NSLocalizedString(@"15. Many people have friends who do not know each other. Do new friends that you make tend to fit in well with your other friends?", nil);
        } else if ((int)cellNumber == 15)  {
            return NSLocalizedString(@"15. Do you to tend to know reasonably well the family members of your very closest friends?", nil);
        } else if ((int)cellNumber == 16)  {
            return NSLocalizedString(@"17. To what extent do the opinions of family members affect some of the more important decisions you make in your life?", nil);
        } else if ((int)cellNumber == 17)  {
            return NSLocalizedString(@"18. Thinking about times in which you have found yourself talking about your close friends or loved ones to other people, do you feel that you tend to describe them:", nil);
        } else if ((int)cellNumber == 18)  {
            return NSLocalizedString(@"18. Among the following four negative attributes, pick two that are especially characteristic of a bad friend?", nil);
        } else if ((int)cellNumber == 19)  {
            return NSLocalizedString(@"20. Would you rather meet people with interests that are similar to yours or different than yours?", nil);
        } else if ((int)cellNumber == 20)  {
            return NSLocalizedString(@"21. Langdell (Law library), Lamont, or Widener?", nil);
        } else if ((int)cellNumber == 21)  {
            return NSLocalizedString(@"22. Hayden, Barker, or Rotch?", nil);
        } else if ((int)cellNumber == 22)  {
            return NSLocalizedString(@"23. How often do you enjoy going for a drink?", nil);
        } else if ((int)cellNumber == 23)  {
            return NSLocalizedString(@"24. Imagine that psychologists and engineers created a machine that induces whatever desirable experiences you could want. The experiences would be so real that they could not be distinguished from pleasures you experience outside the machine. Would you prefer this machine to real life?", nil);
        } else if ((int)cellNumber == 24)  {
            return NSLocalizedString(@"25. Have you ever traveled a country alone? ", nil);
        } else if ((int)cellNumber == 25)  {
            return NSLocalizedString(@"26. Do you or would you enjoy living in a residential/dorm setting, like the graduate student residence halls?", nil);
        } else if ((int)cellNumber == 26)  {
            return NSLocalizedString(@"27. Do you like to discuss political, economic, and/or cultural issues with your friends?", nil);
        } else if ((int)cellNumber == 27)  {
            return NSLocalizedString(@"28. Would you prefer to make new friends in the hard sciences or humanities?", nil);
        } else if ((int)cellNumber == 28)  {
            return NSLocalizedString(@"29. Does the idea of spending a year of your life on a sailboat sound appealing? ", nil);
        } else if ((int)cellNumber == 29)  {
            return NSLocalizedString(@"30. In general, do you tend to go to your friends or close ones with issues related to grad school or your personal life?", nil);
        } else if ((int)cellNumber == 30)  {
            return NSLocalizedString(@"31. What’s your favorite “Square” in Cambridge?", nil);
        } else if ((int)cellNumber == 31)  {
            return NSLocalizedString(@"32. Do you like the taste of beer?", nil);
        } else if ((int)cellNumber == 32)  {
            return NSLocalizedString(@"33. How religious/non-religious would you consider yourself?", nil);
        } else if ((int)cellNumber == 33)  {
            return NSLocalizedString(@"34. Irrespective of how you feel about it, how often do you see your close friends in Cambridge?", nil);
        } else if ((int)cellNumber == 34)  {
            return NSLocalizedString(@"35. Do you tend to plan most things in advance or do you go with the flow?", nil);
        } else if ((int)cellNumber == 35)  {
            return NSLocalizedString(@"36. If you had the choice as to whether there was an afterlife where everyone would be rewarded for good acts and punished for bad acts that they did, in proportion, would you want such a place to exist, assuming no other alternatives?", nil);
        } else if ((int)cellNumber == 36)  {
            return NSLocalizedString(@"37. How excited are you about the prospect of a 30 minute meet-up with a Harvard or MIT student? ", nil);
        }else if ((int)cellNumber == 37)  {
            return NSLocalizedString(@"38. In either technical or “fun” language, please describe what you study in one sentence.", nil);
        }else if ((int)cellNumber == 38)  {
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
    NSString *contentString = [TableViewController stringForCellNumber:indexPath.row tab:segControl.selectedSegmentIndex];
    
    return [TableViewController heightForCellWithContentString:contentString cellInsetWidth:0.0f];
    //return 70.0;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"questionsDetail"]) {
        
        // Get destination view
        DTableViewController *vc = [segue destinationViewController];
        
        // Pass the information to your destination view
        [vc setQuestionNumber:[NSNumber numberWithInteger:[self.tableView indexPathForSelectedRow].row]];
        [vc setTabNumber:[NSNumber numberWithInteger:segControl.selectedSegmentIndex]];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 38){
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
                            DTableViewController *dvcontroller = [DTableViewController alloc];
                            NSInteger dvnrows = [dvcontroller numberOfRowsInCurrentSection:i question:j];
                            for (int k = 1; k<dvnrows;k++){
                                NSString *tabQuestionNumbers =[NSString stringWithFormat:@"Tab %d Question %d Detail %d", i,j,k];
                                NSMutableArray * cellsSelected = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionNumbers]];
                                [[PFUser currentUser] setObject:cellsSelected  forKey:[NSString stringWithFormat:@"Tab_%d_Question_%d_Detail_%d", i, j,k]];
                                
                                if (i == 0){
                                    if (j == 3){
                                        if (k>11 && k!=15){
                                            DDTableViewController *ddtvcontroller = [DDTableViewController alloc];
                                            NSInteger ddtvnrows = [ddtvcontroller numberOfRowsInCurrentSection:i question:j detail:k];
                                            for (int l =1; l<ddtvnrows; l++){
                                                NSString *tabQuestionNumbers =[NSString stringWithFormat:@"Tab %d Question %d Detail %d DDD %d", i,j,k,l];
                                                NSMutableArray * cellsSelected = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:tabQuestionNumbers]];
                                                [[PFUser currentUser] setObject:cellsSelected  forKey:[NSString stringWithFormat:@"Tab_%d_Question_%d_Detail_%d_DDD_%d", i, j,k,l]];
                                            }
                                        }
                                    }
                                }
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
