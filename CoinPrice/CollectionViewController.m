//
//  CollectionViewController.m
//  CoinPrice
//
//  Created by Ehsan on 10/08/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "DetailViewController.h"


@interface CollectionViewController ()

@end


@implementation CollectionViewController

static NSString * const reuseIdentifier = @"CollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor greenColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = self.storyboard;
    DetailViewController *dvc = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    // Local variable to hold exchange pair temporary
    ExchangeObject *localExchangePair = [[ExchangeObject alloc] init];
    
    switch (indexPath.row) {
        case 0:
            localExchangePair.digitalCurrency = self.coinPickedByUser;
            localExchangePair.market = @"USD";
            dvc.exchangePair = localExchangePair;
            break;
        case 1:
            localExchangePair.digitalCurrency = self.coinPickedByUser;
            localExchangePair.market = @"EUR";
            dvc.exchangePair = localExchangePair;
            break;
        case 2:
            localExchangePair.digitalCurrency = self.coinPickedByUser;
            localExchangePair.market = @"GBP";
            dvc.exchangePair = localExchangePair;
            break;
        case 3:
            localExchangePair.digitalCurrency = self.coinPickedByUser;
            localExchangePair.market = @"DKK";
            dvc.exchangePair = localExchangePair;
            break;
    }
    
    [self.navigationController pushViewController: dvc animated:YES];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// Just looking for 4 markets value 
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configuring cells
    switch (indexPath.row) {
        case 0:
            cell.label.text = [NSString stringWithFormat:@"%@/USD", self.coinPickedByUser];
            break;
        case 1:
            cell.label.text = [NSString stringWithFormat:@"%@/EUR", self.coinPickedByUser];
            break;
        case 2:
            cell.label.text = [NSString stringWithFormat:@"%@/GBP", self.coinPickedByUser];
            break;
        case 3:
            cell.label.text = [NSString stringWithFormat:@"%@/DKK", self.coinPickedByUser];
            break;
    }
    
    return cell;
}


@end
