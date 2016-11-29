//
//  ISO4217Currency.m
//  YFCurrencyConverter
//
//  Created by Michael Shafae on 7/3/14.
//  Copyright (c) 2014 Michael Shafae. All rights reserved.
//

#import "ISO4217Currency.h"

@interface ISO4217Currency ()
/*
NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                      NSStringFromSelector(@selector(foo)), @"foo",
                      nil];

SEL selector = NSSelectorFromString([dict objectForKey:@"foo"]);
*/
/*{
NSDictionary *_alphaCodeToCurrencyDictionary;
}

+(NSDictionary*) alphaCodeToCurrencyDictionary;
*/
@end

@implementation ISO4217Currency

@synthesize country;
@synthesize currency;
@synthesize alphaCode;
@synthesize numericCode;
@synthesize minorUnit;

-(ISO4217Currency*) initWithCountry: (NSString*) aCountry Currency: (NSString*) aCurrency AlphaCode:(NSString*) anAlphaCode NumericCode: (NSString*) aNumericCode MinorUnit: (NSUInteger) aMinorUnit;
{
  self = [super init];
  if (self) {
    country = aCountry;
    currency = aCurrency;
    alphaCode = anAlphaCode;
    numericCode = aNumericCode;
    minorUnit = aMinorUnit;
  }
  return self;
}

