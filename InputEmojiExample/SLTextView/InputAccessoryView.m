//
//  InputAccessoryView.m
//  InputEmojiExample
//
//  Created by zhuSonglin on 15/12/13.
//  Copyright © 2015年 tutuge. All rights reserved.
//

#import "InputAccessoryView.h"
//#import "SLInputView.h"
#import "SLEmojiKeyboardView.h"
@interface InputAccessoryView ()

@property(nonatomic,assign) BOOL ISInputEmojie;

@property(nonatomic,strong) SLEmojiKeyboardView * inputEmoje;

@property(nonatomic,assign) CGFloat keyBoardY;

@property(nonatomic,assign) CGFloat oldH;

@property(nonatomic,assign) BOOL isInputing;

@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;

@property (nonatomic, strong) NSMutableArray * contentArray;

@property (nonatomic, assign) CGFloat selfFramHight;

@end

@implementation InputAccessoryView

-(instancetype)initWithStartShow:(InputViewStartType)startShow{
    
    self =[[[NSBundle mainBundle] loadNibNamed:@"InputAccessoryView" owner:nil options:nil] firstObject];
    if (self) {
        
        _textView.delegate =self;
        _textView.eFont = [UIFont systemFontOfSize:16.0f];
        _oldH = _textView.frame.size.height;
        _inputViewStartType = startShow;
        _ShowEmojiKeyBoard = YES;
        _maxContentLength= 0xffff;
        self.layer.borderColor = [UIColor colorWithRed:0.8234 green:0.8234 blue:0.8234 alpha:1.0].CGColor;
        self.layer.borderWidth = 0.5;
        
        _sendMessge.layer.cornerRadius = 3.0;
        _sendMessge.layer.borderColor = [UIColor colorWithRed:0.8234 green:0.8234 blue:0.8234 alpha:1.0].CGColor;
        _sendMessge.layer.borderWidth = 0.6;
        
        _textView.layer.cornerRadius = 3.0;
        _textView.layer.borderColor = [UIColor colorWithRed:0.8234 green:0.8234 blue:0.8234 alpha:1.0].CGColor;
        _textView.layer.borderWidth = 0.6;
        
        _contentArray = [[NSMutableArray alloc] init];
        
        _selfFramHight= self.frame.size.height;
        
        switch (startShow) {
            case InputViewStartShow:
            {
                self.frame = CGRectMake(0,[[UIScreen mainScreen] bounds].size.height-self.frame.size.height, [[UIScreen mainScreen] bounds].size.width, _selfFramHight);
            }
                
                break;
            case InputViewStartNone:
            {
                self.frame = CGRectMake(0,[[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, _selfFramHight);
            }
                break;
            default:
            {
                self.frame = CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, _selfFramHight);
            }
                break;
        }
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardNotification:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardNotification:) name:UIKeyboardWillShowNotification object:nil];
    }
    
    return self;
}

-(void)setShowEmojiKeyBoard:(BOOL)ShowEmojiKeyBoard{
    
    _ShowEmojiKeyBoard = ShowEmojiKeyBoard;
    
    if (_ShowEmojiKeyBoard==NO) {
        _leftConstraint.constant = -28;
        _showEmoje.hidden = YES;
    }else{
        _showEmoje.hidden = NO;
    }
}

-(void)setPlaceholder:(NSString *)placeholder{
    
    _placeholder = placeholder;
    
    _placeholderLabel.text = _placeholder;
}

- (IBAction)showEmojeAction:(id)sender {
    
    __weak typeof(self) weakSelf =self;
    if (_ISInputEmojie==NO) {
        _ISInputEmojie = YES;
        if (!_inputEmoje) {
            _inputEmoje =[[SLEmojiKeyboardView alloc] init];
            _inputEmoje.clicked=^(NSInteger selected){
            
                [weakSelf insertEmoji:selected];
            };
        }
        
        [self.textView setInputView:_inputEmoje];
        self.textView.userInteractionEnabled = NO;
        
    }else{
        _ISInputEmojie = NO;
        [self.textView setInputView:nil];
        self.textView.userInteractionEnabled = YES;
    }
    
    [self.textView becomeFirstResponder];
    [self.textView reloadInputViews];
    
}

#pragma mark - Action

- (void)insertEmoji:(NSInteger )seclect {
    //Create emoji attachment
    
    if (seclect==10000||seclect==10001||seclect==10002) {

        if (_textView.text.length!=0) {
            
            [_textView.textStorage deleteCharactersInRange:NSMakeRange(_textView.selectedRange.location - 1, 1)];
        }
        
    }else{
        
        //Set tag and image
        NSString * imageTag =nil;
        if (_imageTag) {
            
            imageTag = [_imageTag objectAtIndex:seclect];
        }else{
            
            imageTag = [NSString stringWithFormat:@"~/%02td",seclect];
        }
        
        EmojiTextAttachment *emojiTextAttachment = [EmojiTextAttachment initWithImageName:[NSString stringWithFormat:@"mms_face_%02td",seclect] withImageTag:imageTag withFont:_textView.eFont];
        
        //Insert emoji image
        [_textView insertEmojiTextAttachment:emojiTextAttachment];
        
    }
    
    //Reset text style
    [_textView resetTextStyle];
    
    [self textViewDidChange:_textView];
    
}


