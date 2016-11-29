//
//  RPCustomUIView.m
//  CurrencyConverter
//
//  Created by Ryan Papazoglou on 7/7/14.
//  Copyright (c) 2014 Ryan Papazoglou. All rights reserved.
//

#import "RPCustomUIView.h"
#import "Product.h"

@implementation RPCustomUIView
@synthesize itemImport;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    
    // Drawing code
    NSLog(@"Am I drawing?");
    CGContextRef context = UIGraphicsGetCurrentContext();
    //float height = 100.0;
    //float width = 40.0;
    float height = rect.size.height;
    float width = rect.size.width/2.0;
    
    //Full rect
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 1.0, 1.0);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 2.0);
    CGRect originalPriceRectangle = CGRectMake(width/2, 0.0, width, height);
    
    CGContextFillRect(context, originalPriceRectangle);
    CGContextAddRect(context, originalPriceRectangle);
    CGContextStrokePath(context);
    
    
    //Discount rect
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextSetLineWidth(context, 2.0);
    CGRect discountRectangle = CGRectMake(width/2, 0.0, width, height * ([self.itemImport.percentOff doubleValue])/100.0);
    
    CGContextFillRect(context, discountRectangle);
    CGContextAddRect(context, discountRectangle);
    CGContextStrokePath(context);
    
}


@end
