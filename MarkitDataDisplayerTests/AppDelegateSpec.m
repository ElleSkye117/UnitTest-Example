//
//  AppDelegateSpec.m
//  MarkitDataDisplayer
//
//  Created on 1/23/14.
//  Copyright (c) 2014 Markit. All rights reserved.
//

// Class under test
#import "AppDelegate.h"

// Class Collaboraters
// Import any classes the subject under test might use.
#import "MarkitQuoteViewController.h"

// Supporting and Test Frameworks
#import <Specta/Specta.h>

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>

// Uncomment the following to use OCMockito Mock Objects
//#define MOCKITO_SHORTHAND
//#import <OCMockito/OCMockito.h>
//#import <OCHamcrest/OCHamcrest.h>

SpecBegin(AppDelegate)

describe(@"AppDelegate", ^{
    it(@"On launch, the window should have the MarkitQuoteViewController as the rootViewController ", ^{
        // Arrange
        AppDelegate *appDelegate = [[AppDelegate alloc] init];
        
        // Act
        [appDelegate application:[UIApplication sharedApplication] didFinishLaunchingWithOptions:nil];
        
        // Assert
        expect(appDelegate.window.rootViewController).to.beKindOf([MarkitQuoteViewController class]);
    });
    it(@"On launch, the window should be made key and visible", ^{
        // Arrange
        AppDelegate *appDelegate = [[AppDelegate alloc] init];
        
        // Act
        [appDelegate application:[UIApplication sharedApplication] didFinishLaunchingWithOptions:nil];
        
        // Assert
        expect(appDelegate.window.isKeyWindow).to.beTruthy();
    });
});

SpecEnd
