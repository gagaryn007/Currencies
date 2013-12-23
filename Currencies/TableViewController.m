//
//  TableViewController.m
//  Currencies
//
//  Created by Bartłomiej Oziębło on 13.12.2013.
//  Copyright (c) 2013 Bartłomiej Oziębło. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (nonatomic, weak) CurrenciesContainer *currenciesContainer;
@property (nonatomic, strong) CurrencyConverter *converter;
@property (nonatomic, strong) NSMutableArray *cellData;

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currenciesContainer = [CurrenciesContainer instance];
    self.navigationItem.title = self.baseCurrencySymbol;
    self.converter = [CurrencyConverter new];
    self.cellData = [[NSMutableArray alloc] init];
        
    for (NSString *currencyShortName in self.currenciesContainer.currenciesShortNames) {
        Currency *currency = [self.converter convertCurrency:self.baseCurrencySymbol toCurrency:currencyShortName inAmount:self.amount];
        if (currency != nil) {
            [self.cellData addObject:currency];
        } else {
            [self.cellData addObject:[NSNull null]];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.currenciesContainer.currenciesShortNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
    Currency *currency = [self.cellData objectAtIndex:indexPath.row];
    UILabel *ratioLabel =  (UILabel *)[cell viewWithTag:102];
    UILabel *amountLabel = (UILabel *) [cell viewWithTag:101];
    UILabel *symbolLabel = (UILabel *) [cell viewWithTag:100];
    
    if (![currency isEqual:[NSNull null]]) {
        [ratioLabel setText:[[NSString alloc] initWithFormat:@"%@ rate: %@", currency.shortName, currency.exchangeRate]];
        [amountLabel setText:[[NSString alloc] initWithFormat:@"%.2lf", [currency.amount doubleValue]]];
        [symbolLabel setText:[self.currenciesContainer.currenciesSymbol objectAtIndex:indexPath.row]];
    } else {
        ratioLabel.text = @"Error";
        amountLabel.text = @"Error";
        symbolLabel.text = @"E!";
    }
    
    return cell;
}

@end
