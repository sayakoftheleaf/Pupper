//
//  Choice.m
//  Pupper
//
//  Created by David E. Stern on 10/15/16.
//  Copyright © 2016 David Stern. All rights reserved.
//
#import "NewUser.h"
#import "Choice.h"
#import "ProfilePage.h"

@interface Choice ()

@end

@implementation Choice

ProfilePage *aController;

- (void)viewDidLoad {
    aController = [[ProfilePage alloc]initWithSwitch:0];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 300, 30)];
    [label setText:@"Are you a walker or a pet?"];
    label.font = [UIFont fontWithName:@"Avenir" size:24];
    
    
    
    UIButton* human = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 70, 50)];
    UIButton* doggo = [[UIButton alloc] initWithFrame:CGRectMake(200,250,70,50)];
    
    [human addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [doggo addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [human setBackgroundImage:[UIImage imageNamed:@"walker.png"] forState:UIControlStateNormal];
   // [human setTitle:@"Human" forState:UIControlStateNormal];
    [doggo setBackgroundImage:[UIImage imageNamed:@"noun_364.png"] forState:UIControlStateNormal];
   // [doggo setTitle:@"Pet" forState:UIControlStateNormal];
    
    //[human setBackgroundColor:[UIColor blueColor]];
    //[doggo setBackgroundColor:[UIColor blueColor]];
    
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(238, 450, 75, 32)];
    [lbl setText:@"Profile:"];
    
    UIButton* profB = [[UIButton alloc] initWithFrame:CGRectMake(250,475,32,32)];

    [profB addTarget:self action:@selector(pushProfile) forControlEvents:UIControlEventTouchUpInside];
    //[profB setTitle:@"profile" forState:UIControlStateNormal];
    [profB setBackgroundImage:[UIImage imageNamed:@"usr.png"] forState:UIControlStateNormal];
    //[profB setBackgroundColor:[UIColor blueColor]];
    
    [self.view addSubview:lbl];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:label];
    [self.view addSubview:human];
    [self.view addSubview:doggo];
    [self.view addSubview:profB];

    // Do any additional setup after loading the view.
}
- (void) goBack{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)pushProfile{
    [aController update];
    [self.navigationController pushViewController:aController animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonPressed:(id)sender{
    NewUser* aController=[[NewUser alloc] initWithNibName:@"NewUser" bundle:nil];
    UIButton *b = (UIButton*)sender;
    if ([b.currentTitle isEqual:@"Pet"]){
        aController.human = 1;
    }	
    else{
        aController.human = 0;
    }
    [self.navigationController pushViewController:aController animated:YES];
    NSLog(@"Am I here?\n");
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
