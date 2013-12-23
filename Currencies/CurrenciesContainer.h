//
//  CurrenciesListContainer.h
//  Currencies
//
//  Created by Bartłomiej Oziębło on 13.12.2013.
//  Copyright (c) 2013 Bartłomiej Oziębło. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrenciesContainer : NSObject

@property (nonatomic, strong) NSDictionary *currenciesDictionary;
@property (nonatomic, strong) NSArray *currenciesFullNames;
@property (nonatomic, strong) NSArray *currenciesShortNames;
@property (nonatomic, strong) NSArray *currenciesSymbol;

+ (id) instance;

@end
