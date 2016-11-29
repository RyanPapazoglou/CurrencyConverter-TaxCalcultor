//
//  ExchangeRate.h
//  YFCurrencyConverter
//
//  Created by Michael Shafae on 7/3/14.
//  Copyright (c) 2014 Michael Shafae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISO4217Currency.h"

@interface ExchangeRate : NSObject

@property (retain, nonatomic) ISO4217Currency* sourceCurrency;
@property (retain, nonatomic) ISO4217Currency* destinationCurrency;
@property (retain, nonatomic) NSNumber* rate;
@property (retain, nonatomic) NSDate* lastFetchedOn;

-(ExchangeRate*) initWithSourceCurrency: (ISO4217Currency*) aSourceCurrency DestinationCurrency: (ISO4217Currency*) aDestinationCurrency;

-(BOOL) update;

-(NSString*) description;


// EURUSD, AUDUSD, GBPUSD, USDJPY, EURJPY, EURGBP, USDCAD, USDCHF
+(NSArray*) majorCurrencyExchangeRates;

// EURAUD, EURCHF, EURNZD, GBPAUD, GBPCAD, GBPCHF, GBPNZD, CADCHF
+(NSArray*) europeanCrossExchangeRates;

// EURCZK, EURPLN, EURTRY, EURHUF, USDMXN, USDHUF, USDZAR, USDTRY, USDPLN, USDCZK, USDRUB
+(NSArray*) emergingMarketsExchangeRates;

// USDDKK, USDSEK, USDNOK, EURSEK, EURDKK, EURNOK
+(NSArray*) skandiExchangeRates;

// EURJPY, CHFJPY, CADJPY, NZDJPY, GBPJPY, AUDJPY, SGDJPY, ZARJPY
+(NSArray*) yenCrossExchangeRates;

// USDCNH, AUDNZD, AUDCAD, NZDCAD, NZDUSD, AUDCHF, NZDCHF, USDHKD, USDSGD
+(NSArray*) asiaPacificExchangeRates;

+(NSArray*) allExchangeRatesToUSD;

@end
