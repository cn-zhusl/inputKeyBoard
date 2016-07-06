//
//  EmojiTextAttachment.m
//  InputEmojiExample
//
//  Created by zhu_sl on 16/5/6.
//  Copyright © 2016年 tutuge. All rights reserved.
//

#import "EmojiTextAttachment.h"

@implementation EmojiTextAttachment

+(id)initWithImageName:(NSString *)imageName withImageTag:(NSString *)imageTag withFont:(UIFont *)font{
    
    EmojiTextAttachment *emojiTextAttachment = [EmojiTextAttachment new];
    
    //Set tag and image
    emojiTextAttachment.image = [UIImage imageNamed:imageName];
    
    if (imageTag) {
        emojiTextAttachment.emojiTag = imageTag;
    }
    
    //Set emoji size
    emojiTextAttachment.emojiSize = CGSizeMake(font.pointSize+4.5 ,font.pointSize+4.5);
    
    return emojiTextAttachment;
}

- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex {
    return CGRectMake(0, -4, _emojiSize.width, _emojiSize.height);
}
@end
