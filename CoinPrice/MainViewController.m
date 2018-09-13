//
//  MainViewController.m
//  CoinPrice
//
//  Created by Ehsan on 17/07/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

// API KEY: JMFWPJPRJ9QQTMOF
// API Example call
// https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_INTRADAY&symbol=BTC&market=USD&apikey=JMFWPJPRJ9QQTMOF


#import "MainViewController.h"
#import "JSONDownloader.h"
#import "Coin.h"
#import "CollectionViewController.h"

//@class JSONDownloader;

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *coinArray;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self arraySetup];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myCell"];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)arraySetup {
    coinArray = [NSMutableArray arrayWithArray: @[@"BitCoin", @"Etherum", @"AltCoin"]];
}

// Idea for TODO list:
// user taps on bitcoin then he will see collection view of USD, EUR, GBP, DKK
// user chose a currency from collection view and will see the price


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return coinArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = coinArray[indexPath.row];
    return cell;
}


#pragma mark - Navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.string = coinArray[indexPath.row];
    NSLog(@"cell is tapped %@", coinArray[indexPath.row]);
    
    [self performSegueWithIdentifier:@"collectionViewSegue" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CollectionViewController *cvc = [segue destinationViewController];
    cvc.stringPassed = self.string;
}


@end

