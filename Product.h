//
//  Product.h
//  CurrencyConverter
//
//  Created by Ryan Papazoglou on 7/2/14.
//  Copyright (c) 2014 Ryan Papazoglou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property(retain, nonatomic) NSNumber* price;
@property(retain, nonatomic) NSNumber* salesTax;
@property(retain, nonatomic) NSNumber* percentOff;

-(Product*)initWithPrice: (NSNumber*)aPrice SalesTax: (NSNumber*) theTax percentDiscount: (NSNumber*) aDiscount;


@end
