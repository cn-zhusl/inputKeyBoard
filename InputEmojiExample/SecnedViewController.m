//
//  SecnedViewController.m
//  InputEmojiExample
//
//  Created by zhu_sl on 15/12/17.
//  Copyright © 2015年 tutuge. All rights reserved.
//

#import "SecnedViewController.h"
#import "MySearchViewController.h"
#import "LiaoTianViewController.h"
#import "SLButton.h"

@interface SecnedViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic,strong)     UISearchBar * searchBar;
@property (nonatomic,strong)  UISearchController * searChcontroller;
@property (nonatomic,strong)     UITableView * aTableView;
@property (weak, nonatomic) IBOutlet UIButton *pushButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UIView *bView;

@end

@implementation SecnedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MySearchViewController * searchViewController = [[MySearchViewController alloc] init];
    
    self.dataArray = @[@"1",@"2",@"3",@"4"];
    
    self.searChcontroller =[[UISearchController alloc] initWithSearchResultsController:searchViewController];
    self.searChcontroller.searchResultsUpdater = searchViewController;
    self.searChcontroller.dimsBackgroundDuringPresentation = YES;
    [self.searChcontroller.searchBar sizeToFit];
    
    _searchBar = self.searChcontroller.searchBar;
    
    _searchBar.frame = CGRectMake(0, 64, self.view.frame.size.width, 44);
    
    [self.view addSubview:_searchBar];
    
    _aTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height-64)];
    _aTableView.delegate = self;
    _aTableView.dataSource = self;
    
    [_aTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    _imageV.layer.masksToBounds = YES;
    _imageV.layer.cornerRadius = 100;

    UIView * backView =[[UIView alloc] initWithFrame:CGRectMake(0, 150, 320, 320)];
    backView.clipsToBounds =YES;
    [backView setBackgroundColor:[UIColor grayColor]];
    
    UIButton * temp = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [temp setBackgroundColor:[UIColor redColor]];
    temp.layer.masksToBounds = YES;
    temp.layer.cornerRadius = (320-80)/2;

    temp.clipsToBounds = YES;
    temp.clearsContextBeforeDrawing = YES;
    temp.tag = 1002;
    temp.frame = CGRectMake(0, 0, 320-80, 320-80);
    [temp addTarget:self action:@selector(secnedAction:) forControlEvents:UIControlEventTouchUpInside];
    [temp setImage:[UIImage imageNamed:@"emoji_3_big"] forState:UIControlStateNormal];
    
    [backView addSubview:temp];
//    [self.view addSubview:backView];
    
    _bView.layer.masksToBounds = YES;
    _bView.layer.cornerRadius =80.0;
    _bView.clipsToBounds = YES;
    
    _pushButton.layer.masksToBounds = YES;
    _pushButton.layer.cornerRadius =80.0;
    _pushButton.clipsToBounds = YES;

}



- (IBAction)secnedAction:(UIButton *)sender {
    
    [sender setImage:[UIImage imageNamed:@"emoji_4_big"] forState:UIControlStateNormal];
    NSLog(@"123456");
}

- (IBAction)push:(id)sender {
    
    LiaoTianViewController * liaotian =[self.storyboard instantiateViewControllerWithIdentifier:@"LiaoTianViewController"];;
    liaotian.hidesBottomBarWhenPushed = YES;

    [self.navigationController pushViewController:liaotian animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
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
