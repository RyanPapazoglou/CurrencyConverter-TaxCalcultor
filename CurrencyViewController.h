//
//  CurrencyViewController.h
//  CurrencyConverter
//
//  Created by Ryan Papazoglou on 7/10/14.
//  Copyright (c) 2014 Ryan Papazoglou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "ExchangeRate.h"
#import "ISO4217Currency.h"

@interface CurrencyViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

- (IBAction)useFinalPriceButton:(id)sender;
- (IBAction)convertButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *convertPriceTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (retain, nonatomic) NSArray *countryList;
@property (strong, nonatomic) Product* itemViewTwo;
@property (weak, nonatomic) IBOutlet UILabel *convertedCurrencyLabel;
@property (retain, nonatomic) NSMutableArray *exchanges;
@property (retain, nonatomic) ExchangeRate* currentExchangeRate;


@end
