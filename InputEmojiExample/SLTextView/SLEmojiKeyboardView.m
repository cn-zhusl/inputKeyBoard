//
//  SLEmojiKeyboardView.m
//  InputEmojiExample
//
//  Created by zhu_sl on 16/4/25.
//  Copyright © 2016年 tutuge. All rights reserved.
//

#import "SLEmojiKeyboardView.h"

@implementation SLEmojiKeyboardView

-(instancetype)init{
    
    self =[[[NSBundle mainBundle] loadNibNamed:@"SLEmojiKeyboardView" owner:nil options:nil] firstObject];
    
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

@end
