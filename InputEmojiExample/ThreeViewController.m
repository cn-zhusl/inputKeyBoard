//
//  ThreeViewController.m
//  InputEmojiExample
//
//  Created by zhu_sl on 15/12/22.
//  Copyright © 2015年 tutuge. All rights reserved.
//

#import "ThreeViewController.h"
#import "SLButton.h"


@interface ThreeViewController ()

@property (nonatomic,strong) SLButton * hasletBtnDashB;
@property (weak, nonatomic) IBOutlet SLButton *sButton;
@property (weak, nonatomic) IBOutlet SLButton *bButton;
@property (weak, nonatomic) IBOutlet SLButton *sButton1;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 内脏仪表盘
//    _hasletBtnDashB = [SLButton buttonWithType:UIButtonTypeCustom];
//    _hasletBtnDashB.tag = 1001;
//    [_hasletBtnDashB setFrame:CGRectMake(0, 0,[[UIScreen mainScreen] bounds].size.width- 120,[[UIScreen mainScreen] bounds].size.width- 120)];//CGRectMake(0, 0, [,
//    [_hasletBtnDashB setImage:[UIImage imageNamed:@"bg_life_pan_organ_nor"] forState:UIControlStateNormal];
//    [_hasletBtnDashB setImage:[UIImage imageNamed:@"bg_life_pan_organ_sel"] forState:UIControlStateSelected];
//    [_hasletBtnDashB setImage:[UIImage imageNamed:@"bg_life_pan_organ_sel"] forState:UIControlStateHighlighted];
//    [_hasletBtnDashB.layer setCornerRadius:(CGRectGetWidth(_hasletBtnDashB.bounds) / 2.0)];
//    [_hasletBtnDashB.layer setMasksToBounds:YES];
//    [self.view addSubview:_hasletBtnDashB];
//    [_hasletBtnDashB addTarget:self action:@selector(dashBoardBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//
//    _hasletBtnDashB.center = self.view.center;

    _sButton.clieckedType = SLButtonClieckedRectangular;
    _sButton1.clieckedType = SLButtonClieckedRectangular;

    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];
   
    NSDate *birthDate = [[NSDate alloc] init];
    NSTimeInterval time = [[NSDate date] timeIntervalSinceDate:birthDate];
    CGFloat nyear = (@(time).floatValue) / (3600.0 * 24.0 * 365.0);
    
    [_sButton setTag:@(nyear).integerValue];
    [_sButton setUserInteractionEnabled:YES];
    _sButton.layer.anchorPoint = CGPointMake(0.5, 0.5);

    [_sButton setTransform:CGAffineTransformMakeRotation(M_PI * 2.0 * (15 / 120.0))];

    [_sButton1 setTag:@(nyear).integerValue];
    [_sButton1 setUserInteractionEnabled:YES];
    _sButton1.layer.anchorPoint = CGPointMake(0.5, 0.5);
    [_sButton1 setTransform:CGAffineTransformMakeRotation(M_PI * 2.0 * (75 / 120.0))];
}

-(void)dashBoardBtnAction:(UIButton *)sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
