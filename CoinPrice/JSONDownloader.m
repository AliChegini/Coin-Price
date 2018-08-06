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

// method to call the API and download json
-(void)callAPI{
    
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_INTRADAY&symbol=BTC&market=USD&apikey=JMFWPJPRJ9QQTMOF"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"%@", json);
    
}


@end
