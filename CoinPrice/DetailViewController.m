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
    
    // TODO: replace the hardcoded values with passed values
    [object callAPI:self.passedExchangeObject.digitalCurrency :self.passedExchangeObject.market :^Coin *(Coin *finalCoin) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.coinInfoLabel.text = finalCoin.price;
            NSLog(@"%@", self.passedExchangeObject.market);
        });

        return finalCoin;
    }];
    
//    [object callAPI:^Coin *(Coin *finalCoin) {
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.coinInfoLabel.text = finalCoin.price;
//        });
//
//        return finalCoin;
//    }];
    
    
    [self setupGesture];
    
    
    // TODO: Find a proper way to concatenate coin and market names to use for url
    // turncate float points
    // show all the data related to a coin properly.
}


-(void) setupGesture {
    UITapGestureRecognizer *dismiss = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    dismiss.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:dismiss];
    
}

-(void)dismiss {
    
    [UIView animateWithDuration:0.4 animations:^{
        self.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.01, 0.01);
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
