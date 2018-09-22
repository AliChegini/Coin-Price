//
//  CollectionViewController.h
//  CoinPrice
//
//  Created by Ehsan on 10/08/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coin.h"
#import "ExchangeObject.h"

@interface CollectionViewController : UICollectionViewController {
    ExchangeObject *exchangeObject;
}

// object to hold coin name and market name --- BTC vs USD
@property (strong, nonatomic) ExchangeObject *exchangeObject;

// coin name to pass from table view to collection view
@property (strong, nonatomic) NSString *stringPassed;


@end

