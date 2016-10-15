//
//  NewUser.m
//  Pupper
//
//  Created by David E. Stern on 10/14/16.
//  Copyright © 2016 David Stern. All rights reserved.
//

#import "NewUser.h"
#import "ProfilePage.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface NewUser ()
@end

@implementation NewUser
@synthesize s;
@synthesize human;

bool animLock = false;
bool animLockS = false;

bool zoomedIn = false;

float zoomTime = .15f;
float swipeSpeed = .25f;



- (void)viewDidLoad {
    // Do any additional setup after loading the view from its nib.
    /* Populate array here */
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"ALLTHEINFO$"];
    s = [[Sockpuppet alloc] init];
    [s setup:@"http://10.244.140.122" port:5559];
    
    //10.244.140.122
    //5558
    UIImageView *cenL = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"final logo.png"]];
    cenL.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.navigationItem.titleView = cenL;
    [self.navigationItem.titleView setFrame:CGRectMake(103, 0, 32, 32)];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"mail-icon.png"] style:UIBarButtonItemStyleDone target:self action:@selector(nope)];
    
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];
    
   // self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"    " style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIButton* sex = [[UIButton alloc] initWithFrame:CGRectMake(220, 485, 70, 70)];
    [sex addTarget:self
            action:@selector(gettinLaid:) forControlEvents:UIControlEventTouchUpInside];
    //[sex setTitle:@"Yup" forState:UIControlStateNormal];
    [sex setBackgroundImage:[UIImage imageNamed:@"solid_paw.png"] forState:UIControlStateNormal];
     [sex setBackgroundColor:[UIColor colorWithHue:0.0 saturation:0.0 brightness:0.0 alpha:0.0]];//[UIColor blueColor]];
   
    UIButton* nah = [[UIButton alloc] initWithFrame:CGRectMake(40, 485, 70, 70)];
    [nah addTarget:self
            action:@selector(youUgly:) forControlEvents:UIControlEventTouchUpInside];
  //  [nah setTitle:@"nah" forState:UIControlStateNormal];
    [nah setBackgroundImage:[UIImage imageNamed:@"solid_poo.png"] forState:UIControlStateNormal];
    [nah setBackgroundColor:[UIColor colorWithHue:0.0 saturation:0.0 brightness:0.0 alpha:0.0]];
    
    UIButton* tmp = [[UIButton alloc] initWithFrame:CGRectMake(130, 485, 70, 70)];
    
    [tmp addTarget:self
            action:@selector(smallExpand) forControlEvents:UIControlEventTouchUpInside];
//    [tmp setTitle:@"info" forState:UIControlStateNormal];
    [tmp setBackgroundImage:[UIImage imageNamed:@"solid_info.png"] forState:UIControlStateNormal];
    [tmp setBackgroundColor:[UIColor colorWithHue:0.0 saturation:0.0 brightness:0.0 alpha:0.0]];
    
    UISwipeGestureRecognizer* right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gettinLaid:)];
    [right setDirection:UISwipeGestureRecognizerDirectionRight];
    
    UISwipeGestureRecognizer* left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(youUgly:)];
    [left setDirection:UISwipeGestureRecognizerDirectionLeft];

    
    [self.view addGestureRecognizer:right];
    [self.view addGestureRecognizer:left];
    [self.view addSubview:sex];
    [self.view addSubview:nah];
    [self.view addSubview:tmp];
    [s writeOut:[NSString stringWithFormat:@"%d\n", human]];
    [super viewDidLoad];

}

-(void)nope{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Sorry!"
                                          message:@"Due to time constraints, messaging has not been implemented.  Check back later!"
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


- (void) goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)gettinLaid:(id)sender {
    NSLog(@"you ugly bitch");
    if ([self.view.subviews lastObject].tag == 99) {
        [self animateView:[self.view.subviews lastObject] rect:CGRectMake(500,250 , 150, 150) rotation:45.0f duration:swipeSpeed delay:0.0];
    }
}
- (void)youUgly:(id)sender {
    NSLog(@"Please yes\n");
    if ([self.view.subviews lastObject].tag == 99) {
        [self animateView:[self.view.subviews lastObject] rect:CGRectMake(-500,250 , 150, 150) rotation:-45.0f duration:swipeSpeed delay:0.0];
    }
}