+(ISO4217Currency*) ISO4217CurrencyFromString: (NSString*) alphaCode
{
  NSDictionary *currencyStringToObjectDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                              NSStringFromSelector(@selector(unitedArabEmiratesCurrency)), @"AED",
                                              NSStringFromSelector(@selector(afghanistanCurrency)), @"AFN",
                                              NSStringFromSelector(@selector(albaniaCurrency)), @"ALL",
                                              NSStringFromSelector(@selector(armeniaCurrency)), @"AMD",
                                              NSStringFromSelector(@selector(sintMaartenDutchPartCurrency)), @"ANG",
                                              NSStringFromSelector(@selector(angolaCurrency)), @"AOA",
                                              NSStringFromSelector(@selector(argentinaCurrency)), @"ARS",
                                              NSStringFromSelector(@selector(tuvaluCurrency)), @"AUD",
                                              NSStringFromSelector(@selector(arubaCurrency)), @"AWG",
                                              NSStringFromSelector(@selector(azerbaijanCurrency)), @"AZN",
                                              NSStringFromSelector(@selector(bosniaAndHerzegovinaCurrency)), @"BAM",
                                              NSStringFromSelector(@selector(barbadosCurrency)), @"BBD",
                                              NSStringFromSelector(@selector(bangladeshCurrency)), @"BDT",
                                              NSStringFromSelector(@selector(bulgariaCurrency)), @"BGN",
                                              NSStringFromSelector(@selector(bahrainCurrency)), @"BHD",
                                              NSStringFromSelector(@selector(burundiCurrency)), @"BIF",
                                              NSStringFromSelector(@selector(bermudaCurrency)), @"BMD",
                                              NSStringFromSelector(@selector(bruneiDarussalamCurrency)), @"BND",
                                              NSStringFromSelector(@selector(plurinationalStateOfBoliviaCurrency)), @"BOB",
                                              NSStringFromSelector(@selector(brazilCurrency)), @"BRL",
                                              NSStringFromSelector(@selector(bahamasCurrency)), @"BSD",
                                              NSStringFromSelector(@selector(bhutanCurrency)), @"BTN",
                                              NSStringFromSelector(@selector(botswanaCurrency)), @"BWP",
                                              NSStringFromSelector(@selector(belarusCurrency)), @"BYR",
                                              NSStringFromSelector(@selector(belizeCurrency)), @"BZD",
                                              NSStringFromSelector(@selector(canadaCurrency)), @"CAD",
                                              NSStringFromSelector(@selector(democraticRepublicOfTheCongoCurrency)), @"CDF",
                                              NSStringFromSelector(@selector(switzerlandCurrency)), @"CHF",
                                              NSStringFromSelector(@selector(chileCurrency)), @"CLP",
                                              NSStringFromSelector(@selector(chinaCurrency)), @"CNY",
                                              NSStringFromSelector(@selector(colombiaCurrency)), @"COP",
                                              NSStringFromSelector(@selector(costaRicaCurrency)), @"CRC",
                                              NSStringFromSelector(@selector(cubaCurrency)), @"CUP",
                                              NSStringFromSelector(@selector(capeVerdeCurrency)), @"CVE",
                                              NSStringFromSelector(@selector(czechRepublicCurrency)), @"CZK",
                                              NSStringFromSelector(@selector(djiboutiCurrency)), @"DJF",
                                              NSStringFromSelector(@selector(greenlandCurrency)), @"DKK",
                                              NSStringFromSelector(@selector(dominicanRepublicCurrency)), @"DOP",
                                              NSStringFromSelector(@selector(algeriaCurrency)), @"DZD",
                                              NSStringFromSelector(@selector(egyptCurrency)), @"EGP",
                                              NSStringFromSelector(@selector(eritreaCurrency)), @"ERN",
                                              NSStringFromSelector(@selector(ethiopiaCurrency)), @"ETB",
                                              NSStringFromSelector(@selector(spainCurrency)), @"EUR",
                                              NSStringFromSelector(@selector(fijiCurrency)), @"FJD",
                                              NSStringFromSelector(@selector(falklandIslandsMalvinasCurrency)), @"FKP",
                                              NSStringFromSelector(@selector(unitedKingdomCurrency)), @"GBP",
                                              NSStringFromSelector(@selector(georgiaCurrency)), @"GEL",
                                              NSStringFromSelector(@selector(ghanaCurrency)), @"GHS",
                                              NSStringFromSelector(@selector(gibraltarCurrency)), @"GIP",
                                              NSStringFromSelector(@selector(gambiaCurrency)), @"GMD",
                                              NSStringFromSelector(@selector(guineaCurrency)), @"GNF",
                                              NSStringFromSelector(@selector(guatemalaCurrency)), @"GTQ",
                                              NSStringFromSelector(@selector(guyanaCurrency)), @"GYD",
                                              NSStringFromSelector(@selector(hongKongCurrency)), @"HKD",
                                              NSStringFromSelector(@selector(hondurasCurrency)), @"HNL",
                                              NSStringFromSelector(@selector(croatiaCurrency)), @"HRK",
                                              NSStringFromSelector(@selector(haitiCurrency)), @"HTG",
                                              NSStringFromSelector(@selector(hungaryCurrency)), @"HUF",
                                              NSStringFromSelector(@selector(indonesiaCurrency)), @"IDR",
                                              NSStringFromSelector(@selector(israelCurrency)), @"ILS",
                                              NSStringFromSelector(@selector(indiaCurrency)), @"INR",
                                              NSStringFromSelector(@selector(iraqCurrency)), @"IQD",
                                              NSStringFromSelector(@selector(islamicRepublicOfIranCurrency)), @"IRR",
                                              NSStringFromSelector(@selector(icelandCurrency)), @"ISK",
                                              NSStringFromSelector(@selector(jamaicaCurrency)), @"JMD",
                                              NSStringFromSelector(@selector(jordanCurrency)), @"JOD",
                                              NSStringFromSelector(@selector(japanCurrency)), @"JPY",
                                              NSStringFromSelector(@selector(kenyaCurrency)), @"KES",
                                              NSStringFromSelector(@selector(kyrgyzstanCurrency)), @"KGS",
                                              NSStringFromSelector(@selector(cambodiaCurrency)), @"KHR",
                                              NSStringFromSelector(@selector(comorosCurrency)), @"KMF",
                                              NSStringFromSelector(@selector(democraticPeoplesRepublicOfKoreaCurrency)), @"KPW",
                                              NSStringFromSelector(@selector(republicOfKoreaCurrency)), @"KRW",
                                              NSStringFromSelector(@selector(kuwaitCurrency)), @"KWD",
                                              NSStringFromSelector(@selector(caymanIslandsCurrency)), @"KYD",
                                              NSStringFromSelector(@selector(kazakhstanCurrency)), @"KZT",
                                              NSStringFromSelector(@selector(laoPeoplesDemocraticRepublicCurrency)), @"LAK",
                                              NSStringFromSelector(@selector(lebanonCurrency)), @"LBP",
                                              NSStringFromSelector(@selector(sriLankaCurrency)), @"LKR",
                                              NSStringFromSelector(@selector(liberiaCurrency)), @"LRD",
                                              NSStringFromSelector(@selector(lesothoCurrency)), @"LSL",
                                              NSStringFromSelector(@selector(lithuaniaCurrency)), @"LTL",
                                              NSStringFromSelector(@selector(libyaCurrency)), @"LYD",
                                              NSStringFromSelector(@selector(westernSaharaCurrency)), @"MAD",
                                              NSStringFromSelector(@selector(republicOfMoldovaCurrency)), @"MDL",
                                              NSStringFromSelector(@selector(madagascarCurrency)), @"MGA",
                                              NSStringFromSelector(@selector(theFormerYugoslavRepublicOfMacedoniaCurrency)), @"MKD",
                                              NSStringFromSelector(@selector(myanmarCurrency)), @"MMK",
                                              NSStringFromSelector(@selector(mongoliaCurrency)), @"MNT",
                                              NSStringFromSelector(@selector(macaoCurrency)), @"MOP",
                                              NSStringFromSelector(@selector(mauritaniaCurrency)), @"MRO",
                                              NSStringFromSelector(@selector(mauritiusCurrency)), @"MUR",
                                              NSStringFromSelector(@selector(maldivesCurrency)), @"MVR",
                                              NSStringFromSelector(@selector(malawiCurrency)), @"MWK",
                                              NSStringFromSelector(@selector(mexicoCurrency)), @"MXN",
                                              NSStringFromSelector(@selector(malaysiaCurrency)), @"MYR",
                                              NSStringFromSelector(@selector(mozambiqueCurrency)), @"MZN",
                                              NSStringFromSelector(@selector(namibiaCurrency)), @"NAD",
                                              NSStringFromSelector(@selector(nigeriaCurrency)), @"NGN",
                                              NSStringFromSelector(@selector(nicaraguaCurrency)), @"NIO",
                                              NSStringFromSelector(@selector(svalbardAndJanMayenCurrency)), @"NOK",
                                              NSStringFromSelector(@selector(nepalCurrency)), @"NPR",
                                              NSStringFromSelector(@selector(tokelauCurrency)), @"NZD",
                                              NSStringFromSelector(@selector(omanCurrency)), @"OMR",
                                              NSStringFromSelector(@selector(panamaCurrency)), @"PAB",
                                              NSStringFromSelector(@selector(peruCurrency)), @"PEN",
                                              NSStringFromSelector(@selector(papuaNewGuineaCurrency)), @"PGK",
                                              NSStringFromSelector(@selector(philippinesCurrency)), @"PHP",
                                              NSStringFromSelector(@selector(pakistanCurrency)), @"PKR",
                                              NSStringFromSelector(@selector(polandCurrency)), @"PLN",
                                              NSStringFromSelector(@selector(paraguayCurrency)), @"PYG",
                                              NSStringFromSelector(@selector(qatarCurrency)), @"QAR",
                                              NSStringFromSelector(@selector(romaniaCurrency)), @"RON",
                                              NSStringFromSelector(@selector(serbiaCurrency)), @"RSD",
                                              NSStringFromSelector(@selector(russianFederationCurrency)), @"RUB",
                                              NSStringFromSelector(@selector(rwandaCurrency)), @"RWF",
                                              NSStringFromSelector(@selector(saudiArabiaCurrency)), @"SAR",
                                              NSStringFromSelector(@selector(solomonIslandsCurrency)), @"SBD",
                                              NSStringFromSelector(@selector(seychellesCurrency)), @"SCR",
                                              NSStringFromSelector(@selector(sudanCurrency)), @"SDG",
                                              NSStringFromSelector(@selector(swedenCurrency)), @"SEK",
                                              NSStringFromSelector(@selector(singaporeCurrency)), @"SGD",
                                              NSStringFromSelector(@selector(ascensionAndTristanDaCunhaSaintHelenaCurrency)), @"SHP",
                                              NSStringFromSelector(@selector(sierraLeoneCurrency)), @"SLL",
                                              NSStringFromSelector(@selector(somaliaCurrency)), @"SOS",
                                              NSStringFromSelector(@selector(surinameCurrency)), @"SRD",
                                              NSStringFromSelector(@selector(southSudanCurrency)), @"SSP",
                                              NSStringFromSelector(@selector(saoTomeAndPrincipeCurrency)), @"STD",
                                              NSStringFromSelector(@selector(elSalvadorCurrency)), @"SVC",
                                              NSStringFromSelector(@selector(syrianArabRepublicCurrency)), @"SYP",
                                              NSStringFromSelector(@selector(swazilandCurrency)), @"SZL",
                                              NSStringFromSelector(@selector(thailandCurrency)), @"THB",
                                              NSStringFromSelector(@selector(tajikistanCurrency)), @"TJS",
                                              NSStringFromSelector(@selector(turkmenistanCurrency)), @"TMT",
                                              NSStringFromSelector(@selector(tunisiaCurrency)), @"TND",
                                              NSStringFromSelector(@selector(tongaCurrency)), @"TOP",
                                              NSStringFromSelector(@selector(turkeyCurrency)), @"TRY",
                                              NSStringFromSelector(@selector(trinidadAndTobagoCurrency)), @"TTD",
                                              NSStringFromSelector(@selector(provinceOfChinaTaiwanCurrency)), @"TWD",
                                              NSStringFromSelector(@selector(unitedRepublicOfTanzaniaCurrency)), @"TZS",
                                              NSStringFromSelector(@selector(ukraineCurrency)), @"UAH",
                                              NSStringFromSelector(@selector(ugandaCurrency)), @"UGX",
                                              NSStringFromSelector(@selector(unitedStatesCurrency)), @"USD",
                                              NSStringFromSelector(@selector(uruguayCurrency)), @"UYU",
                                              NSStringFromSelector(@selector(uzbekistanCurrency)), @"UZS",
                                              NSStringFromSelector(@selector(bolivarianRepublicOfVenezuelaCurrency)), @"VEF",
                                              NSStringFromSelector(@selector(vietNamCurrency)), @"VND",
                                              NSStringFromSelector(@selector(vanuatuCurrency)), @"VUV",
                                              NSStringFromSelector(@selector(samoaCurrency)), @"WST",
                                              NSStringFromSelector(@selector(gabonCurrency)), @"XAF",
                                              NSStringFromSelector(@selector(saintVincentAndTheGrenadinesCurrency)), @"XCD",
                                              NSStringFromSelector(@selector(togoCurrency)), @"XOF",
                                              NSStringFromSelector(@selector(yemenCurrency)), @"YER",
                                              NSStringFromSelector(@selector(southAfricaCurrency)), @"ZAR",
                                              NSStringFromSelector(@selector(zambiaCurrency)), @"ZMW",
                                              NSStringFromSelector(@selector(zimbabweCurrency)), @"ZWL",
                                              nil];

  SEL selector = NSSelectorFromString([currencyStringToObjectDict objectForKey: alphaCode]);
  
  return [ISO4217Currency performSelector: selector];
}

