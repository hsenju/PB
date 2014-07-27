//
//  HomeViewController.m
//  PerfectBinding
//
//  Created by Hikari Senju on 5/24/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//
#import <Parse/Parse.h>
#import "HomeViewController.h"
#import "TableViewController.h"

@interface HomeViewController (){
    NSMutableData *_imagedata;
}

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)didswipe:(UIGestureRecognizer*)recognizer {
    self.view.UserInteractionEnabled = NO;
    [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:1] animated:YES];
    
    //[self performSegueWithIdentifier:@"segueQuestions" sender:self];
    
}

//- (IBAction)questionbtn:(id)sender {
//    [self performSegueWithIdentifier:@"unwind" sender:self];
//}
//
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    if ([[PFUser currentUser] objectForKey:@"Matched"]){
        self.overView.hidden = TRUE;
        self.weekly.text = @"Weekly Meetup";
        self.description.text= [[PFUser currentUser] objectForKey:@"Meetup_Description"];
        self.date.text = [[PFUser currentUser] objectForKey:@"Meetup_Date"];
        self.location.text = [[PFUser currentUser] objectForKey:@"Meetup_Location"];
    }else {
        self.overView.hidden = FALSE;
        self.weekly.text = @"";
        self.description.text= @"";
        self.date.text = @"";
        self.location.text = @"";
    }
    
    self.view.UserInteractionEnabled = YES;
    
    UISwipeGestureRecognizer* swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didswipe:)];
    swipeUpGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeUpGestureRecognizer];

    dispatch_queue_t parseQueue = dispatch_queue_create("Parse Queue",NULL);
    dispatch_async(parseQueue, ^{
        [[PFInstallation currentInstallation] setObject:[PFUser currentUser] forKey:@"user"];
        [[PFInstallation currentInstallation] saveEventually];
        if (![PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
            [PFFacebookUtils linkUser:[PFUser currentUser] permissions:nil block:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    FBRequest *request = [FBRequest requestForMe];
                    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                        if (!error) {
                            NSDictionary *userData = (NSDictionary *)result;
                            NSString *facebookID = userData[@"id"];
                            NSString *name = userData[@"name"];
                            _imagedata = [[NSMutableData alloc] init];
                            NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
                            NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:pictureURL
                                                                                      cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                                                  timeoutInterval:2.0f];
                            [NSURLConnection connectionWithRequest:urlRequest delegate:self];
                            [[PFUser currentUser] setObject:facebookID forKey:@"facebookid"];
                            [[PFUser currentUser] setObject:name forKey:@"fullname"];
                            [[PFUser currentUser] saveInBackground];
                        }
                    }];
                }
            }];
        }
        else{
            //if the user has already connected to facebook, download their profile picture because they might have changed it.
            NSURL *profilePictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", [[PFUser currentUser] objectForKey:@"facebookid"]]];
            NSURLRequest *profilePictureURLRequest = [NSURLRequest requestWithURL:profilePictureURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
            [NSURLConnection connectionWithRequest:profilePictureURLRequest delegate:self];
        }
    });
    
    // Do any additional setup after loading the view.
}

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // receive image data from facebook
    _imagedata = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // append the image data from facebook to our current version of the image data
    [_imagedata appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // once the facebook profile image has finished loading, save the image to parse.
    UIImage *image = [UIImage imageWithData:_imagedata];
    NSData *mediumImageData = UIImageJPEGRepresentation(image, 1.0);
    PFFile *fileMediumImage = [PFFile fileWithData:mediumImageData];
    [fileMediumImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [[PFUser currentUser] setObject:fileMediumImage forKey:@"picture"];
            [[PFUser currentUser] saveInBackground];
        }
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
