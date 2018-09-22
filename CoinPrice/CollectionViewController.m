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

// TODO: I need to find a better way to pass the data around
// Look up singleton
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            exchangeObject.digitalCurrency = self.stringPassed;
            exchangeObject.market = @"USD";
            break;
        case 1:
            exchangeObject.digitalCurrency = self.stringPassed;
            exchangeObject.market = @"EUR";
            break;
        case 2:
            exchangeObject.digitalCurrency = self.stringPassed;
            exchangeObject.market = @"GBP";
            break;
        case 3:
            exchangeObject.digitalCurrency = self.stringPassed;
            exchangeObject.market = @"DKK";
            break;
    }
    
    //[self performSegueWithIdentifier:@"showDetailSegue" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *dvc = [segue destinationViewController];
    dvc.exchangeObject = exchangeObject;
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
    
    
    // Configure the cell
    // TODO: there is a bug here , always get back DKK, should be fixed
    switch (indexPath.row) {
        case 0:
            cell.label.text = [NSString stringWithFormat:@"%@/USD", self.stringPassed];
            break;
        case 1:
            cell.label.text = [NSString stringWithFormat:@"%@/EUR", self.stringPassed];
            break;
        case 2:
            cell.label.text = [NSString stringWithFormat:@"%@/GBP", self.stringPassed];
            break;
        case 3:
            cell.label.text = [NSString stringWithFormat:@"%@/DKK", self.stringPassed];
            break;
    }
    
    return cell;
}


@end
