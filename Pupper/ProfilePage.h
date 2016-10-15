//
//  ProfilePage.h
//  Pupper
//
//  Created by David E. Stern on 10/15/16.
//  Copyright © 2016 David Stern. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfilePage : UIViewController{
@public
    NSString *name;
    NSString *description;
    NSString *age;
    
    NSString *experience;
    NSString *work_preference;
    
    NSString *w_frequency;
    NSString *s_when;
    bool walking;
    bool sitting;
    
    UILabel *nameL;
    UITextField *nameF;
    UILabel *descL;
    UITextField *descF;
    UILabel *ageL;
    UITextField *ageF;
    
    UILabel *expL;
    UITextField *expF;
    UILabel * wpL;
    UITextField *wpF;
    
    UILabel *wfL;
    UITextField *wfF;
    UILabel *swL;
    UITextField *swF;
    UILabel *wsL;
    UISwitch *wsF;
    UILabel *ssL;
    UISwitch *ssF;
    
    
    
}

- (void) update;

- (id) initWithSwitch:(int)s;

@end
