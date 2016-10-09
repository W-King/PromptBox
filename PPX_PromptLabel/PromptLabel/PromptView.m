//
//  PromptView.m
//  PPX_PromptLabel
//
//  Created by pipixia on 16/10/9.
//  Copyright © 2016年 pipixia. All rights reserved.
//
#define WindowFirst        [[[UIApplication sharedApplication] windows] firstObject]
#define MAINSCREEN_width   [UIScreen mainScreen].bounds.size.width
#define MAINSCREEN_height  [UIScreen mainScreen].bounds.size.height
#define MAINSCREEN_bounds  [UIScreen mainScreen].bounds

#import "PromptView.h"

static UILabel *label=nil;

@implementation PromptView

+(void)showPPXPromptMassage:(NSString*)msg
{
    UIFont *font = [UIFont systemFontOfSize:12];
    CGRect rect = [msg boundingRectWithSize:CGSizeMake(MAINSCREEN_width-20, 50) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    CGFloat width =CGRectGetWidth(rect);
    CGFloat heigh =CGRectGetHeight(rect);
    
    if (label==nil) {
        UILabel *lab =[[UILabel alloc] init];
        lab.bounds = CGRectMake(0, 0, width+10, heigh+10);
        lab.center = CGPointMake(MAINSCREEN_width/2, MAINSCREEN_height-heigh-80);
        lab.font = font;
        lab.numberOfLines =0;
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = msg;
        lab.textColor = [UIColor whiteColor];
        lab.backgroundColor = [UIColor blackColor];
        lab.layer.cornerRadius = 3;
        lab.clipsToBounds = YES;
        [WindowFirst addSubview:lab];
        label=lab;
    }
    [PromptView show];
}
+(void)show
{
    label.alpha=0;
    [UIView animateWithDuration:0.2 animations:^{
        label.alpha=1;
    } completion:^(BOOL finished) {
        //延时后显示
        dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC));
        dispatch_after(when, dispatch_get_main_queue(), ^{
            [PromptView hiden];
        });
    }];
    
}
+(void)hiden
{
    label.alpha=1;
    [UIView animateWithDuration:0.2 animations:^{
        label.alpha=0;
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
        label =nil;
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
