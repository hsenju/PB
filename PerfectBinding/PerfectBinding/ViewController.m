//
//  ViewController.m
//  PerfectBinding
//
//  Created by Hikari Senju on 5/24/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//
#import <Parse/Parse.h>
#import "ViewController.h"
#import "TableView.h"
#import "HomeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([PFUser currentUser]) {
        [self performSegueWithIdentifier: @"loginToQuestions" sender: self];
        return;
    }
    
    self.email.placeholder = @"college email";
    [self.facebookLogin setBackgroundImage:[UIImage imageNamed:@"fb_button.png"] forState:UIControlStateNormal];
    [self.facebookLogin setBackgroundImage:[UIImage imageNamed:@"fb_button_pressed.png"] forState:UIControlStateSelected];
    self.navigationController.navigationBarHidden = YES;
    self.navigationItem.hidesBackButton = YES;
    self.facebookLogin.enabled = NO;
	// Do any additional setup after loading the view, typically from a nib.
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (IBAction)editingChanged:(id)sender {
    if ([self NSStringIsValidEmail:(self.email.text)]){
        self.facebookLogin.enabled = YES;
    }else {
        self.facebookLogin.enabled = NO;
    }
}

- (IBAction)loginButtonTouchHandler:(id)sender  {
    // The permissions requested from the user
    NSArray *permissionsArray = @[ @"public_profile", @"user_photos",@"user_friends"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        //[_activityIndicator stopAnimating]; // Hide loading indicator
        
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
            }
        } else /*if (user.isNew) */{
            NSLog(@"User with facebook signed up and logged in!");
            [self performSegueWithIdentifier: @"loginToQuestions" sender: self];
        /*} else {
            NSLog(@"User with facebook logged in!");
            [self performSegueWithIdentifier: @"LoginToMain" sender: self];*/
           
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