-(void)textViewDidChange:(UITextView *)textView{
    
    if (textView.text.length==0) {
        textView.backgroundColor = [UIColor clearColor];
        [_sendMessge setTitleColor:[UIColor colorWithRed:0.9176 green:0.9176 blue:0.9176 alpha:1.0] forState:UIControlStateNormal];
    }else{
        textView.backgroundColor = [UIColor whiteColor];
        [_sendMessge setTitleColor:[UIColor colorWithRed:0.5833 green:0.5808 blue:0.592 alpha:1.0] forState:UIControlStateNormal];
    }
    
    
    [UIView animateWithDuration:0.4f animations:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            CGFloat dtH =textView.contentSize.height -_oldH;
            NSLog(@" 1 dtH %f",dtH);
            if (textView.contentSize.height<74||(_oldH<=36&&textView.contentSize.height>=74)) {
                
                if (_oldH!= textView.contentSize.height) {
                    
                    if (dtH>=0) {
                        if (self.frame.size.height+dtH>74) {
                            
                            dtH = 74-self.frame.size.height;
                        }

                        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height+dtH);
                        
                        if (_block) {
                            _block((_ISInputEmojie == NO) ? self.keyBoardY+_selfFramHight-1+dtH : self.keyBoardY+_selfFramHight-1+dtH,NO);
                        }
                        
                    }else{
                        if (textView.contentSize.height>74) {
                            
                            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
                        }else{
                            
                            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, textView.contentSize.height+10);
                            
                            if (textView.text.length!=0) {

                                if (_block) {
                                    _block((_ISInputEmojie == NO) ? self.keyBoardY+_selfFramHight-1+dtH : self.keyBoardY+_selfFramHight-1+dtH,NO);
                                }
                            }
                        }
                    }
                    _oldH = textView.contentSize.height;
                }
                
                
                
            }else if(textView.text.length==0){
                
                switch (_inputViewStartType) {
                    case InputViewStartShow:
                    case InputViewStartNone:
                    {
                       self.frame = CGRectMake(self.frame.origin.x,[[UIScreen mainScreen] bounds].size.height-(_keyBoardY+self.frame.size.height) , self.frame.size.width, _selfFramHight);
                    }
                        break;
                    default:
                    {
                        self.frame = CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, _selfFramHight);
                    }
                        break;
                }
                
            }

            switch (_inputViewStartType) {
                case InputViewStartShow:
                case InputViewStartNone:
                {
                    if (_isInputing==YES) {
                        
                        self.frame = CGRectMake(self.frame.origin.x, [[UIScreen mainScreen] bounds].size.height-(_keyBoardY+self.frame.size.height), self.frame.size.width, self.frame.size.height);
                    }else{
                        
                        self.frame = CGRectMake(self.frame.origin.x, [[UIScreen mainScreen] bounds].size.height-self.frame.size.height, self.frame.size.width, self.frame.size.height);
                    }
                    
                }
                    break;
                default:
                {
                    self.frame = CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, self.frame.size.height);
                }
                    break;
            }

            [textView setContentOffset:CGPointMake(0, textView.contentSize.height-self.frame.size.height+8) animated:NO];

        });
    }];
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    return YES;
}


- (IBAction)becomingTextView:(id)sender {
    
    _ISInputEmojie = NO;
    self.textView.userInteractionEnabled =YES;
    [self.textView becomeFirstResponder];
    [self.textView setInputView:nil];
    [self.textView reloadInputViews];

}
- (IBAction)sendButton:(id)sender {
    
    if (_maxContentLength<_textView.attributedText.length) {
        
        _textView.attributedText = [_textView.attributedText attributedSubstringFromRange:NSMakeRange(0, _maxContentLength)];
    }
    
    if (_outBlock) {
        _outBlock([_textView.attributedText getPlainString],self.textView.attributedText);
    }
    
    self.textView.text = @"";
    [self textViewDidChange:_textView];
    [self.textView resignFirstResponder];
    _ISInputEmojie = NO;
    
}


- (void)onKeyboardNotification:(NSNotification *)notification {
    //Reset constraint constant by keyboard height
    //Animate change
    
    if (_inputViewStartType==InputViewStartTop) {
        
        return;
    }
    
    CGRect keyboardFrame = ((NSValue *) notification.userInfo[UIKeyboardFrameEndUserInfoKey]).CGRectValue;
    self.keyBoardY =keyboardFrame.size.height;
    [UIView animateWithDuration:0.6f animations:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
        
            if ([notification.name isEqualToString:UIKeyboardWillShowNotification]) {
                
                self.frame = CGRectMake(0, keyboardFrame.origin.y-self.frame.size.height, self.frame.size.width, self.frame.size.height);

                if (_block) {
                    _block((_ISInputEmojie == NO) ? self.keyBoardY+_selfFramHight-1 : self.keyBoardY+_selfFramHight-1,NO);
                }
                
                self.isInputing = YES;
                
            } else if ([notification.name isEqualToString:UIKeyboardWillHideNotification]) {
                
                self.frame = CGRectMake(0, (_inputViewStartType == InputViewStartShow) ? [[UIScreen mainScreen] bounds].size.height-self.frame.size.height : [[UIScreen mainScreen] bounds].size.height, self.frame.size.width, self.frame.size.height);
                
                if (_block) {
                    _block(_selfFramHight,YES);
                }
                
                self.isInputing = NO;
            }
            
        });
        
    }];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
