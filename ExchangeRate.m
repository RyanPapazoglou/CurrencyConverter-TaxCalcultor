//
//  ExchangeRate.m
//  YFCurrencyConverter
//
//  Created by Michael Shafae on 7/3/14.
//  Copyright (c) 2014 Michael Shafae. All rights reserved.
//

#import "ExchangeRate.h"

@implementation ExchangeRate

@synthesize sourceCurrency;
@synthesize destinationCurrency;
@synthesize rate;
@synthesize lastFetchedOn;

-(ExchangeRate*) initWithSourceCurrency: (ISO4217Currency*) aSourceCurrency DestinationCurrency: (ISO4217Currency*) aDestinationCurrency
{
  self = [super init];
  if (self) {
    sourceCurrency = aSourceCurrency;
    destinationCurrency = aDestinationCurrency;
    [self update];
  }
  return self;
}

-(NSString*) description
{
  return [NSString stringWithFormat: @"{%@} to {%@} is %@ (%@)", self.sourceCurrency.description, self.destinationCurrency.description, self.rate, self.lastFetchedOn.description];
}

-(BOOL) update
{
  BOOL rv = NO;
  NSString* yqlQuery = [NSString stringWithFormat: @"select * from yahoo.finance.xchange where pair in (\"%@%@\")", self.sourceCurrency.alphaCode, self.destinationCurrency.alphaCode];
  NSString* urlString = [NSString stringWithFormat: @"https://query.yahooapis.com/v1/public/yql?q=%@&format=json&env=store%%3A%%2F%%2Fdatatables.org%%2Falltableswithkeys&callback=", [yqlQuery stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding]];
  //NSLog(@"%@", urlString);
  NSURL *yahooFinanaceRESTQueryURL = [NSURL URLWithString: urlString];
  
  NSURLRequest *request = [NSURLRequest requestWithURL: yahooFinanaceRESTQueryURL];
  
  NSURLResponse *response = nil;
  NSError *error = nil;
  
  NSData *yahooFinanaceQueryResults = [NSURLConnection sendSynchronousRequest: request returningResponse: &response error: &error];
  
  if (!error){
    //NSLog(@"Connection and request completed without an error %@", response);
  }else{
    //NSLog(@"Error with connection!");
    return 1;
  }
  
  id unknownObject = [NSJSONSerialization
                      JSONObjectWithData: yahooFinanaceQueryResults
                      options: 0
                      error: &error];
  
  NSDictionary *exchangeRatesDictionary;
  
  if (!error) {
    //NSLog(@"Loaded JSON Data Successfully");
    if( [unknownObject isKindOfClass: [NSDictionary class]]){
      exchangeRatesDictionary = unknownObject;
      NSDictionary *result = [[[exchangeRatesDictionary valueForKey: @"query"] valueForKey:@"results"] valueForKey: @"rate"];
      self.rate = [NSNumber numberWithFloat: [[result objectForKey: @"Rate"] floatValue]];
      self.lastFetchedOn = [NSDate date];
    }else{
      exchangeRatesDictionary = nil;
      rv = NO;
    }
  }else{
    //NSLog(@"There was an unfortunate error; nothing was loaded.");
    rv = NO;
  }
  
  return rv;
}