-(NSString*) description
{
  return [NSString stringWithFormat: @"%@ %@ %@ %@ %lu", self.country, self.currency, self.alphaCode, self.numericCode, self.minorUnit];
}

+(ISO4217Currency*) afghanistanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"AFGHANISTAN" Currency: @"Afghani" AlphaCode: @"AFN" NumericCode: @"971" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) ålandIslandsCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ÅLAND ISLANDS" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) albaniaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ALBANIA" Currency: @"Lek" AlphaCode: @"ALL" NumericCode: @"008" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) algeriaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ALGERIA" Currency: @"Algerian Dinar" AlphaCode: @"DZD" NumericCode: @"012" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) americanSamoaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"AMERICAN SAMOA" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) andorraCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ANDORRA" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) angolaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ANGOLA" Currency: @"Kwanza" AlphaCode: @"AOA" NumericCode: @"973" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) anguillaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ANGUILLA" Currency: @"East Caribbean Dollar" AlphaCode: @"XCD" NumericCode: @"951" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) antiguaAndBarbudaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ANTIGUA AND BARBUDA" Currency: @"East Caribbean Dollar" AlphaCode: @"XCD" NumericCode: @"951" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) argentinaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ARGENTINA" Currency: @"Argentine Peso" AlphaCode: @"ARS" NumericCode: @"032" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) armeniaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ARMENIA" Currency: @"Armenian Dram" AlphaCode: @"AMD" NumericCode: @"051" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) arubaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ARUBA" Currency: @"Aruban Florin" AlphaCode: @"AWG" NumericCode: @"533" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) australiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"AUSTRALIA" Currency: @"Australian Dollar" AlphaCode: @"AUD" NumericCode: @"036" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) austriaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"AUSTRIA" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) azerbaijanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"AZERBAIJAN" Currency: @"Azerbaijanian Manat" AlphaCode: @"AZN" NumericCode: @"944" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) bahamasCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BAHAMAS" Currency: @"Bahamian Dollar" AlphaCode: @"BSD" NumericCode: @"044" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) bahrainCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BAHRAIN" Currency: @"Bahraini Dinar" AlphaCode: @"BHD" NumericCode: @"048" MinorUnit: 3];
  return cc;
}

