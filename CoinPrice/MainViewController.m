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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell is tapped %@", coinArray[indexPath.row]);
    
    [self performSegueWithIdentifier:@"collectionViewSegue" sender:self];
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//    UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
//    CollectionViewController *cvc = (CollectionViewController *)navController.topViewController;
//
//    JSONDownloader *object = [[JSONDownloader alloc] init];
//    [object callAPI:^Coin *(Coin *finalCoin) {
//        cvc.passedCoin = finalCoin;
//        return finalCoin;
//    }];
//
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
