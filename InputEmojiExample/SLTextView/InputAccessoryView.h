//
//  InputAccessoryView.h
//  InputEmojiExample
//
//  Created by zhuSonglin on 15/12/13.
//  Copyright © 2015年 tutuge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLTextView.h"
#import "EmojiTextAttachment.h"
#import "NSAttributedString+EmojiExtension.h"

typedef enum InputViewStartType{
    
    InputViewStartNone,
    InputViewStartShow,
    InputViewStartTop,
    
}InputViewStartType;

typedef void(^InputAccessoryBlock)(CGFloat y,BOOL isEnd);
typedef void(^OutputContentBlock)(NSString * string , NSAttributedString *attributedText);

@interface InputAccessoryView : UIView<UITextViewDelegate>

//切换表情按钮
@property (weak, nonatomic) IBOutlet UIButton *showEmoje;

//发送按钮
@property (weak, nonatomic) IBOutlet UIButton *sendMessge;

//自定义textView
@property (weak, nonatomic) IBOutlet SLTextView *textView;

//设置字体
@property (nonatomic,strong) UIFont* font;

//自定义表情集合
@property (strong, nonatomic) NSArray * imageTag;

//输入框开始位置
@property (nonatomic,assign) InputViewStartType inputViewStartType;

//输入内容对外界面回调处理
@property (nonatomic, copy) InputAccessoryBlock block;

//发送内容回调处理
@property (nonatomic, copy) OutputContentBlock outBlock;

//是否输入自定义表情
@property (nonatomic,assign) BOOL ShowEmojiKeyBoard;

//提示语
@property (nonatomic,copy) NSString * placeholder;

//最大输出长度；
@property (nonatomic,assign) NSInteger  maxContentLength;

//实力方法
-(instancetype)initWithStartShow:(InputViewStartType)isShow;

@end