+(NSArray*) exchangeRatesFromURL: (NSString*) urlString
{
  NSURL *yahooFinanaceRESTQueryURL = [NSURL URLWithString: urlString];
  
  NSURLRequest *request = [NSURLRequest requestWithURL: yahooFinanaceRESTQueryURL];
  
  NSURLResponse *response = nil;
  NSError *error = nil;
  
  NSData *yahooFinanaceQueryResults = [NSURLConnection sendSynchronousRequest: request returningResponse: &response error: &error];
  
  if (!error){
    //NSLog(@"Connection and request completed without an error %@", response);
  }else{
    //NSLog(@"Error with connection!");
    exit(1);
  }
  
  id unknownObject = [NSJSONSerialization
                      JSONObjectWithData: yahooFinanaceQueryResults
                      options: 0
                      error: &error];
  
  NSDictionary *exchangeRatesDictionary;
  
  if (!error) {
    //NSLog(@"Loaded JSON Data Successfully");
    if( [unknownObject isKindOfClass: [NSDictionary class]]){
      exchangeRatesDictionary = unknownObject;
    }else{
      exchangeRatesDictionary = nil;
    }
  }else{
    NSLog(@"There was an unfortunate error; nothing was loaded.");
    exit(1);
  }
  
  NSArray *exchangeRatesDictionaryList = [[[exchangeRatesDictionary valueForKey: @"query"] valueForKey:@"results"] valueForKey: @"rate"];
  
  NSMutableArray *exchangeRateObjectList = [[NSMutableArray alloc] init];
  
  for(NSDictionary *exchangeRateDictionary in exchangeRatesDictionaryList){
    NSString *rateID = [exchangeRateDictionary valueForKey: @"id"];
    //NSLog(@"rateID: %@", rateID);
    NSString *source = [rateID substringWithRange: NSMakeRange(0, 3)];
    NSString *destination = [rateID substringWithRange: NSMakeRange(3, 3)];
    //NSLog(@"rateID: %@ (%@ %@)", rateID, source, destination);
    
    ISO4217Currency *sourceCurrency = [ISO4217Currency ISO4217CurrencyFromString: source];
    ISO4217Currency *destinationCurrency = [ISO4217Currency ISO4217CurrencyFromString: destination];
    ExchangeRate *m = [[ExchangeRate alloc] initWithSourceCurrency: sourceCurrency DestinationCurrency: destinationCurrency];
    
    [exchangeRateObjectList insertObject: m atIndex: 0];
    //NSLog(@"%@", m);
  }
  return (NSArray*)exchangeRateObjectList;
}

// EURUSD, AUDUSD, GBPUSD, USDJPY, EURJPY, EURGBP, USDCAD, USDCHF
// select * from yahoo.finance.xchange where pair in ("EURUSD", "AUDUSD", "GBPUSD", "USDJPY", "EURJPY", "EURGBP", "USDCAD", "USDCHF")
// https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22EURUSD%22%2C%20%22AUDUSD%22%2C%20%22GBPUSD%22%2C%20%22USDJPY%22%2C%20%22EURJPY%22%2C%20%22EURGBP%22%2C%20%22USDCAD%22%2C%20%22USDCHF%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=
 +(NSArray*) majorCurrencyExchangeRates
{
  NSString *yahooFinanaceURLString = @"https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22EURUSD%22%2C%20%22AUDUSD%22%2C%20%22GBPUSD%22%2C%20%22USDJPY%22%2C%20%22EURJPY%22%2C%20%22EURGBP%22%2C%20%22USDCAD%22%2C%20%22USDCHF%22)&format=json&diagnostics=false&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
  return [self exchangeRatesFromURL: yahooFinanaceURLString];
  /*NSURL *yahooFinanaceRESTQueryURL = [NSURL URLWithString: yahooFinanaceURLString];
  
  NSURLRequest *request = [NSURLRequest requestWithURL: yahooFinanaceRESTQueryURL];
  
  NSURLResponse *response = nil;
  NSError *error = nil;
  
  NSData *yahooFinanaceQueryResults = [NSURLConnection sendSynchronousRequest: request returningResponse: &response error: &error];
  
  if (!error){
    NSLog(@"Connection and request completed without an error %@", response);
  }else{
    NSLog(@"Error with connection!");
    exit(1);
  }
  
  id unknownObject = [NSJSONSerialization
                      JSONObjectWithData: yahooFinanaceQueryResults
                      options: 0
                      error: &error];
  
  NSDictionary *exchangeRatesDictionary;
  
  if (!error) {
    NSLog(@"Loaded JSON Data Successfully");
    if( [unknownObject isKindOfClass: [NSDictionary class]]){
      exchangeRatesDictionary = unknownObject;
    }else{
      exchangeRatesDictionary = nil;
    }
  }else{
    NSLog(@"There was an unfortunate error; nothing was loaded.");
    exit(1);
  }
  
  NSArray *exchangeRatesDictionaryList = [[[exchangeRatesDictionary valueForKey: @"query"] valueForKey:@"results"] valueForKey: @"rate"];

  NSMutableArray *exchangeRateObjectList = [[NSMutableArray alloc] init];
  
  for(NSDictionary *exchangeRateDictionary in exchangeRatesDictionaryList){
    NSString *rateID = [exchangeRateDictionary valueForKey: @"id"];
    NSLog(@"rateID: %@", rateID);
    NSString *source = [rateID substringWithRange: NSMakeRange(0, 3)];
    NSString *destination = [rateID substringWithRange: NSMakeRange(3, 3)];
    NSLog(@"rateID: %@ (%@ %@)", rateID, source, destination);

    ISO4217Currency *sourceCurrency = [ISO4217Currency ISO4217CurrencyFromString: source];
    ISO4217Currency *destinationCurrency = [ISO4217Currency ISO4217CurrencyFromString: destination];
    ExchangeRate *m = [[ExchangeRate alloc] initWithSourceCurrency: sourceCurrency DestinationCurrency: destinationCurrency];

    [exchangeRateObjectList insertObject: m atIndex: 0];
    NSLog(@"%@", m);
  }
  return (NSArray*)exchangeRateObjectList;*/
}

