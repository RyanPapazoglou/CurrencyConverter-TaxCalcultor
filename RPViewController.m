//
//  RPViewController.m
//  CurrencyConverter
//
//  Created by Ryan Papazoglou on 7/2/14.
//  Copyright (c) 2014 Ryan Papazoglou. All rights reserved.
//

#import "RPViewController.h"
#import "Product.h"
#import "RPCustomUIView.h"
#import "CurrencyViewController.h"
@interface RPViewController ()

@end

@implementation RPViewController
@synthesize priceTextField;
@synthesize salesTaxTextField;
@synthesize percentOffTextField;
@synthesize originalPriceLabel;
@synthesize discountLabel;
@synthesize discountPriceLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.customViewController.hidden = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self clearKeyboard];
}

- (IBAction)discountPriceButton:(id)sender {
    
    double priceX = [priceTextField.text doubleValue];
    double salesTaxX = [salesTaxTextField.text doubleValue];
    double percentOffX = [percentOffTextField.text doubleValue];
    
    [self clearKeyboard];
    
    self.itemViewOne = [[Product alloc]initWithPrice: @(priceX) SalesTax: @(salesTaxX) percentDiscount: @(percentOffX)];
    self.customViewController.itemImport = self.itemViewOne;
    
    double displayedDiscount = ([self.itemViewOne.price doubleValue]* [self.itemViewOne.percentOff doubleValue]/100);
    double displayedDiscountPrice = [self.itemViewOne.price doubleValue] - displayedDiscount;
    
    //int roundedDiscountPrice = lround(displayedDiscountPrice);
    //int roundedDiscount = lround(displayedDiscount);
    
    originalPriceLabel.text = [NSString stringWithFormat:@"%@", self.itemViewOne.price];
    discountLabel.text = [NSString stringWithFormat:@"%.2f", displayedDiscount];
    discountPriceLabel.text = [NSString stringWithFormat:@"%.2f", displayedDiscountPrice];
    
    self.originalPriceLabel.hidden = NO;
    self.discountPriceLabel.hidden = NO;
    self.discountLabel.hidden = NO;
    
    self.customViewController.hidden = NO;
    //[self customImageView];
    [self.customViewController setNeedsDisplay];
}
-(void)clearKeyboard{
    
    [self.priceTextField resignFirstResponder];
    [self.salesTaxTextField resignFirstResponder];
    [self.percentOffTextField resignFirstResponder];
    
}
@end
