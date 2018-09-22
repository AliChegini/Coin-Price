//
//  DetailViewController.h
//  CoinPrice
//
//  Created by Ehsan on 13/09/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coin.h"
#import "ExchangeObject.h"

@interface DetailViewController : UIViewController {
    ExchangeObject *exchangeObject;
}

@property (strong, nonatomic) ExchangeObject *exchangeObject;


@property (strong, nonatomic) Coin *coinInfo;
@property (weak, nonatomic) IBOutlet UILabel *coinInfoLabel;


@end

