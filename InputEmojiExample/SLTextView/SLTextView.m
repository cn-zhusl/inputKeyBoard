//
//  SLTextView.m
//  InputEmojiExample
//
//  Created by zhuSonglin on 15/12/13.
//  Copyright © 2015年 tutuge. All rights reserved.
//

#import "SLTextView.h"


@implementation SLTextView

-(instancetype)init{
    self = [super init];
    
    if (self) {
        _eFont = [UIFont systemFontOfSize:16.0f];
    }
    
    return self;
}

-(void)insertEmojiTextAttachment:(EmojiTextAttachment *)emojiTextAttachment{
    
    //Insert emoji image
    [self.textStorage insertAttributedString:[NSAttributedString attributedStringWithAttachment:emojiTextAttachment]
                                          atIndex:self.selectedRange.location];
    
    //Move selection location
    self.selectedRange = NSMakeRange(self.selectedRange.location + 1, self.selectedRange.length);
    
}

-(void)setEFont:(UIFont *)eFont{
    
    _eFont = eFont;
    [super setFont:_eFont];
    self.font = _eFont;
}

- (void)resetTextStyle {
    //After changing text selection, should reset style.
    NSRange wholeRange = NSMakeRange(0, self.textStorage.length);
    
    [self.textStorage removeAttribute:NSFontAttributeName range:wholeRange];
    
    [self.textStorage addAttribute:NSFontAttributeName value:_eFont range:wholeRange];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