// EURAUD, EURCHF, EURNZD, GBPAUD, GBPCAD, GBPCHF, GBPNZD, CADCHF
// select * from yahoo.finance.xchange where pair in ("EURAUD", "EURCHF", "EURNZD", "GBPAUD", "GBPCAD", "GBPCHF", "GBPNZD", "CADCHF")
// https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22EURAUD%22%2C%20%22EURCHF%22%2C%20%22EURNZD%22%2C%20%22GBPAUD%22%2C%20%22GBPCAD%22%2C%20%22GBPCHF%22%2C%20%22GBPNZD%22%2C%20%22CADCHF%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=
+(NSArray*) europeanCrossExchangeRates
{
  NSString *yahooFinanaceURLString = @"https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22EURAUD%22%2C%20%22EURCHF%22%2C%20%22EURNZD%22%2C%20%22GBPAUD%22%2C%20%22GBPCAD%22%2C%20%22GBPCHF%22%2C%20%22GBPNZD%22%2C%20%22CADCHF%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
  return [self exchangeRatesFromURL: yahooFinanaceURLString];
}

// EURCZK, EURPLN, EURTRY, EURHUF, USDMXN, USDHUF, USDZAR, USDTRY, USDPLN, USDCZK, USDRUB
// select * from yahoo.finance.xchange where pair in ("EURCZK", "EURPLN", "EURTRY", "EURHUF", "USDMXN", "USDHUF", "USDZAR", "USDTRY", "USDPLN", "USDCZK", "USDRUB")
// https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22EURCZK%22%2C%20%22EURPLN%22%2C%20%22EURTRY%22%2C%20%22EURHUF%22%2C%20%22USDMXN%22%2C%20%22USDHUF%22%2C%20%22USDZAR%22%2C%20%22USDTRY%22%2C%20%22USDPLN%22%2C%20%22USDCZK%22%2C%20%22USDRUB%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=
+(NSArray*) emergingMarketsExchangeRates
{
  NSString *yahooFinanaceURLString = @"https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22EURCZK%22%2C%20%22EURPLN%22%2C%20%22EURTRY%22%2C%20%22EURHUF%22%2C%20%22USDMXN%22%2C%20%22USDHUF%22%2C%20%22USDZAR%22%2C%20%22USDTRY%22%2C%20%22USDPLN%22%2C%20%22USDCZK%22%2C%20%22USDRUB%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
  return [self exchangeRatesFromURL: yahooFinanaceURLString];
}

// USDDKK, USDSEK, USDNOK, EURSEK, EURDKK, EURNOK
// select * from yahoo.finance.xchange where pair in ("USDDKK", "USDSEK", "USDNOK", "EURSEK", "EURDKK", "EURNOK")
// https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22USDDKK%22%2C%20%22USDSEK%22%2C%20%22USDNOK%22%2C%20%22EURSEK%22%2C%20%22EURDKK%22%2C%20%22EURNOK%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=
+(NSArray*) skandiExchangeRates
{
  NSString *yahooFinanaceURLString = @"https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22USDDKK%22%2C%20%22USDSEK%22%2C%20%22USDNOK%22%2C%20%22EURSEK%22%2C%20%22EURDKK%22%2C%20%22EURNOK%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
  return [self exchangeRatesFromURL: yahooFinanaceURLString];
}

