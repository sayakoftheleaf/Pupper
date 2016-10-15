//
//  AppDelegate.h
//  Pupper
//
//  Created by David E. Stern on 10/14/16.
//  Copyright © 2016 David Stern. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *rootViewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