-(void) killSubview:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    [[self.view.subviews lastObject] removeFromSuperview];
    NSMutableArray* Dicts = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ALLTHEINFO$"] mutableCopy];
    [Dicts removeLastObject];
    [[NSUserDefaults standardUserDefaults] setObject:Dicts forKey:@"ALLTHEINFO$"];
    
    if ([self.view.subviews lastObject].tag != 99){
        [s writeOut:[NSString stringWithFormat:@"%d\n", human]];
    }
    animLock = false;
    zoomedIn = false;
}

- (void) animateView:(UIView*)view rect:(CGRect)rect rotation:(float)rotation duration:(float)duration delay:(float)delay{
    if (animLock == false){
        animLock = true;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationDelay:delay];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDidStopSelector:@selector(killSubview:finished:context:)];
        view.transform = CGAffineTransformMakeRotation((rotation * M_PI) / 180.0f);;
        view.frame = rect;
        view.alpha = 0.15f;
        
        [UIView commitAnimations];
    }
    
}
+ (void) undoLock{
    NSLog(@"HERE");
    animLockS = false;

    
}
+ (void) animateViewS:(UIView*)view rect:(CGRect)rect rotation:(float)rotation duration:(float)duration delay:(float)delay alpha:(float)alpha{
    if (animLockS == false){
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationDelay:delay];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDidStopSelector:@selector(undoLock)];
        view.transform = CGAffineTransformMakeRotation((rotation * M_PI) / 180.0f);;
        view.frame = rect;
        view.alpha = alpha;
        [UIView commitAnimations];
    }
}

-(void)smallExpand{
    UINavigationController *nv = [UIApplication sharedApplication].keyWindow.rootViewController;

    [NewUser zoomAnim:[[nv topViewController].view.subviews lastObject]];
    
}

+(void)zoomAnim:(UIView *)view{
    
    if (zoomedIn == false && animLockS == false){
        
        NSDictionary* Dict = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ALLTHEINFO$"] lastObject];
        NSLog(@"dict: %@\n",Dict);
        
        
        
        UIImageView *frame = (UIImageView *)[[view subviews] firstObject];
        
        UIImageView *profile = (UIImageView *)[[view subviews] objectAtIndex:1];
        
        UILabel *label = (UILabel *)[[view subviews] objectAtIndex:2];
        
        zoomedIn = true;
        [NewUser animateViewS:view rect:CGRectMake(0, 65, 600, 350) rotation:0.0f duration:zoomTime delay:0.0f alpha:1.0f];
        [NewUser animateViewS:frame rect:CGRectMake(15, 15, 295, 350) rotation:0.0f duration:zoomTime delay:0.0f alpha:1.0f];
        [NewUser animateViewS:profile rect:CGRectMake(80, 40, 150, 150) rotation:0.0f duration:zoomTime delay:0.0f alpha:1.0f];
        [NewUser animateViewS:label rect:CGRectMake(50, 190, 255, 50) rotation:0.0f duration:zoomTime delay:0.0f alpha:1.0f];
        animLockS = true;
        UILabel* lbl = [[UILabel alloc] initWithFrame:CGRectMake(30, 240, 300, 20)];
        lbl.text = [NSString stringWithFormat:@"Description: %@", [Dict objectForKey:@"description"]];
        lbl.font = [UIFont fontWithName:@"Avenir" size:16];
        [view addSubview:lbl];
        //NSLog(@"why %@\n",[Dict objectForKey:@"walking"]);
        //NSLog(@"why2 %d\n",[[Dict objectForKey:@"sitting"] intValue]);
        
        if ([[Dict objectForKey:@"walking"] intValue] == 1){
            lbl = [[UILabel alloc] initWithFrame:CGRectMake(30, 265, 300, 20)];
            lbl.font = [UIFont fontWithName:@"Avenir" size:16];
            lbl.text = [NSString stringWithFormat:@"Needs to be walked: %@", [Dict objectForKey:@"w_frequency"]];
            [view addSubview:lbl];
        }
        else if([[Dict objectForKey:@"sitting"] intValue] == 1){
            lbl = [[UILabel alloc] initWithFrame:CGRectMake(30, 265, 300, 20)];
            lbl.font = [UIFont fontWithName:@"Avenir" size:16];
            lbl.text = [NSString stringWithFormat:@"Needs to be sat at %@", [Dict objectForKey:@"s_when"]];
            [view addSubview:lbl];
        }
        else {
            lbl = [[UILabel alloc] initWithFrame:CGRectMake(30, 265, 300, 20)];
            lbl.font = [UIFont fontWithName:@"Avenir" size:16];
            lbl.text = [NSString stringWithFormat:@"Prefers: %@", [Dict objectForKey:@"work_preference"]];
            [view addSubview:lbl];
        }
        
        
        
    }
    else if (zoomedIn == true && animLockS == false){
        
        UIImageView *frame = (UIImageView *)[[view subviews] firstObject];
        
        UIImageView *profile = (UIImageView *)[[view subviews] objectAtIndex:1];
        
        UILabel *label = (UILabel *)[[view subviews] objectAtIndex:2];
        [[[view subviews] lastObject] removeFromSuperview];
        [[[view subviews] lastObject] removeFromSuperview];
        
        zoomedIn = false;
        [NewUser animateViewS:view rect:CGRectMake(25, 100, 300, 350) rotation:0.0f duration:zoomTime delay:0.0f alpha:1.0f];
        [NewUser animateViewS:frame rect:CGRectMake(0, 0, 150, 200) rotation:0.0f duration:zoomTime delay:0.0f alpha:1.0f];
        [NewUser animateViewS:profile rect:CGRectMake(0, 0, 275, 275) rotation:0.0f duration:zoomTime delay:0.0f alpha:1.0f];
        [NewUser animateViewS:label rect:CGRectMake(0, 275, 255, 50) rotation:0.0f duration:zoomTime delay:0.0f alpha:1.0f];
        
    }
    
    
    
    NSLog(@"here i am\n");
}