// EURJPY, CHFJPY, CADJPY, NZDJPY, GBPJPY, AUDJPY, SGDJPY, ZARJPY
// select * from yahoo.finance.xchange where pair in ("EURJPY", "CHFJPY", "CADJPY", "NZDJPY", "GBPJPY", "AUDJPY", "SGDJPY", "ZARJPY")
// https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22EURJPY%22%2C%20%22CHFJPY%22%2C%20%22CADJPY%22%2C%20%22NZDJPY%22%2C%20%22GBPJPY%22%2C%20%22AUDJPY%22%2C%20%22SGDJPY%22%2C%20%22ZARJPY%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=
+(NSArray*) yenCrossExchangeRates
{
  NSString *yahooFinanaceURLString = @"https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22EURJPY%22%2C%20%22CHFJPY%22%2C%20%22CADJPY%22%2C%20%22NZDJPY%22%2C%20%22GBPJPY%22%2C%20%22AUDJPY%22%2C%20%22SGDJPY%22%2C%20%22ZARJPY%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
  return [self exchangeRatesFromURL: yahooFinanaceURLString];
}

// USDCNH, AUDNZD, AUDCAD, NZDCAD, NZDUSD, AUDCHF, NZDCHF, USDHKD, USDSGD
// select * from yahoo.finance.xchange where pair in ("USDCNH", "AUDNZD", "AUDCAD", "NZDCAD", "NZDUSD", "AUDCHF", "NZDCHF", "USDHKD", "USDSGD")
// https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22USDCNH%22%2C%20%22AUDNZD%22%2C%20%22AUDCAD%22%2C%20%22NZDCAD%22%2C%20%22NZDUSD%22%2C%20%22AUDCHF%22%2C%20%22NZDCHF%22%2C%20%22USDHKD%22%2C%20%22USDSGD%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=
+(NSArray*) asiaPacificExchangeRates
{
  NSString *yahooFinanaceURLString = @"https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22USDCNH%22%2C%20%22AUDNZD%22%2C%20%22AUDCAD%22%2C%20%22NZDCAD%22%2C%20%22NZDUSD%22%2C%20%22AUDCHF%22%2C%20%22NZDCHF%22%2C%20%22USDHKD%22%2C%20%22USDSGD%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
  return [self exchangeRatesFromURL: yahooFinanaceURLString];
}

