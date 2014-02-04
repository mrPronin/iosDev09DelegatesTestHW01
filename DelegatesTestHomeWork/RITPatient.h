//
//  RITPatient.h
//  DelegatesTest
//
//  Created by Pronin Alexander on 29.01.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    // flu simptoms
    RITSimptomsFever,
    RITSimptomsCough,
    RITSimptomsRunnyNose,
    RITSimptomsHeadAche,
    RITSimptomsFatigue,
    RITSimptomsAbdominalPain,
    RITSimptomsNausea,
    RITSimptomsTasteChange,
    RITSimptomsBloating,
    RITSimptomsLossOfAppetite,
    RITSimptomsWeightLoss,
    RITSimptomsDryMouth,
    RITSimptomsArrhythmia
} RITSimptoms;

@protocol RITPatientDelegate;

@interface RITPatient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat   temperature;
@property (weak, nonatomic) id <RITPatientDelegate> delegate;
@property (assign, nonatomic) NSSet* simptoms;

- (BOOL) howAreYou;
- (void) takePill;
- (void) makeShot;
- (void) becameWorse;
- (void) prepareForSurgery;
- (void) doUltrasound;
- (void) undergoMoreTests;

@end

@protocol RITPatientDelegate <NSObject>

- (void) patientFeelsBad:(RITPatient*) patient;
- (void) patient:(RITPatient*) patient hasQuestion:(NSString*) question;

@end
