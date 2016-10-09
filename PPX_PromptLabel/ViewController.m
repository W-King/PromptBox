//
//  ViewController.m
//  PPX_PromptLabel
//
//  Created by pipixia on 16/10/9.
//  Copyright © 2016年 pipixia. All rights reserved.
//

#import "ViewController.h"
#import "PromptView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    playBtn.frame = CGRectMake(100, 300, 100, 50);
    playBtn.backgroundColor = [UIColor redColor];
    [playBtn addTarget:self action:@selector(playClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playBtn];
    
}
- (void)playClicked
{
    [PromptView showPPXPromptMassage:@"登录成功"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
