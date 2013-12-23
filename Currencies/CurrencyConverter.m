//
//  CurrencyConverter.m
//  Currencies
//
//  Created by Bartłomiej Oziębło on 13.12.2013.
//  Copyright (c) 2013 Bartłomiej Oziębło. All rights reserved.
//

#import "CurrencyConverter.h"

@interface CurrencyConverter ()

@end

@implementation CurrencyConverter

- (NSURLRequest *)createURLRequestForCurrencyConverting:(NSString *)base toCurrency:(NSString *)target inAmount:(double) amount
{
    NSString *query = [NSString stringWithFormat:@"http://currency-api.appspot.com/api/%@/%@.json?key=949658211aeefab5aa0915343f9c963421ada336&amount=%.2lf", base, target, amount];

    NSURLRequest *retURL = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:query]];
    return retURL;
}

- (Currency *) convertCurrency:(NSString *)base toCurrency:(NSString *)target inAmount:(double)amount
{
    if ([base isEqual:target]) {
        Currency *currency = [Currency new];
        currency.shortName = base;
        currency.exchangeRate = [NSNumber numberWithDouble:1.00];
        currency.amount = [NSNumber numberWithDouble:amount];
        
        return currency;
    } else {
        NSURLResponse *response = nil;
        NSError *error = nil;
    
        NSURLRequest *request = [self createURLRequestForCurrencyConverting:base toCurrency:target inAmount:amount];
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
        error = nil;
    
        NSDictionary *resultDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        Currency *currency = nil;
        if ([[resultDictionary objectForKey:@"success"] boolValue] == YES) {
            currency = [Currency new];
            currency.shortName = (NSString *) [resultDictionary objectForKey:@"target"];
            currency.exchangeRate = (NSNumber *) [resultDictionary objectForKey:@"rate"];
            currency.amount = (NSNumber *) [resultDictionary objectForKey:@"amount"];
        }
    
        return currency;
    }
    
    return nil;
}

@end
