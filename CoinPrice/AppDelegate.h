//
//  AppDelegate.h
//  CoinPrice
//
//  Created by Ehsan on 16/07/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExchangeObject.h"
#import "CollectionViewController.h"
#import "DetailViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    ExchangeObject *exchangeObject;
    CollectionViewController *cvc;
    DetailViewController *dvc;
    
}


@property (strong, nonatomic) UIWindow *window;


@end

