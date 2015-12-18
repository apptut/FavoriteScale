//
//  ViewController.m
//  FavoriteScale-OC
//
//  Created by liangqi on 15/12/16.
//  Copyright © 2015年 dailyios. All rights reserved.
//

#import "ViewController.h"
#import "FavoriteScaleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FavoriteScaleView* fav = [FavoriteScaleView instance];
    fav.center = self.view.center;
    
    fav.selected = YES;
    
    [self.view addSubview:fav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
