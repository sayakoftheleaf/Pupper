//
//  ProfilePage.m
//  Pupper
//
//  Created by David E. Stern on 10/15/16.
//  Copyright © 2016 David Stern. All rights reserved.
//

#import "ProfilePage.h"

@interface ProfilePage ()

@end
int human;
@implementation ProfilePage
- (id) initWithSwitch:(int)s{
    human = s;
    
    return [super init];
}


- (void)pushData{
    name = nameF.text;
    age = ageF.text;
    description = descF.text;
    
    if (human == 0){
        experience = expF.text;
        work_preference = wpF.text;
    }
    else{
        walking = wsF.on;
        sitting = ssF.on;
        w_frequency = wfF.text;
        s_when = swF.text;
    }
}

- (void) update{
    nameF.text = name;
    ageF.text = age;
    description = descF.text;
    if (human == 0){
        expF.text = experience;
        wpF.text = work_preference;
    }
    else{
        wsF.on = walking;
        ssF.on = sitting;
        wfF.text = w_frequency;
        swF.text = s_when;
    }
    
}

- (void) goBack{
    [self pushData];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    nameL = [[UILabel alloc]initWithFrame:CGRectMake(25, 75, 50, 30)];
    [nameL setText:@"Name:"];
    nameF = [[UITextField alloc]initWithFrame:CGRectMake(85, 75, 100, 30)];
    [nameF setUserInteractionEnabled:true];
    nameF.borderStyle = UITextBorderStyleRoundedRect;
    
    ageL = [[UILabel alloc]initWithFrame:CGRectMake(25, 115, 50, 30)];
    [ageL setText:@"Age:"];
    ageF = [[UITextField alloc]initWithFrame:CGRectMake(85, 115, 50, 30)];
    [ageF setUserInteractionEnabled:true];
    ageF.borderStyle = UITextBorderStyleRoundedRect;
    
    
    descL = [[UILabel alloc]initWithFrame:CGRectMake(25, 155, 100, 30)];
    [descL setText:@"Description:"];
    descF = [[UITextField alloc]initWithFrame:CGRectMake(125, 155, 175, 30)];
    [descF setUserInteractionEnabled:true];
    descF.borderStyle = UITextBorderStyleRoundedRect;
    
    
    [self.view addSubview:nameL];
    [self.view addSubview:nameF];
    [self.view addSubview:ageL];
    [self.view addSubview:ageF];
    [self.view addSubview:descL];
    [self.view addSubview:descF];
    
    if (human == 0){
        expL = [[UILabel alloc]initWithFrame:CGRectMake(25, 195, 115, 30)];
        [expL setText:@"Experience:"];
        expF = [[UITextField alloc]initWithFrame:CGRectMake(125, 195, 175, 30)];
        [expF setUserInteractionEnabled:true];
        expF.borderStyle = UITextBorderStyleRoundedRect;
        
        wpL = [[UILabel alloc]initWithFrame:CGRectMake(25, 235, 115, 30)];
        [wpL setText:@"Preference:"];
        wpF = [[UITextField alloc]initWithFrame:CGRectMake(125, 235, 175, 30)];
        [wpF setUserInteractionEnabled:true];
        wpF.borderStyle = UITextBorderStyleRoundedRect;
        
        
        [self.view addSubview:wsF];
        [self.view addSubview:expL];
        [self.view addSubview:expF];
        [self.view addSubview:wpL];
        [self.view addSubview:wpF];
    }
    else{
        float trueoff = 30;
        wsL = [[UILabel alloc]initWithFrame:CGRectMake(25, 195 + trueoff, 115, 30)];
        [wsL setText:@"Walking:"];
        wsF = [[UISwitch alloc]initWithFrame:CGRectMake(125, 195 + trueoff, 115, 30)];
        
        wfL = [[UILabel alloc]initWithFrame:CGRectMake(25, 235 + trueoff, 115, 30)];
        [wfL setText:@"Walking Freq.:"];
        wfF = [[UITextField alloc]initWithFrame:CGRectMake(135, 235 + trueoff, 175, 30)];
        [wfF setUserInteractionEnabled:true];
        wfF.borderStyle = UITextBorderStyleRoundedRect;

        float sitoff = 20;
        
        ssL = [[UILabel alloc]initWithFrame:CGRectMake(25, 285 + trueoff + sitoff, 115, 30)];
        [ssL setText:@"Sitting:"];
        ssF = [[UISwitch alloc]initWithFrame:CGRectMake(125, 285 + trueoff + sitoff, 115, 30)];
        
        swL = [[UILabel alloc]initWithFrame:CGRectMake(25, 325 + trueoff + sitoff, 115, 30)];
        [swL setText:@"Sitting Freq.:"];
        swF = [[UITextField alloc]initWithFrame:CGRectMake(135, 325 + trueoff + sitoff, 175, 30)];
        [swF setUserInteractionEnabled:true];
        swF.borderStyle = UITextBorderStyleRoundedRect;
        
        
        [self.view addSubview:wfL];
        [self.view addSubview:wfF];
        [self.view addSubview:wsL];
        [self.view addSubview:wsF];
        [self.view addSubview:ssL];
        [self.view addSubview:ssF];
        [self.view addSubview:swL];
        [self.view addSubview:swF];
        
    }
    
    
    /*UITextField *descF;
     
    
    
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
    */
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
