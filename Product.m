//
//  Product.m
//  CurrencyConverter
//
//  Created by Ryan Papazoglou on 7/2/14.
//  Copyright (c) 2014 Ryan Papazoglou. All rights reserved.
//

#import "Product.h"

Product* secretProduct;

@implementation Product
@synthesize price;
@synthesize salesTax;
@synthesize percentOff;

+(Product*)theProduct{
    if (secretProduct == nil) {
        secretProduct = [[Product alloc]init];
    }
    
    return secretProduct;
}
-(Product*)initWithPrice:(NSNumber *)aPrice SalesTax:(NSNumber *)theTax percentDiscount:(NSNumber *)aDiscount
{
    self = [super init];
    if (self) {
        price = aPrice;
        salesTax = theTax;
        percentOff = aDiscount;
    }
    return self;
};

@end
