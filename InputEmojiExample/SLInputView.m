//
//  SLInputView.m
//  InputEmojiExample
//
//  Created by zhuSonglin on 15/12/13.
//  Copyright © 2015年 tutuge. All rights reserved.
//

#import "SLInputView.h"

@implementation SLInputView

-(instancetype)init{
    
    self =[[[NSBundle mainBundle] loadNibNamed:@"SLInputView" owner:nil options:nil] firstObject];
    
//    _scrollView.delegate = self;
    
    return self;
}
- (IBAction)clieckAction:(UIButton *)sender {
    
    if (_clicked) {
        _clicked((NSUInteger)sender.tag);
    }
    
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    NSInteger  page = targetContentOffset->x/scrollView.frame.size.width;
    
    _pageContr.currentPage = page;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
