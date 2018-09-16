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

@interface CollectionViewController : UICollectionViewController

@property (strong, nonatomic) NSString *stringPassed;
@property (strong, nonatomic) ExchangeObject *object;

@end

