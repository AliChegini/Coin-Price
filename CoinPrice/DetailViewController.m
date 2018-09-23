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
    
    [object callAPI:self.exchangePair.digitalCurrency :self.exchangePair.market :^Coin *(Coin *finalCoin) {

        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *allInfo = [NSString stringWithFormat:@" %@/%@ \n%@ \n%@", self.exchangePair.digitalCurrency, self.exchangePair.market, [finalCoin.price substringToIndex:8], finalCoin.date];
            self.coinInfoLabel.text = allInfo;
        });
        return finalCoin;
    }];
    
    [self setupGesture];
    
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
        [self.navigationController popViewControllerAnimated:NO];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
