//
//  ViewController.h
//  PerfectBinding
//
//  Created by Hikari Senju on 5/24/14.
//  Copyright (c) 2014 Hikari Senju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UIButton *facebookLogin;

-(BOOL) NSStringIsValidEmail:(NSString *)checkString;

@end