+(ISO4217Currency*) bangladeshCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BANGLADESH" Currency: @"Taka" AlphaCode: @"BDT" NumericCode: @"050" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) barbadosCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BARBADOS" Currency: @"Barbados Dollar" AlphaCode: @"BBD" NumericCode: @"052" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) belarusCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BELARUS" Currency: @"Belarussian Ruble" AlphaCode: @"BYR" NumericCode: @"974" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) belgiumCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BELGIUM" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) belizeCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BELIZE" Currency: @"Belize Dollar" AlphaCode: @"BZD" NumericCode: @"084" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) beninCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BENIN" Currency: @"CFA Franc BCEAO" AlphaCode: @"XOF" NumericCode: @"952" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) bermudaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BERMUDA" Currency: @"Bermudian Dollar" AlphaCode: @"BMD" NumericCode: @"060" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) bhutanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BHUTAN" Currency: @"Ngultrum" AlphaCode: @"BTN" NumericCode: @"064" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) bhutanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BHUTAN" Currency: @"Indian Rupee" AlphaCode: @"INR" NumericCode: @"356" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) plurinationalStateOfBoliviaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BOLIVIA, PLURINATIONAL STATE OF" Currency: @"Boliviano" AlphaCode: @"BOB" NumericCode: @"068" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) plurinationalStateOfBoliviaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BOLIVIA, PLURINATIONAL STATE OF" Currency: @"Mvdol" AlphaCode: @"BOV" NumericCode: @"984" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) sintEustatiusAndSabaBonaireCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BONAIRE, SINT EUSTATIUS AND SABA" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) bosniaAndHerzegovinaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BOSNIA AND HERZEGOVINA" Currency: @"Convertible Mark" AlphaCode: @"BAM" NumericCode: @"977" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) botswanaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BOTSWANA" Currency: @"Pula" AlphaCode: @"BWP" NumericCode: @"072" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) bouvetIslandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BOUVET ISLAND" Currency: @"Norwegian Krone" AlphaCode: @"NOK" NumericCode: @"578" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) brazilCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BRAZIL" Currency: @"Brazilian Real" AlphaCode: @"BRL" NumericCode: @"986" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) britishIndianOceanTerritoryCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BRITISH INDIAN OCEAN TERRITORY" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) bruneiDarussalamCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BRUNEI DARUSSALAM" Currency: @"Brunei Dollar" AlphaCode: @"BND" NumericCode: @"096" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) bulgariaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BULGARIA" Currency: @"Bulgarian Lev" AlphaCode: @"BGN" NumericCode: @"975" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) burkinaFasoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BURKINA FASO" Currency: @"CFA Franc BCEAO" AlphaCode: @"XOF" NumericCode: @"952" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) burundiCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"BURUNDI" Currency: @"Burundi Franc" AlphaCode: @"BIF" NumericCode: @"108" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) cambodiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CAMBODIA" Currency: @"Riel" AlphaCode: @"KHR" NumericCode: @"116" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) cameroonCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CAMEROON" Currency: @"CFA Franc BEAC" AlphaCode: @"XAF" NumericCode: @"950" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) canadaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CANADA" Currency: @"Canadian Dollar" AlphaCode: @"CAD" NumericCode: @"124" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) capeVerdeCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CAPE VERDE" Currency: @"Cape Verde Escudo" AlphaCode: @"CVE" NumericCode: @"132" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) caymanIslandsCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CAYMAN ISLANDS" Currency: @"Cayman Islands Dollar" AlphaCode: @"KYD" NumericCode: @"136" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) centralAfricanRepublicCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CENTRAL AFRICAN REPUBLIC" Currency: @"CFA Franc BEAC" AlphaCode: @"XAF" NumericCode: @"950" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) chadCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CHAD" Currency: @"CFA Franc BEAC" AlphaCode: @"XAF" NumericCode: @"950" MinorUnit: 0];
  return cc;
}

/*+(ISO4217Currency*) chileCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CHILE" Currency: @"Unidad de Fomento" AlphaCode: @"CLF" NumericCode: @"990" MinorUnit: 4];
  return cc;
}*/

