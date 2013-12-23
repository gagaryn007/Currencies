//
//  TableViewController.h
//  Currencies
//
//  Created by Bartłomiej Oziębło on 13.12.2013.
//  Copyright (c) 2013 Bartłomiej Oziębło. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrenciesContainer.h"
#import "CurrencyConverter.h"

@interface TableViewController : UITableViewController <UITableViewDataSource>

@property NSString *baseCurrencySymbol;
@property double amount;

@end
