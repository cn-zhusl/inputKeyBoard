//
//  SLButton.m
//  InputEmojiExample
//
//  Created by zhu_sl on 15/12/22.
//  Copyright © 2015年 tutuge. All rights reserved.
//

#import "SLButton.h"

@implementation SLButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    //首先调用父类的方法确定点击的区域确实在按钮的区域中
    BOOL res = [super pointInside:point withEvent:event];
    if (res) {
        //绘制一个圆形path
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        
        if (_clieckedType==SLButtonClieckedRectangular) {
            
            path= [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height/2)];
        }
        
        if ([path containsPoint:point]) {
            //如果在path区域内，返回YES
            return YES;
        }
        return NO;
    }
    return NO;
}

@end
