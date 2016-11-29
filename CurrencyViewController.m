//
//  CurrencyViewController.m
//  CurrencyConverter
//
//  Created by Ryan Papazoglou on 7/10/14.
//  Copyright (c) 2014 Ryan Papazoglou. All rights reserved.
//

#import "CurrencyViewController.h"
#import "Product.h"
#import "RPViewController.h"
#import "ExchangeRate.h"
#import "ISO4217Currency.h"

@interface CurrencyViewController ()

@end

@implementation CurrencyViewController
@synthesize convertPriceTextField;
@synthesize picker;
@synthesize countryList;
@synthesize convertedCurrencyLabel;
@synthesize exchanges;
@synthesize currentExchangeRate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *countryNames = @[
                              @"Great Britain",
                              @"Germany",
                              @"Canada",
                              @"Columbia",
                              @"Kenya"
                              ];
    
    self.countryList = countryNames;
    self.picker.delegate = self;
    
    ExchangeRate* USDGBP = [[ExchangeRate alloc]initWithSourceCurrency:[ISO4217Currency unitedStatesCurrency] DestinationCurrency:[ISO4217Currency unitedKingdomCurrency]];
    ExchangeRate* USDEUR = [[ExchangeRate alloc]initWithSourceCurrency:[ISO4217Currency unitedStatesCurrency] DestinationCurrency:[ISO4217Currency germanyCurrency]];
    ExchangeRate* USDCOP = [[ExchangeRate alloc]initWithSourceCurrency:[ISO4217Currency unitedStatesCurrency] DestinationCurrency:[ISO4217Currency colombiaCurrency]];
    ExchangeRate* USDCAD = [[ExchangeRate alloc]initWithSourceCurrency:[ISO4217Currency unitedStatesCurrency] DestinationCurrency:[ISO4217Currency canadaCurrency]];
    ExchangeRate* USDKES = [[ExchangeRate alloc]initWithSourceCurrency:[ISO4217Currency unitedStatesCurrency] DestinationCurrency:[ISO4217Currency kenyaCurrency]];
    
    exchanges = [NSMutableArray arrayWithObjects:USDGBP, USDEUR, USDCOP, USDCAD, USDKES, nil];
    self.currentExchangeRate = exchanges[0];
    
}
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.exchanges count];
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSLog(@"The Country %@", [countryList objectAtIndex:row]);
    return [[exchanges objectAtIndex:row] destinationCurrency].country;
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.currentExchangeRate = exchanges[row];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)useFinalPriceButton:(id)sender {
    double displayedDiscount = ([self.itemViewTwo.price doubleValue]* [self.itemViewTwo.percentOff doubleValue]/100);
    double displayedDiscountPrice = [self.itemViewTwo.price doubleValue] - displayedDiscount;
    
    self.convertPriceTextField.text = [NSString stringWithFormat:@"%.2f", displayedDiscountPrice];
}
-(IBAction)convertButton:(id)sender {
    
    NSString *selectedCountry = [countryList objectAtIndex:[picker selectedRowInComponent:0]];
    convertedCurrencyLabel.text = [NSString stringWithFormat:@"%.2f", ([self.currentExchangeRate.rate floatValue] * [self.convertPriceTextField.text floatValue])];
    convertedCurrencyLabel.hidden = NO;
    [self clearKeyboard];
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self clearKeyboard];
}
-(void)clearKeyboard{
    [self.convertPriceTextField resignFirstResponder];
    [self.picker resignFirstResponder];
}
@end
