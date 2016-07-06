//
//  LiaoTianViewController.m
//  InputEmojiExample
//
//  Created by zhuSonglin on 15/12/13.
//  Copyright © 2015年 tutuge. All rights reserved.
//

#import "LiaoTianViewController.h"

@interface LiaoTianViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myTableViewConstraint;

@property (nonatomic,strong) NSMutableArray * attributeds;

@end

@implementation LiaoTianViewController

- (IBAction)show:(id)sender {
    
    [_InputView.textView becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

    [IQKeyboardManager sharedManager].enable = NO;

    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.attributeds = [[NSMutableArray alloc] init];
    __weak typeof(self) weakSelf = self;
    _InputView = [[InputAccessoryView alloc]initWithStartShow:InputViewStartShow];
    _InputView.ShowEmojiKeyBoard = YES;
    _InputView.block= ^(CGFloat y,BOOL isEnd) {
    
        weakSelf.myTableViewConstraint.constant = y;
        [weakSelf.myTableView setContentOffset:CGPointMake(0, (self.myTableView.contentSize.height>self.myTableView.frame.size.height) ? weakSelf.myTableView.contentSize.height-weakSelf.myTableView.frame.size.height : 0) animated:YES] ;
    };
    
    _InputView.outBlock = ^(NSString * string,NSAttributedString *attributedText){
      
        [weakSelf.attributeds addObject:attributedText];
        [weakSelf.myTableView reloadData];
    };
    
    [self.view addSubview:_InputView];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
    [IQKeyboardManager sharedManager].enable = YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.attributeds.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, cell.frame.size.height)];
        textView.tag = 20000;
        textView.userInteractionEnabled = NO;
        [cell.contentView addSubview:textView];
        
        cell.clipsToBounds =YES;
    }
    
    UITextView * textView = (UITextView *)[cell.contentView viewWithTag:20000];
    
    textView.attributedText =[_attributeds objectAtIndex:indexPath.row];
    textView.frame =CGRectMake(0, 0, tableView.frame.size.width, textView.contentSize.height+20);
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSAttributedString *attributedText = [_attributeds objectAtIndex:indexPath.row];
    
    CGRect rect = [attributedText boundingRectWithSize:CGSizeMake(self.myTableView.frame.size.width-16, 100000) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return rect.size.height+16;
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
