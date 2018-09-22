//
//  JSONDownloader.m
//  CoinPrice
//
//  Created by Ehsan on 06/08/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

#import "JSONDownloader.h"


@implementation JSONDownloader

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

// method to call the API, to download JSON and return a Coin object
-(void)callAPI:(NSString*)symbol :(NSString*)market :(Coin *(^)(Coin *finalCoin))completion {
    
    //NSString *urlString = @"https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_INTRADAY&symbol=BTC&market=USD&apikey=JMFWPJPRJ9QQTMOF";
    
    NSString *urlString = [NSString stringWithFormat:@"https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_INTRADAY&symbol=%@&market=%@&apikey=JMFWPJPRJ9QQTMOF", symbol, market];
    
    NSLog(@"%@", urlString);
    
    NSURL *url = [NSURL URLWithString:urlString];
    Coin *coin = Coin.new;
    
    // Asynchronous netwrok call
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        NSDictionary *coinDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
        if (err) {
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }
        
        // Extracting required dictionary consist of time/dates
        NSDictionary *timeSeries = coinDictionary[@"Time Series (Digital Currency Intraday)"];
        // getting the recent price using compare
        NSArray *keys = [[timeSeries allKeys] sortedArrayUsingSelector:@selector(compare:)];
        NSString *mostRecentDate = keys.lastObject;
        NSDictionary *info = timeSeries[mostRecentDate];
        NSString *price = info[@"1a. price (USD)"];
        
        coin.name = symbol;
        coin.price = price;
        coin.date = mostRecentDate;
        
        completion(coin);
        
    }] resume];
}


@end

