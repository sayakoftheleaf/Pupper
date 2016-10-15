//
//  NewUser.h
//  Pupper
//
//  Created by David E. Stern on 10/14/16.
//  Copyright © 2016 David Stern. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Sockpuppet.h"
@interface NewUser : UIViewController 




+ (void)nextProfile:(id)sender;

@property int human;
@property (nonatomic, retain) NSMutableArray* pets;
@property (nonatomic, retain) Sockpuppet* s;

@end