+(ISO4217Currency*) chileCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CHILE" Currency: @"Chilean Peso" AlphaCode: @"CLP" NumericCode: @"152" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) chinaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CHINA" Currency: @"Yuan Renminbi" AlphaCode: @"CNY" NumericCode: @"156" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) christmasIslandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CHRISTMAS ISLAND" Currency: @"Australian Dollar" AlphaCode: @"AUD" NumericCode: @"036" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) cocosKeelingIslandsCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"COCOS (KEELING) ISLANDS" Currency: @"Australian Dollar" AlphaCode: @"AUD" NumericCode: @"036" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) colombiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"COLOMBIA" Currency: @"Colombian Peso" AlphaCode: @"COP" NumericCode: @"170" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) colombiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"COLOMBIA" Currency: @"Unidad de Valor Real" AlphaCode: @"COU" NumericCode: @"970" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) comorosCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"COMOROS" Currency: @"Comoro Franc" AlphaCode: @"KMF" NumericCode: @"174" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) congoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CONGO" Currency: @"CFA Franc BEAC" AlphaCode: @"XAF" NumericCode: @"950" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) democraticRepublicOfTheCongoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CONGO, DEMOCRATIC REPUBLIC OF THE " Currency: @"Congolese Franc" AlphaCode: @"CDF" NumericCode: @"976" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) cookIslandsCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"COOK ISLANDS" Currency: @"New Zealand Dollar" AlphaCode: @"NZD" NumericCode: @"554" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) costaRicaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"COSTA RICA" Currency: @"Costa Rican Colon" AlphaCode: @"CRC" NumericCode: @"188" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) côteDivoireCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CÔTE D'IVOIRE" Currency: @"CFA Franc BCEAO" AlphaCode: @"XOF" NumericCode: @"952" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) croatiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CROATIA" Currency: @"Croatian Kuna" AlphaCode: @"HRK" NumericCode: @"191" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) cubaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CUBA" Currency: @"Peso Convertible" AlphaCode: @"CUC" NumericCode: @"931" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) cubaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CUBA" Currency: @"Cuban Peso" AlphaCode: @"CUP" NumericCode: @"192" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) curaçaoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CURAÇAO" Currency: @"Netherlands Antillean Guilder" AlphaCode: @"ANG" NumericCode: @"532" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) cyprusCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CYPRUS" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) czechRepublicCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"CZECH REPUBLIC" Currency: @"Czech Koruna" AlphaCode: @"CZK" NumericCode: @"203" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) denmarkCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"DENMARK" Currency: @"Danish Krone" AlphaCode: @"DKK" NumericCode: @"208" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) djiboutiCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"DJIBOUTI" Currency: @"Djibouti Franc" AlphaCode: @"DJF" NumericCode: @"262" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) dominicaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"DOMINICA" Currency: @"East Caribbean Dollar" AlphaCode: @"XCD" NumericCode: @"951" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) dominicanRepublicCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"DOMINICAN REPUBLIC" Currency: @"Dominican Peso" AlphaCode: @"DOP" NumericCode: @"214" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) ecuadorCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ECUADOR" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) egyptCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"EGYPT" Currency: @"Egyptian Pound" AlphaCode: @"EGP" NumericCode: @"818" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) elSalvadorCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"EL SALVADOR" Currency: @"El Salvador Colon" AlphaCode: @"SVC" NumericCode: @"222" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) elSalvadorCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"EL SALVADOR" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) equatorialGuineaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"EQUATORIAL GUINEA" Currency: @"CFA Franc BEAC" AlphaCode: @"XAF" NumericCode: @"950" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) eritreaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ERITREA" Currency: @"Nakfa" AlphaCode: @"ERN" NumericCode: @"232" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) estoniaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ESTONIA" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) ethiopiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ETHIOPIA" Currency: @"Ethiopian Birr" AlphaCode: @"ETB" NumericCode: @"230" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) europeanUnionCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"EUROPEAN UNION" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) falklandIslandsMalvinasCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"FALKLAND ISLANDS (MALVINAS)" Currency: @"Falkland Islands Pound" AlphaCode: @"FKP" NumericCode: @"238" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) faroeIslandsCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"FAROE ISLANDS" Currency: @"Danish Krone" AlphaCode: @"DKK" NumericCode: @"208" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) fijiCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"FIJI" Currency: @"Fiji Dollar" AlphaCode: @"FJD" NumericCode: @"242" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) finlandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"FINLAND" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) franceCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"FRANCE" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) frenchGuianaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"FRENCH GUIANA" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) frenchPolynesiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"FRENCH POLYNESIA" Currency: @"CFP Franc" AlphaCode: @"XPF" NumericCode: @"953" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) frenchSouthernTerritoriesCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"FRENCH SOUTHERN TERRITORIES" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) gabonCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GABON" Currency: @"CFA Franc BEAC" AlphaCode: @"XAF" NumericCode: @"950" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) gambiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GAMBIA" Currency: @"Dalasi" AlphaCode: @"GMD" NumericCode: @"270" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) georgiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GEORGIA" Currency: @"Lari" AlphaCode: @"GEL" NumericCode: @"981" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) germanyCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GERMANY" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) ghanaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GHANA" Currency: @"Ghana Cedi" AlphaCode: @"GHS" NumericCode: @"936" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) gibraltarCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GIBRALTAR" Currency: @"Gibraltar Pound" AlphaCode: @"GIP" NumericCode: @"292" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) greeceCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GREECE" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) greenlandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GREENLAND" Currency: @"Danish Krone" AlphaCode: @"DKK" NumericCode: @"208" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) grenadaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GRENADA" Currency: @"East Caribbean Dollar" AlphaCode: @"XCD" NumericCode: @"951" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) guadeloupeCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GUADELOUPE" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) guamCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GUAM" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) guatemalaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GUATEMALA" Currency: @"Quetzal" AlphaCode: @"GTQ" NumericCode: @"320" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) guernseyCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GUERNSEY" Currency: @"Pound Sterling" AlphaCode: @"GBP" NumericCode: @"826" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) guineaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GUINEA" Currency: @"Guinea Franc" AlphaCode: @"GNF" NumericCode: @"324" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) guineaBissauCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GUINEA-BISSAU" Currency: @"CFA Franc BCEAO" AlphaCode: @"XOF" NumericCode: @"952" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) guyanaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"GUYANA" Currency: @"Guyana Dollar" AlphaCode: @"GYD" NumericCode: @"328" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) haitiCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"HAITI" Currency: @"Gourde" AlphaCode: @"HTG" NumericCode: @"332" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) haitiCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"HAITI" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) heardIslandAndMcdonaldIslandsCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"HEARD ISLAND AND McDONALD ISLANDS" Currency: @"Australian Dollar" AlphaCode: @"AUD" NumericCode: @"036" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) holySeeVaticanCityStateCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"HOLY SEE (VATICAN CITY STATE)" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) hondurasCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"HONDURAS" Currency: @"Lempira" AlphaCode: @"HNL" NumericCode: @"340" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) hongKongCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"HONG KONG" Currency: @"Hong Kong Dollar" AlphaCode: @"HKD" NumericCode: @"344" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) hungaryCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"HUNGARY" Currency: @"Forint" AlphaCode: @"HUF" NumericCode: @"348" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) icelandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ICELAND" Currency: @"Iceland Krona" AlphaCode: @"ISK" NumericCode: @"352" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) indiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"INDIA" Currency: @"Indian Rupee" AlphaCode: @"INR" NumericCode: @"356" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) indonesiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"INDONESIA" Currency: @"Rupiah" AlphaCode: @"IDR" NumericCode: @"360" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) internationalMonetaryFundImfCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"INTERNATIONAL MONETARY FUND (IMF)" Currency: @"SDR (Special Drawing Right)" AlphaCode: @"XDR" NumericCode: @"960" MinorUnit: N.A.];
  return cc;
}*/

+(ISO4217Currency*) islamicRepublicOfIranCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"IRAN, ISLAMIC REPUBLIC OF" Currency: @"Iranian Rial" AlphaCode: @"IRR" NumericCode: @"364" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) iraqCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"IRAQ" Currency: @"Iraqi Dinar" AlphaCode: @"IQD" NumericCode: @"368" MinorUnit: 3];
  return cc;
}

+(ISO4217Currency*) irelandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"IRELAND" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) isleOfManCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ISLE OF MAN" Currency: @"Pound Sterling" AlphaCode: @"GBP" NumericCode: @"826" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) israelCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ISRAEL" Currency: @"New Israeli Sheqel" AlphaCode: @"ILS" NumericCode: @"376" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) italyCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ITALY" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) jamaicaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"JAMAICA" Currency: @"Jamaican Dollar" AlphaCode: @"JMD" NumericCode: @"388" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) japanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"JAPAN" Currency: @"Yen" AlphaCode: @"JPY" NumericCode: @"392" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) jerseyCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"JERSEY" Currency: @"Pound Sterling" AlphaCode: @"GBP" NumericCode: @"826" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) jordanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"JORDAN" Currency: @"Jordanian Dinar" AlphaCode: @"JOD" NumericCode: @"400" MinorUnit: 3];
  return cc;
}