+(void)expand:(id)sender{
    UITapGestureRecognizer *rec = (UITapGestureRecognizer*)sender;
    [NewUser zoomAnim:rec.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)pleaseHelpMe:(int)index{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(25, 100, 300, 350)];
    [view setBackgroundColor:[UIColor whiteColor]];
    [view setTag:99];
    NSDictionary* Dict = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ALLTHEINFO$"] objectAtIndex:index];
    NSLog(@"here is dict and number %@ %d\n",Dict, index);
    
    UIImageView* v = [[UIImageView alloc] init];//WithImage:[UIImage imageNamed:@"dogframe.png"]];
    [v setBackgroundColor:[UIColor whiteColor]];
    [view addSubview:v];

    UIImageView* profile = [[UIImageView alloc] init];
    [profile setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", [Dict objectForKey:@"id"]]]];
    [profile setFrame:CGRectMake(0, 0, 275, 275)];
    [view addSubview:profile];

    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 275, 255, 50)];
    if ([Dict objectForKey:@"type"] != NULL){
        label.text = [NSString stringWithFormat:@" %@      %@       Age: %@", [Dict objectForKey:@"name"],[Dict objectForKey:@"type"],[Dict objectForKey:@"age"]];
    }
    else{
        label.text = [NSString stringWithFormat:@" %@   Age: %@", [Dict objectForKey:@"name"],[Dict objectForKey:@"age"]];
    }
    label.font = [UIFont fontWithName:@"Avenir" size:16];
    [view addSubview:label];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(expand:)];
    [view addGestureRecognizer:tap];
    
    UINavigationController *nv = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    [[nv topViewController].view addSubview:view];
}

+ (void)nextProfile:(id)sender {
    NSError* e;
    NSString* string = (NSString*)sender;
    NSData* data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray* arrayOfDict = [[NSMutableArray alloc] init];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"ALLTHEINFO$"]) {
        arrayOfDict = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ALLTHEINFO$"] mutableCopy];
    }
    
    NSDictionary* jsonDict;
    
    jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
    [arrayOfDict addObject:jsonDict];
    [[NSUserDefaults standardUserDefaults] setObject:arrayOfDict forKey:@"ALLTHEINFO$"];
    [NewUser pleaseHelpMe:arrayOfDict.count - 1];
}

@end
