//
//  CollectionViewController.m
//  CoinPrice
//
//  Created by Ehsan on 10/08/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "JSONDownloader.h"
#import "DetailViewController.h"

@interface CollectionViewController ()

@end


@implementation CollectionViewController

static NSString * const reuseIdentifier = @"CollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor greenColor];

//    JSONDownloader *object = [[JSONDownloader alloc] init];
//    [object callAPI:^Coin *(Coin *finalCoin) {
//        self.coinObject = finalCoin;
//        NSLog(@"%@", self.coinObject.price);
//
//        return finalCoin;
//    }];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    //[self performSegueWithIdentifier:@"showDetailSegue" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //DetailViewController *dvc = [segue destinationViewController];

}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
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
