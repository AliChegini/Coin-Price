//
//  DetailViewController.h
//  CoinPrice
//
//  Created by Ehsan on 13/09/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coin.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Coin *coinInfo;
@property (weak, nonatomic) IBOutlet UILabel *coinInfoLabel;

@end

