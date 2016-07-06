//
//  EmojiTextAttachment.h
//  InputEmojiExample
//
//  Created by zhu_sl on 16/5/6.
//  Copyright © 2016年 tutuge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmojiTextAttachment : NSTextAttachment
@property(strong, nonatomic) NSString *emojiTag;
@property(assign, nonatomic) CGSize emojiSize;  //For emoji image size

+(id)initWithImageName:(NSString *)imageName withImageTag:(NSString *)imageTag withFont:(UIFont *)font;

@end
