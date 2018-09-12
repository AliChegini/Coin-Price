//
//  CollectionViewController.h
//  CoinPrice
//
//  Created by Ehsan on 10/08/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coin.h"

@interface CollectionViewController : UICollectionViewController

@property (strong, nonatomic) Coin *coinObject;

@end
