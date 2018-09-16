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
    self.object = ExchangeObject.new;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [self performSegueWithIdentifier:@"showDetailSegue" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *dvc = [segue destinationViewController];
    dvc.passedExchangeObject = self.object;
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
            self.object.digitalCurrency = self.stringPassed;
            self.object.market = @"USD";
            break;
        case 1:
            cell.label.text = [NSString stringWithFormat:@"%@/EUR", self.stringPassed];
            self.object.digitalCurrency = self.stringPassed;
            self.object.market = @"EUR";
            break;
        case 2:
            cell.label.text = [NSString stringWithFormat:@"%@/GBP", self.stringPassed];
            self.object.digitalCurrency = self.stringPassed;
            self.object.market = @"GBP";
            break;
        case 3:
            cell.label.text = [NSString stringWithFormat:@"%@/DKK", self.stringPassed];
            self.object.digitalCurrency = self.stringPassed;
            self.object.market = @"DKK";
            break;
    }
    
    return cell;
}


@end
