//
//  SLInputView.h
//  InputEmojiExample
//
//  Created by zhuSonglin on 15/12/13.
//  Copyright © 2015年 tutuge. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Clicked)(NSInteger select);

@interface SLInputView : UIView<UIScrollViewDelegate>

@property (nonatomic,copy) Clicked clicked;

@property (weak, nonatomic) IBOutlet UIPageControl *pageContr;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
