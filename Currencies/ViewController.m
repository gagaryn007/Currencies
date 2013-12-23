//
//  ViewController.m
//  Currencies
//
//  Created by Bartłomiej Oziębło on 13.12.2013.
//  Copyright (c) 2013 Bartłomiej Oziębło. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) CurrenciesContainer *currenciesContainer;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSString *pickerSymbol;
@property NSString *amount;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currenciesContainer = [CurrenciesContainer instance];
    self.pickerSymbol = @"EUR";
    self.amount = @"1";

    [self.textField setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    self.textField = nil;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.currenciesContainer.currenciesShortNames count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSMutableString *label = [[NSMutableString alloc] initWithString:[self.currenciesContainer.currenciesFullNames objectAtIndex:row]];
    [label appendString:@" ("];
    [label appendString:[self.currenciesContainer.currenciesShortNames objectAtIndex:row]];
    [label appendString:@")"];

    return label;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.pickerSymbol = self.currenciesContainer.currenciesShortNames[row];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([self.textField.text length] > 0) {
        self.amount = self.textField.text;
    } else {
        self.amount = @"1";
    }
    
    TableViewController *targetController = [segue destinationViewController];
    targetController.baseCurrencySymbol = self.pickerSymbol;
    targetController.amount = [self.amount doubleValue];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end






