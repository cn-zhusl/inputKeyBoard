//
//  MySearchViewController.m
//  InputEmojiExample
//
//  Created by zhu_sl on 15/12/17.
//  Copyright © 2015年 tutuge. All rights reserved.
//

#import "MySearchViewController.h"

@interface MySearchViewController ()

@end

@implementation MySearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSLog(@"Entering:%@",searchController.searchBar.text);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
