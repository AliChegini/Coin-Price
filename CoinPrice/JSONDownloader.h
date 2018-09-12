//
//  JSONDownloader.h
//  CoinPrice
//
//  Created by Ehsan on 06/08/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coin.h"


@interface JSONDownloader : NSObject

-(void)callAPI: (Coin *(^)(Coin *finalCoin))completion;

@end
