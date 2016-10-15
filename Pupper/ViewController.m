//
//  ViewController.m
//  Pupper
//
//  Created by David E. Stern on 10/14/16.
//  Copyright © 2016 David Stern. All rights reserved.
//

#import "ViewController.h"
#import "NewUser.h"
#import "Choice.h"

@interface ViewController ()

@end
bool twit = false;


@implementation ViewController
@synthesize loginButton;
- (void)viewDidLoad {

    loginButton = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
    loginButton.center = CGPointMake(self.view.center.x, self.view.center.x + 350);
    loginButton.delegate = self;
    [self.view addSubview:loginButton];
    [super viewDidLoad];
    if ([FBSDKAccessToken currentAccessToken]) {
        [self newUser:self];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}

- (BOOL) loginButtonWillLogin:(FBSDKLoginButton *)loginButton {
    return true;
}

- (void)loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
              error:(NSError *)error {
    if (error) {
        NSLog(@"error %@\n",error);
    }
    else if (result.isCancelled){}
        //[self.navigationController popViewControllerAnimated:YES];
    else {
        Choice* aController=[[Choice alloc] init];//WithNibName:@"NewUser" bundle:nil];
        [self.navigationController pushViewController:aController animated:YES];
        NSLog(@"Am I here?\n");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    if ([FBSDKAccessToken currentAccessToken]) {
        [self newUser:self];
    }
    else {
        if (twit == true){
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Uh..."
                                                  message:@"No you didn't, you twit."
                                                  preferredStyle:UIAlertControllerStyleAlert];
                   //  add buttons
                UIAlertAction *cancelAction = [UIAlertAction
                                               actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                               style:UIAlertActionStyleCancel
                                               handler:^(UIAlertAction *action)
                                               {
                                                   
                                               }];
                
                UIAlertAction *okAction = [UIAlertAction
                                           actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction *action)
                                           {
                                               
                                           }];
                
                [alertController addAction:cancelAction];
                [alertController addAction:okAction];
                [self presentViewController: alertController animated:YES completion:nil];
        }
        else{
            [self newUser:self];
        }
    }
}

- (IBAction)newUser:(id)sender {
    Choice* aController=[[Choice alloc] init];//WithNibName:@"NewUser" bundle:nil];
    [self.navigationController pushViewController:aController animated:YES];
    NSLog(@"Am I here?\n");
}

@end
