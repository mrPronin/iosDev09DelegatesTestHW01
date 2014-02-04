//
//  RITAppDelegate.m
//  DelegatesTestHomeWork
//
//  Created by Aleksandr Pronin on 02.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import "RITAppDelegate.h"
#import "RITPatient.h"
#import "RITDoctor.h"

@implementation RITAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    RITPatient* patient01   = [[RITPatient alloc] init];
    patient01.name          = @"Viktor";
    patient01.temperature   = 36.5f;
    patient01.simptoms      = nil;
    
    RITPatient* patient02   = [[RITPatient alloc] init];
    patient02.name          = @"Oleg";
    patient02.temperature   = 39.2f;
    patient02.simptoms      = [NSSet setWithObjects:
                               @(RITSimptomsFever), @(RITSimptomsCough),
                               @(RITSimptomsRunnyNose), @(RITSimptomsHeadAche),
                               @(RITSimptomsFatigue),
                               nil
                               ];
    
    RITPatient* patient03   = [[RITPatient alloc] init];
    patient03.name          = @"Piter";
    patient03.temperature   = 36.3f;
    patient03.simptoms      = [NSSet setWithObjects:
                               @(RITSimptomsAbdominalPain),
                               nil
                               ];
    
    RITPatient* patient04   = [[RITPatient alloc] init];
    patient04.name          = @"Sveta";
    patient04.temperature   = 36.3f;
    patient04.simptoms      = [NSSet setWithObjects:
                               @(RITSimptomsNausea),
                               @(RITSimptomsTasteChange),
                               @(RITSimptomsBloating),
                               @(RITSimptomsHeadAche),
                               nil
                               ];
    
    RITPatient* patient05   = [[RITPatient alloc] init];
    patient05.name          = @"Olga";
    patient05.temperature   = 36.3f;
    patient05.simptoms      = [NSSet setWithObjects:
                               @(RITSimptomsDryMouth),
                               nil
                               ];
    
    RITDoctor*  doctor      = [[RITDoctor alloc] init];
    
    NSArray*    patients    = @[patient01, patient02, patient03, patient04, patient05];
    
    for (RITPatient* patient in patients) {
        patient.delegate = doctor;
    }
    
    [patients makeObjectsPerformSelector:@selector(becameWorse)];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
