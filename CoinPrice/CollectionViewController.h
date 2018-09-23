//
//  CollectionViewController.h
//  CoinPrice
//
//  Created by Ehsan on 10/08/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController 

// coin name to pass from table view to collection view
@property (strong, nonatomic) NSString *coinPickedByUser;

@end