// select* from yahoo.finance.xchange where pair in ("AEDUSD", "AFNUSD", "ALLUSD", "AMDUSD", "ANGUSD", "AOAUSD", "ARSUSD", "AUDUSD", "AWGUSD", "AZNUSD", "BAMUSD", "BBDUSD", "BDTUSD", "BGNUSD", "BHDUSD", "BIFUSD", "BMDUSD", "BNDUSD", "BOBUSD", "BRLUSD", "BSDUSD", "BTNUSD", "BWPUSD", "BYRUSD", "BZDUSD", "CADUSD", "CDFUSD", "CHFUSD", "CLPUSD", "CNYUSD", "COPUSD", "CRCUSD", "CUPUSD", "CVEUSD", "CZKUSD", "DJFUSD", "DKKUSD", "DOPUSD", "DZDUSD", "EGPUSD", "ERNUSD", "ETBUSD", "EURUSD", "FJDUSD", "FKPUSD", "GBPUSD", "GELUSD", "GHSUSD", "GIPUSD", "GMDUSD", "GNFUSD", "GTQUSD", "GYDUSD", "HKDUSD", "HNLUSD", "HRKUSD", "HTGUSD", "HUFUSD", "IDRUSD", "ILSUSD", "INRUSD", "IQDUSD", "IRRUSD", "ISKUSD", "JMDUSD", "JODUSD", "JPYUSD", "KESUSD", "KGSUSD", "KHRUSD", "KMFUSD", "KPWUSD", "KRWUSD", "KWDUSD", "KYDUSD", "KZTUSD", "LAKUSD", "LBPUSD", "LKRUSD", "LRDUSD", "LSLUSD", "LTLUSD", "LYDUSD", "MADUSD", "MDLUSD", "MGAUSD", "MKDUSD", "MMKUSD", "MNTUSD", "MOPUSD", "MROUSD", "MURUSD", "MVRUSD", "MWKUSD", "MXNUSD", "MYRUSD", "MZNUSD", "NADUSD", "NGNUSD", "NIOUSD", "NOKUSD", "NPRUSD", "NZDUSD", "OMRUSD", "PABUSD", "PENUSD", "PGKUSD", "PHPUSD", "PKRUSD", "PLNUSD", "PYGUSD", "QARUSD", "RONUSD", "RSDUSD", "RUBUSD", "RWFUSD", "SARUSD", "SBDUSD", "SCRUSD", "SDGUSD", "SEKUSD", "SGDUSD", "SHPUSD", "SLLUSD", "SOSUSD", "SRDUSD", "SSPUSD", "STDUSD", "SVCUSD", "SYPUSD", "SZLUSD", "THBUSD", "TJSUSD", "TMTUSD", "TNDUSD", "TOPUSD", "TRYUSD", "TTDUSD", "TWDUSD", "TZSUSD", "UAHUSD", "UGXUSD", "USDUSD", "UYUUSD", "UZSUSD", "VEFUSD", "VNDUSD", "VUVUSD", "WSTUSD", "XAFUSD", "XAGUSD", "XAUUSD", "XBAUSD", "XBBUSD", "XBCUSD", "XBDUSD", "XCDUSD", "XOFUSD", "XPDUSD", "XPFUSD", "XPTUSD", "XTSUSD", "XXXUSD", "YERUSD", "ZARUSD", "ZMWUSD", "ZWLUSD")
// https://query.yahooapis.com/v1/public/yql?q=select*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22AEDUSD%22%2C%20%22AFNUSD%22%2C%20%22ALLUSD%22%2C%20%22AMDUSD%22%2C%20%22ANGUSD%22%2C%20%22AOAUSD%22%2C%20%22ARSUSD%22%2C%20%22AUDUSD%22%2C%20%22AWGUSD%22%2C%20%22AZNUSD%22%2C%20%22BAMUSD%22%2C%20%22BBDUSD%22%2C%20%22BDTUSD%22%2C%20%22BGNUSD%22%2C%20%22BHDUSD%22%2C%20%22BIFUSD%22%2C%20%22BMDUSD%22%2C%20%22BNDUSD%22%2C%20%22BOBUSD%22%2C%20%22BRLUSD%22%2C%20%22BSDUSD%22%2C%20%22BTNUSD%22%2C%20%22BWPUSD%22%2C%20%22BYRUSD%22%2C%20%22BZDUSD%22%2C%20%22CADUSD%22%2C%20%22CDFUSD%22%2C%20%22CHFUSD%22%2C%20%22CLPUSD%22%2C%20%22CNYUSD%22%2C%20%22COPUSD%22%2C%20%22CRCUSD%22%2C%20%22CUPUSD%22%2C%20%22CVEUSD%22%2C%20%22CZKUSD%22%2C%20%22DJFUSD%22%2C%20%22DKKUSD%22%2C%20%22DOPUSD%22%2C%20%22DZDUSD%22%2C%20%22EGPUSD%22%2C%20%22ERNUSD%22%2C%20%22ETBUSD%22%2C%20%22EURUSD%22%2C%20%22FJDUSD%22%2C%20%22FKPUSD%22%2C%20%22GBPUSD%22%2C%20%22GELUSD%22%2C%20%22GHSUSD%22%2C%20%22GIPUSD%22%2C%20%22GMDUSD%22%2C%20%22GNFUSD%22%2C%20%22GTQUSD%22%2C%20%22GYDUSD%22%2C%20%22HKDUSD%22%2C%20%22HNLUSD%22%2C%20%22HRKUSD%22%2C%20%22HTGUSD%22%2C%20%22HUFUSD%22%2C%20%22IDRUSD%22%2C%20%22ILSUSD%22%2C%20%22INRUSD%22%2C%20%22IQDUSD%22%2C%20%22IRRUSD%22%2C%20%22ISKUSD%22%2C%20%22JMDUSD%22%2C%20%22JODUSD%22%2C%20%22JPYUSD%22%2C%20%22KESUSD%22%2C%20%22KGSUSD%22%2C%20%22KHRUSD%22%2C%20%22KMFUSD%22%2C%20%22KPWUSD%22%2C%20%22KRWUSD%22%2C%20%22KWDUSD%22%2C%20%22KYDUSD%22%2C%20%22KZTUSD%22%2C%20%22LAKUSD%22%2C%20%22LBPUSD%22%2C%20%22LKRUSD%22%2C%20%22LRDUSD%22%2C%20%22LSLUSD%22%2C%20%22LTLUSD%22%2C%20%22LYDUSD%22%2C%20%22MADUSD%22%2C%20%22MDLUSD%22%2C%20%22MGAUSD%22%2C%20%22MKDUSD%22%2C%20%22MMKUSD%22%2C%20%22MNTUSD%22%2C%20%22MOPUSD%22%2C%20%22MROUSD%22%2C%20%22MURUSD%22%2C%20%22MVRUSD%22%2C%20%22MWKUSD%22%2C%20%22MXNUSD%22%2C%20%22MYRUSD%22%2C%20%22MZNUSD%22%2C%20%22NADUSD%22%2C%20%22NGNUSD%22%2C%20%22NIOUSD%22%2C%20%22NOKUSD%22%2C%20%22NPRUSD%22%2C%20%22NZDUSD%22%2C%20%22OMRUSD%22%2C%20%22PABUSD%22%2C%20%22PENUSD%22%2C%20%22PGKUSD%22%2C%20%22PHPUSD%22%2C%20%22PKRUSD%22%2C%20%22PLNUSD%22%2C%20%22PYGUSD%22%2C%20%22QARUSD%22%2C%20%22RONUSD%22%2C%20%22RSDUSD%22%2C%20%22RUBUSD%22%2C%20%22RWFUSD%22%2C%20%22SARUSD%22%2C%20%22SBDUSD%22%2C%20%22SCRUSD%22%2C%20%22SDGUSD%22%2C%20%22SEKUSD%22%2C%20%22SGDUSD%22%2C%20%22SHPUSD%22%2C%20%22SLLUSD%22%2C%20%22SOSUSD%22%2C%20%22SRDUSD%22%2C%20%22SSPUSD%22%2C%20%22STDUSD%22%2C%20%22SVCUSD%22%2C%20%22SYPUSD%22%2C%20%22SZLUSD%22%2C%20%22THBUSD%22%2C%20%22TJSUSD%22%2C%20%22TMTUSD%22%2C%20%22TNDUSD%22%2C%20%22TOPUSD%22%2C%20%22TRYUSD%22%2C%20%22TTDUSD%22%2C%20%22TWDUSD%22%2C%20%22TZSUSD%22%2C%20%22UAHUSD%22%2C%20%22UGXUSD%22%2C%20%22USDUSD%22%2C%20%22UYUUSD%22%2C%20%22UZSUSD%22%2C%20%22VEFUSD%22%2C%20%22VNDUSD%22%2C%20%22VUVUSD%22%2C%20%22WSTUSD%22%2C%20%22XAFUSD%22%2C%20%22XAGUSD%22%2C%20%22XAUUSD%22%2C%20%22XBAUSD%22%2C%20%22XBBUSD%22%2C%20%22XBCUSD%22%2C%20%22XBDUSD%22%2C%20%22XCDUSD%22%2C%20%22XOFUSD%22%2C%20%22XPDUSD%22%2C%20%22XPFUSD%22%2C%20%22XPTUSD%22%2C%20%22XTSUSD%22%2C%20%22XXXUSD%22%2C%20%22YERUSD%22%2C%20%22ZARUSD%22%2C%20%22ZMWUSD%22%2C%20%22ZWLUSD%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=
//

+(NSArray*) allExchangeRatesToUSD
{
  NSString *yahooFinanaceURLString = @"https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22USDCNH%22%2C%20%22AUDNZD%22%2C%20%22AUDCAD%22%2C%20%22NZDCAD%22%2C%20%22NZDUSD%22%2C%20%22AUDCHF%22%2C%20%22NZDCHF%22%2C%20%22USDHKD%22%2C%20%22USDSGD%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
  return [self exchangeRatesFromURL: yahooFinanaceURLString];
}
@end