+(ISO4217Currency*) kazakhstanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"KAZAKHSTAN" Currency: @"Tenge" AlphaCode: @"KZT" NumericCode: @"398" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) kenyaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"KENYA" Currency: @"Kenyan Shilling" AlphaCode: @"KES" NumericCode: @"404" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) kiribatiCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"KIRIBATI" Currency: @"Australian Dollar" AlphaCode: @"AUD" NumericCode: @"036" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) democraticPeoplesRepublicOfKoreaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"KOREA, DEMOCRATIC PEOPLE’S REPUBLIC OF" Currency: @"North Korean Won" AlphaCode: @"KPW" NumericCode: @"408" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) republicOfKoreaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"KOREA, REPUBLIC OF" Currency: @"Won" AlphaCode: @"KRW" NumericCode: @"410" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) kuwaitCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"KUWAIT" Currency: @"Kuwaiti Dinar" AlphaCode: @"KWD" NumericCode: @"414" MinorUnit: 3];
  return cc;
}

+(ISO4217Currency*) kyrgyzstanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"KYRGYZSTAN" Currency: @"Som" AlphaCode: @"KGS" NumericCode: @"417" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) laoPeoplesDemocraticRepublicCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"LAO PEOPLE’S DEMOCRATIC REPUBLIC" Currency: @"Kip" AlphaCode: @"LAK" NumericCode: @"418" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) latviaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"LATVIA" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) lebanonCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"LEBANON" Currency: @"Lebanese Pound" AlphaCode: @"LBP" NumericCode: @"422" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) lesothoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"LESOTHO" Currency: @"Loti" AlphaCode: @"LSL" NumericCode: @"426" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) lesothoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"LESOTHO" Currency: @"Rand" AlphaCode: @"ZAR" NumericCode: @"710" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) liberiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"LIBERIA" Currency: @"Liberian Dollar" AlphaCode: @"LRD" NumericCode: @"430" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) libyaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"LIBYA" Currency: @"Libyan Dinar" AlphaCode: @"LYD" NumericCode: @"434" MinorUnit: 3];
  return cc;
}

+(ISO4217Currency*) liechtensteinCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"LIECHTENSTEIN" Currency: @"Swiss Franc" AlphaCode: @"CHF" NumericCode: @"756" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) lithuaniaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"LITHUANIA" Currency: @"Lithuanian Litas" AlphaCode: @"LTL" NumericCode: @"440" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) luxembourgCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"LUXEMBOURG" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) macaoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MACAO" Currency: @"Pataca" AlphaCode: @"MOP" NumericCode: @"446" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) theFormerYugoslavRepublicOfMacedoniaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF" Currency: @"Denar" AlphaCode: @"MKD" NumericCode: @"807" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) madagascarCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MADAGASCAR" Currency: @"Malagasy Ariary" AlphaCode: @"MGA" NumericCode: @"969" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) malawiCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MALAWI" Currency: @"Kwacha" AlphaCode: @"MWK" NumericCode: @"454" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) malaysiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MALAYSIA" Currency: @"Malaysian Ringgit" AlphaCode: @"MYR" NumericCode: @"458" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) maldivesCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MALDIVES" Currency: @"Rufiyaa" AlphaCode: @"MVR" NumericCode: @"462" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) maliCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MALI" Currency: @"CFA Franc BCEAO" AlphaCode: @"XOF" NumericCode: @"952" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) maltaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MALTA" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) marshallIslandsCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MARSHALL ISLANDS" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) martiniqueCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MARTINIQUE" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) mauritaniaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MAURITANIA" Currency: @"Ouguiya" AlphaCode: @"MRO" NumericCode: @"478" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) mauritiusCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MAURITIUS" Currency: @"Mauritius Rupee" AlphaCode: @"MUR" NumericCode: @"480" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) mayotteCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MAYOTTE" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) memberCountriesOfTheAfricanDevelopmentBankGroupCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MEMBER COUNTRIES OF THE AFRICAN DEVELOPMENT BANK GROUP" Currency: @"ADB Unit of Account" AlphaCode: @"XUA" NumericCode: @"965" MinorUnit: N.A.];
  return cc;
}*/

+(ISO4217Currency*) mexicoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MEXICO" Currency: @"Mexican Peso" AlphaCode: @"MXN" NumericCode: @"484" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) mexicoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MEXICO" Currency: @"Mexican Unidad de Inversion (UDI)" AlphaCode: @"MXV" NumericCode: @"979" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) federatedStatesOfMicronesiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MICRONESIA, FEDERATED STATES OF" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) republicOfMoldovaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MOLDOVA, REPUBLIC OF" Currency: @"Moldovan Leu" AlphaCode: @"MDL" NumericCode: @"498" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) monacoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MONACO" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) mongoliaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MONGOLIA" Currency: @"Tugrik" AlphaCode: @"MNT" NumericCode: @"496" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) montenegroCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MONTENEGRO" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) montserratCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MONTSERRAT" Currency: @"East Caribbean Dollar" AlphaCode: @"XCD" NumericCode: @"951" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) moroccoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MOROCCO" Currency: @"Moroccan Dirham" AlphaCode: @"MAD" NumericCode: @"504" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) mozambiqueCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MOZAMBIQUE" Currency: @"Mozambique Metical" AlphaCode: @"MZN" NumericCode: @"943" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) myanmarCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"MYANMAR" Currency: @"Kyat" AlphaCode: @"MMK" NumericCode: @"104" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) namibiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NAMIBIA" Currency: @"Namibia Dollar" AlphaCode: @"NAD" NumericCode: @"516" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) namibiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NAMIBIA" Currency: @"Rand" AlphaCode: @"ZAR" NumericCode: @"710" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) nauruCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NAURU" Currency: @"Australian Dollar" AlphaCode: @"AUD" NumericCode: @"036" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) nepalCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NEPAL" Currency: @"Nepalese Rupee" AlphaCode: @"NPR" NumericCode: @"524" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) netherlandsCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NETHERLANDS" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) newCaledoniaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NEW CALEDONIA" Currency: @"CFP Franc" AlphaCode: @"XPF" NumericCode: @"953" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) newZealandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NEW ZEALAND" Currency: @"New Zealand Dollar" AlphaCode: @"NZD" NumericCode: @"554" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) nicaraguaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NICARAGUA" Currency: @"Cordoba Oro" AlphaCode: @"NIO" NumericCode: @"558" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) nigerCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NIGER" Currency: @"CFA Franc BCEAO" AlphaCode: @"XOF" NumericCode: @"952" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) nigeriaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NIGERIA" Currency: @"Naira" AlphaCode: @"NGN" NumericCode: @"566" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) niueCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NIUE" Currency: @"New Zealand Dollar" AlphaCode: @"NZD" NumericCode: @"554" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) norfolkIslandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NORFOLK ISLAND" Currency: @"Australian Dollar" AlphaCode: @"AUD" NumericCode: @"036" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) northernMarianaIslandsCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NORTHERN MARIANA ISLANDS" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) norwayCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"NORWAY" Currency: @"Norwegian Krone" AlphaCode: @"NOK" NumericCode: @"578" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) omanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"OMAN" Currency: @"Rial Omani" AlphaCode: @"OMR" NumericCode: @"512" MinorUnit: 3];
  return cc;
}

