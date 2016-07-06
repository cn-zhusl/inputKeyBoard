//
//  SLTextView.h
//  InputEmojiExample
//
//  Created by zhuSonglin on 15/12/13.
//  Copyright © 2015年 tutuge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmojiTextAttachment.h"

@interface SLTextView : UITextView<UITextViewDelegate>

@property (nonatomic,strong) UIFont * eFont;

-(void)insertEmojiTextAttachment:(EmojiTextAttachment *)emojiTextAttachment;

- (void)resetTextStyle;

@end
