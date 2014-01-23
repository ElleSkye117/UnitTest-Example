//
//  ExampleSpec.m
//  ExampleSpec
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
@implementation MarketSymbol

@end
@interface MarketDisplayController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel *symbolNameLabel;
@property (nonatomic, strong) MarketSymbol *symbol;

- (void)setSymbol:(MarketSymbol*)symbol;

@end

@implementation MarketDisplayController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *newLabel = [[UILabel alloc] init];
    [self.view addSubview:newLabel];
    self.symbolNameLabel = newLabel;
    [self.symbolNameLabel setText:self.symbol.symbolName];
}


@end


SpecBegin(MarketDisplayController)

// Descriptive name here self documents the code. People quickly know what it is testing and how it should behave
it(@"On first display, the symbol label view, should contain the name of the symbol", ^{
    // Set up in three parts
    // Arrange
    MarketDisplayController *controller = [[MarketDisplayController alloc] init];
    MarketSymbol *stubSymbol = [[MarketSymbol alloc] init];
    [stubSymbol setSymbolName:@".SYM"];
    
    [controller setSymbol:stubSymbol];
    
    // Act
    // Loads the view. This simulates how iOS View controller architecture will load a UIViewController's view. This implicitly calls viewDidLoad, which is where the code will set up the label.
    [controller view];
    
    // Assert
    // There should only one "expect" (or "verify" if using a mock object). If we need to check more, then we can have more "it()" cases for each.
    expect(controller.symbolNameLabel.text).to.equal(@".SYM");
});

SpecEnd
