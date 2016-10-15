//
//  ViewController.h
//  Pupper
//
//  Created by David E. Stern on 10/14/16.
//  Copyright © 2016 David Stern. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface ViewController : UIViewController <FBSDKLoginButtonDelegate>

- (void)loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
              error:(NSError *)error;
- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton;
- (BOOL) loginButtonWillLogin:(FBSDKLoginButton *)loginButton;

@property (weak, nonatomic) IBOutlet id<FBSDKLoginButtonDelegate> delegate;
@property (nonatomic, retain) IBOutlet FBSDKLoginButton *loginButton;


@end