+(ISO4217Currency*) pakistanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"PAKISTAN" Currency: @"Pakistan Rupee" AlphaCode: @"PKR" NumericCode: @"586" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) palauCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"PALAU" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) panamaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"PANAMA" Currency: @"Balboa" AlphaCode: @"PAB" NumericCode: @"590" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) panamaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"PANAMA" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) papuaNewGuineaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"PAPUA NEW GUINEA" Currency: @"Kina" AlphaCode: @"PGK" NumericCode: @"598" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) paraguayCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"PARAGUAY" Currency: @"Guarani" AlphaCode: @"PYG" NumericCode: @"600" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) peruCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"PERU" Currency: @"Nuevo Sol" AlphaCode: @"PEN" NumericCode: @"604" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) philippinesCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"PHILIPPINES" Currency: @"Philippine Peso" AlphaCode: @"PHP" NumericCode: @"608" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) pitcairnCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"PITCAIRN" Currency: @"New Zealand Dollar" AlphaCode: @"NZD" NumericCode: @"554" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) polandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"POLAND" Currency: @"Zloty" AlphaCode: @"PLN" NumericCode: @"985" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) portugalCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"PORTUGAL" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) puertoRicoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"PUERTO RICO" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) qatarCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"QATAR" Currency: @"Qatari Rial" AlphaCode: @"QAR" NumericCode: @"634" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) réunionCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"RÉUNION" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) romaniaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ROMANIA" Currency: @"New Romanian Leu" AlphaCode: @"RON" NumericCode: @"946" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) russianFederationCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"RUSSIAN FEDERATION" Currency: @"Russian Ruble" AlphaCode: @"RUB" NumericCode: @"643" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) rwandaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"RWANDA" Currency: @"Rwanda Franc" AlphaCode: @"RWF" NumericCode: @"646" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) saintBarthélemyCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SAINT BARTHÉLEMY" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) ascensionAndTristanDaCunhaSaintHelenaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA" Currency: @"Saint Helena Pound" AlphaCode: @"SHP" NumericCode: @"654" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) saintKittsAndNevisCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SAINT KITTS AND NEVIS" Currency: @"East Caribbean Dollar" AlphaCode: @"XCD" NumericCode: @"951" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) saintLuciaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SAINT LUCIA" Currency: @"East Caribbean Dollar" AlphaCode: @"XCD" NumericCode: @"951" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) saintMartinFrenchPartCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SAINT MARTIN (FRENCH PART)" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) saintPierreAndMiquelonCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SAINT PIERRE AND MIQUELON" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) saintVincentAndTheGrenadinesCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SAINT VINCENT AND THE GRENADINES" Currency: @"East Caribbean Dollar" AlphaCode: @"XCD" NumericCode: @"951" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) samoaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SAMOA" Currency: @"Tala" AlphaCode: @"WST" NumericCode: @"882" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) sanMarinoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SAN MARINO" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) saoTomeAndPrincipeCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SAO TOME AND PRINCIPE" Currency: @"Dobra" AlphaCode: @"STD" NumericCode: @"678" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) saudiArabiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SAUDI ARABIA" Currency: @"Saudi Riyal" AlphaCode: @"SAR" NumericCode: @"682" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) senegalCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SENEGAL" Currency: @"CFA Franc BCEAO" AlphaCode: @"XOF" NumericCode: @"952" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) serbiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SERBIA" Currency: @"Serbian Dinar" AlphaCode: @"RSD" NumericCode: @"941" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) seychellesCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SEYCHELLES" Currency: @"Seychelles Rupee" AlphaCode: @"SCR" NumericCode: @"690" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) sierraLeoneCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SIERRA LEONE" Currency: @"Leone" AlphaCode: @"SLL" NumericCode: @"694" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) singaporeCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SINGAPORE" Currency: @"Singapore Dollar" AlphaCode: @"SGD" NumericCode: @"702" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) sintMaartenDutchPartCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SINT MAARTEN (DUTCH PART)" Currency: @"Netherlands Antillean Guilder" AlphaCode: @"ANG" NumericCode: @"532" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) sistemaUnitarioDeCompensacionRegionalDePagosSucreCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SISTEMA UNITARIO DE COMPENSACION REGIONAL DE PAGOS 'SUCRE'" Currency: @"Sucre" AlphaCode: @"XSU" NumericCode: @"994" MinorUnit: N.A.];
  return cc;
}*/

