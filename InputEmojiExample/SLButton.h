//
//  SLButton.h
//  InputEmojiExample
//
//  Created by zhu_sl on 15/12/22.
//  Copyright © 2015年 tutuge. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum SLButtonClieckedType{
    
    SLButtonClieckedCircular,
    SLButtonClieckedRectangular
    
}SLButtonClieckedType;

@interface SLButton : UIButton

@property (nonatomic,assign) SLButtonClieckedType clieckedType;

@end
