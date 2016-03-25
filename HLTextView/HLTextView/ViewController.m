//
//  ViewController.m
//  HLTextView
//
//  Created by Seven on 16/1/21.
//  Copyright © 2016年 韩工 email:handafa@126.com QQ:2229251338 承接APP开发. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _textView.layer.borderWidth = 0.5f;
    _textView.layer.borderColor = [UIColor grayColor].CGColor;
    _textView.hintText = @"谢谢您的使用";
    [_textView useLimit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
