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

// method to call the API, fetch data, download json
-(void)callAPI{
    
    NSString *urlString = @"https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_INTRADAY&symbol=BTC&market=USD&apikey=JMFWPJPRJ9QQTMOF";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        NSDictionary *coinDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
        if (err) {
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }
        
        NSLog(@"response dictionary: %@", coinDictionary);
        
    }] resume];
    
    
    
    
}


@end
