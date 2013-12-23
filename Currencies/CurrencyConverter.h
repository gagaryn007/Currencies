//
//  CurrencyConverter.h
//  Currencies
//
//  Created by Bartłomiej Oziębło on 13.12.2013.
//  Copyright (c) 2013 Bartłomiej Oziębło. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currency.h"

@interface CurrencyConverter : NSObject <NSURLConnectionDataDelegate>

- (Currency *) convertCurrency:(NSString *)base toCurrency:(NSString *)target inAmount:(double)amount;

@end
