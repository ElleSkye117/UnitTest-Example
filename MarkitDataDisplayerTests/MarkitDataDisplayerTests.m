//
//  MarkitDataDisplayerTests.m
//  MarkitDataDisplayerTests
//
//  Created by michael.leber on 1/21/14.
//  Copyright (c) 2014 Markit. All rights reserved.
//

#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>

@interface MarketSymbol : NSObject
@property (nonatomic, copy) NSString *symbolName;
@end
@interface MarketDisplayController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel *symbolNameLabel;

- (void)setSymbol:(MarketSymbol*)symbol;

@end

@implementation MarketDisplayController
- (void)setSymbol:(MarketSymbol*)symbol
{
    [self.symbolNameLabel setText:symbol.symbolName];
}

@end


SpecBegin(TestSpec)

// Descriptive name here self documents the code. People quickly know what it is testing and how it should behave
it(@"On first load, the symbol label view, should contain the name of the symbol", ^{
    // Set up in three parts
    // Arrange
    MarketDisplayController *controller = [[MarketDisplayController alloc] init];
    MarketSymbol *stubSymbol = [[MarketSymbol alloc] init];
    [stubSymbol setSymbolName:@".SYM"];
    
    [controller setSymbol:stubSymbol];
    
    // Act
    // Loads the view, basically simulates how iOS View controller architecture will access this.
    [controller view];
    
    // Assert
    // There should only one "expect" (or "verify" if using a mock object). If we need to check more, then we can have more "it()" cases for each.
    expect(controller.symbolNameLabel.text).to.equal(@".SYM");
});

SpecEnd
