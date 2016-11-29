//
//  RPViewController.h
//  CurrencyConverter
//
//  Created by Ryan Papazoglou on 7/2/14.
//  Copyright (c) 2014 Ryan Papazoglou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPCustomUIView.h"

@interface RPViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *salesTaxTextField;
@property (weak, nonatomic) IBOutlet UITextField *percentOffTextField;
@property (weak, nonatomic) IBOutlet UILabel *originalPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountPriceLabel;
@property (weak, nonatomic) IBOutlet RPCustomUIView *customViewController;
@property (strong, nonatomic) Product* itemViewOne;



- (IBAction)discountPriceButton:(id)sender;

@end
