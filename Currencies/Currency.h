//
//  Currency.h
//  Currencies
//
//  Created by Bartłomiej Oziębło on 17.12.2013.
//  Copyright (c) 2013 Bartłomiej Oziębło. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject

@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSString *shortName;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSNumber *amount;
@property (nonatomic, strong) NSNumber *exchangeRate;

@end