+(ISO4217Currency*) slovakiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SLOVAKIA" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) sloveniaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SLOVENIA" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) solomonIslandsCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SOLOMON ISLANDS" Currency: @"Solomon Islands Dollar" AlphaCode: @"SBD" NumericCode: @"090" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) somaliaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SOMALIA" Currency: @"Somali Shilling" AlphaCode: @"SOS" NumericCode: @"706" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) southAfricaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SOUTH AFRICA" Currency: @"Rand" AlphaCode: @"ZAR" NumericCode: @"710" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) southSudanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SOUTH SUDAN" Currency: @"South Sudanese Pound" AlphaCode: @"SSP" NumericCode: @"728" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) spainCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SPAIN" Currency: @"Euro" AlphaCode: @"EUR" NumericCode: @"978" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) sriLankaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SRI LANKA" Currency: @"Sri Lanka Rupee" AlphaCode: @"LKR" NumericCode: @"144" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) sudanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SUDAN" Currency: @"Sudanese Pound" AlphaCode: @"SDG" NumericCode: @"938" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) surinameCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SURINAME" Currency: @"Surinam Dollar" AlphaCode: @"SRD" NumericCode: @"968" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) svalbardAndJanMayenCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SVALBARD AND JAN MAYEN" Currency: @"Norwegian Krone" AlphaCode: @"NOK" NumericCode: @"578" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) swazilandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SWAZILAND" Currency: @"Lilangeni" AlphaCode: @"SZL" NumericCode: @"748" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) swedenCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SWEDEN" Currency: @"Swedish Krona" AlphaCode: @"SEK" NumericCode: @"752" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) switzerlandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SWITZERLAND" Currency: @"WIR Euro" AlphaCode: @"CHE" NumericCode: @"947" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) switzerlandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SWITZERLAND" Currency: @"Swiss Franc" AlphaCode: @"CHF" NumericCode: @"756" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) switzerlandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SWITZERLAND" Currency: @"WIR Franc" AlphaCode: @"CHW" NumericCode: @"948" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) syrianArabRepublicCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"SYRIAN ARAB REPUBLIC" Currency: @"Syrian Pound" AlphaCode: @"SYP" NumericCode: @"760" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) provinceOfChinaTaiwanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TAIWAN, PROVINCE OF CHINA" Currency: @"New Taiwan Dollar" AlphaCode: @"TWD" NumericCode: @"901" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) tajikistanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TAJIKISTAN" Currency: @"Somoni" AlphaCode: @"TJS" NumericCode: @"972" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) unitedRepublicOfTanzaniaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TANZANIA, UNITED REPUBLIC OF" Currency: @"Tanzanian Shilling" AlphaCode: @"TZS" NumericCode: @"834" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) thailandCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"THAILAND" Currency: @"Baht" AlphaCode: @"THB" NumericCode: @"764" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) timorLesteCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TIMOR-LESTE" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) togoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TOGO" Currency: @"CFA Franc BCEAO" AlphaCode: @"XOF" NumericCode: @"952" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) tokelauCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TOKELAU" Currency: @"New Zealand Dollar" AlphaCode: @"NZD" NumericCode: @"554" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) tongaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TONGA" Currency: @"Pa’anga" AlphaCode: @"TOP" NumericCode: @"776" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) trinidadAndTobagoCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TRINIDAD AND TOBAGO" Currency: @"Trinidad and Tobago Dollar" AlphaCode: @"TTD" NumericCode: @"780" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) tunisiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TUNISIA" Currency: @"Tunisian Dinar" AlphaCode: @"TND" NumericCode: @"788" MinorUnit: 3];
  return cc;
}

+(ISO4217Currency*) turkeyCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TURKEY" Currency: @"Turkish Lira" AlphaCode: @"TRY" NumericCode: @"949" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) turkmenistanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TURKMENISTAN" Currency: @"Turkmenistan New Manat" AlphaCode: @"TMT" NumericCode: @"934" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) turksAndCaicosIslandsCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TURKS AND CAICOS ISLANDS" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) tuvaluCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"TUVALU" Currency: @"Australian Dollar" AlphaCode: @"AUD" NumericCode: @"036" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) ugandaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"UGANDA" Currency: @"Uganda Shilling" AlphaCode: @"UGX" NumericCode: @"800" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) ukraineCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"UKRAINE" Currency: @"Hryvnia" AlphaCode: @"UAH" NumericCode: @"980" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) unitedArabEmiratesCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"UNITED ARAB EMIRATES" Currency: @"UAE Dirham" AlphaCode: @"AED" NumericCode: @"784" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) unitedKingdomCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"UNITED KINGDOM" Currency: @"Pound Sterling" AlphaCode: @"GBP" NumericCode: @"826" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) unitedStatesCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"UNITED STATES" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) unitedStatesCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"UNITED STATES" Currency: @"US Dollar (Next day)" AlphaCode: @"USN" NumericCode: @"997" MinorUnit: 2];
  return cc;
}*/

+(ISO4217Currency*) unitedStatesMinorOutlyingIslandsCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"UNITED STATES MINOR OUTLYING ISLANDS" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

/*+(ISO4217Currency*) uruguayCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"URUGUAY" Currency: @"Uruguay Peso en Unidades Indexadas (URUIURUI)" AlphaCode: @"UYI" NumericCode: @"940" MinorUnit: 0];
  return cc;
}*/

+(ISO4217Currency*) uruguayCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"URUGUAY" Currency: @"Peso Uruguayo" AlphaCode: @"UYU" NumericCode: @"858" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) uzbekistanCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"UZBEKISTAN" Currency: @"Uzbekistan Sum" AlphaCode: @"UZS" NumericCode: @"860" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) vanuatuCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"VANUATU" Currency: @"Vatu" AlphaCode: @"VUV" NumericCode: @"548" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) bolivarianRepublicOfVenezuelaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"VENEZUELA, BOLIVARIAN REPUBLIC OF" Currency: @"Bolivar" AlphaCode: @"VEF" NumericCode: @"937" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) vietNamCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"VIET NAM" Currency: @"Dong" AlphaCode: @"VND" NumericCode: @"704" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) virginIslandsBritishCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"VIRGIN ISLANDS (BRITISH)" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) virginIslandsUSCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"VIRGIN ISLANDS (US)" Currency: @"US Dollar" AlphaCode: @"USD" NumericCode: @"840" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) wallisAndFutunaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"WALLIS AND FUTUNA" Currency: @"CFP Franc" AlphaCode: @"XPF" NumericCode: @"953" MinorUnit: 0];
  return cc;
}

+(ISO4217Currency*) westernSaharaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"WESTERN SAHARA" Currency: @"Moroccan Dirham" AlphaCode: @"MAD" NumericCode: @"504" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) yemenCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"YEMEN" Currency: @"Yemeni Rial" AlphaCode: @"YER" NumericCode: @"886" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) zambiaCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ZAMBIA" Currency: @"Zambian Kwacha" AlphaCode: @"ZMW" NumericCode: @"967" MinorUnit: 2];
  return cc;
}

+(ISO4217Currency*) zimbabweCurrency
{
  ISO4217Currency* cc = [[ISO4217Currency alloc] initWithCountry: @"ZIMBABWE" Currency: @"Zimbabwe Dollar" AlphaCode: @"ZWL" NumericCode: @"932" MinorUnit: 2];
  return cc;
}

@end
