//
//  DetailViewController.m
//  CoinPrice
//
//  Created by Ehsan on 13/09/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

#import "DetailViewController.h"
#import "JSONDownloader.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JSONDownloader *object = [[JSONDownloader alloc] init];
    [object callAPI:^Coin *(Coin *finalCoin) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.coinInfoLabel.text = finalCoin.price;
        });
        
        return finalCoin;
    }];
        
    // TODO: Find a proper way to concatenate coin and market names to use for url
    // turncate float points
    // show all the data related to a coin properly.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
