//
//  CurrenciesListContainer.m
//  Currencies
//
//  Created by Bartłomiej Oziębło on 13.12.2013.
//  Copyright (c) 2013 Bartłomiej Oziębło. All rights reserved.
//

#import "CurrenciesContainer.h"

@interface CurrenciesContainer ()

@end

@implementation CurrenciesContainer

#pragma mark - Initalization methods

- (id) init
{
    self = [super init];
    if (self != nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        
        NSString *symbolsResourcePath = [bundle pathForResource:@"symbols" ofType:@"plist"];
        NSString *shortNamesResourcePath = [bundle pathForResource:@"short_names" ofType:@"plist"];
        NSString *fullNamesResourcePath = [bundle pathForResource:@"full_names" ofType:@"plist"];
        
        self.currenciesSymbol = [[NSArray alloc] initWithContentsOfFile:symbolsResourcePath];
        self.currenciesShortNames = [[NSArray alloc] initWithContentsOfFile:shortNamesResourcePath];
        self.currenciesFullNames = [[NSArray alloc] initWithContentsOfFile:fullNamesResourcePath];
    }
    
    return self;
}

+ (id) instance
{
    static CurrenciesContainer *ret = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ret = [[self alloc] init];
    });
    
    return ret;
}

@end
