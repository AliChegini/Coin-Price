//
//  JSONDownloader.m
//  CoinPrice
//
//  Created by Ehsan on 06/08/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

#import "JSONDownloader.h"
#import "Coin.h"

// TODO: save the price in an array to use it later
@interface JSONDownloader ()
@property (strong, nonatomic) NSMutableArray *preparedCoin;

@end

@implementation JSONDownloader

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

// method to call the API, fetch data, download json
-(void)callAPI{
    
    NSString *urlString = @"https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_INTRADAY&symbol=BTC&market=USD&apikey=JMFWPJPRJ9QQTMOF";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
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
        NSArray *keys = [[timeSeries allKeys] sortedArrayUsingSelector:@selector(compare:)];
        NSString *mostRecentDate = keys.lastObject;
        NSDictionary *info = timeSeries[mostRecentDate];
        NSString *price = info[@"1a. price (USD)"];
        NSLog(@"%@ - %@", mostRecentDate, price);
        
        Coin *coin = Coin.new;
        coin.name = @"BTC";
        coin.price = price;
        
        int intValue = coin.price.intValue;
        
        NSLog(@"%i USD", intValue);
        self.preparedCoin = [[NSMutableArray alloc] initWithObjects:coin, nil];
        //[self.preparedCoin addObject:[coin price]];
        
        // TODO: add recent date to Coin class
        // Use the preparedCoin array to show data in each cell of collection View
        
    }] resume];
}


@end
