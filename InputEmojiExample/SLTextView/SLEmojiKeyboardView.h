//
//  SLEmojiKeyboardView.h
//  InputEmojiExample
//
//  Created by zhu_sl on 16/4/25.
//  Copyright © 2016年 tutuge. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Clicked)(NSInteger select);

@interface SLEmojiKeyboardView : UIView

@property (nonatomic,copy) Clicked clicked;

@property (weak, nonatomic) IBOutlet UIPageControl *pageContr;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end
