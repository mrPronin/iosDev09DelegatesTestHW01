//
//  RITDoctor.m
//  DelegatesTest
//
//  Created by Pronin Alexander on 29.01.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITDoctor.h"

@implementation RITDoctor

#pragma mark - RITPatientDelegate

- (void) patientFeelsBad:(RITPatient*) patient {
    
    NSLog(@"Patient %@ fells bad", patient.name);
    
    NSSet*  fluSimptoms = [NSSet setWithObjects:
                           @(RITSimptomsFever),
                           @(RITSimptomsCough),
                           @(RITSimptomsRunnyNose),
                           @(RITSimptomsHeadAche),
                           @(RITSimptomsFatigue),
                           nil
                           ];
    
    NSSet*  appendicitisSimptoms = [NSSet setWithObjects:
                           @(RITSimptomsAbdominalPain),
                           nil
                           ];
    
    NSSet*  pregnancySimptoms = [NSSet setWithObjects:
                           @(RITSimptomsNausea),
                           @(RITSimptomsTasteChange),
                           @(RITSimptomsBloating),
                           @(RITSimptomsHeadAche),
                           nil
                           ];
    // diagnose flu
    if (patient.temperature >= 36.5f &&
        [fluSimptoms isSubsetOfSet:patient.simptoms])
    {
        
        // treat flu
        NSLog(@"Patient %@ diagnosed flu", patient.name);
        [patient takePill];
        
    } else if (
        [appendicitisSimptoms isSubsetOfSet:patient.simptoms]) {
        
        // prepare for surgery
        NSLog(@"Patient %@ diagnosed appendicitis", patient.name);
        [patient prepareForSurgery];
        
    } else if ([pregnancySimptoms isSubsetOfSet:patient.simptoms]) {
        
        // do ultrasound
        NSLog(@"Patient %@ diagnosed pregnancy", patient.name);
        [patient doUltrasound];
        
    } else {
        
        // pass tests
        [patient undergoMoreTests];
    }
    
    NSLog(@"\n");
    
    /*
    if (patient.temperature >=  37.f && patient.temperature <= 39.f) {
        [patient takePill];
    } else if (patient.temperature > 39.f) {
        [patient makeShot];
    } else {
        NSLog(@"Patient %@ should rest", patient.name);
    }
    */
}

- (void) patient:(RITPatient*) patient hasQuestion:(NSString*) question {
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}
 
@end
