//
//  HLTextView.m
//  HLTextView
//
//  Created by Seven on 16/1/21.
//  Copyright © 2016年 韩工 email:handafa@126.com QQ:2229251338 承接APP开发. All
//  rights reserved.
//

#import "HLTextView.h"

@implementation HLTextView

/**
 *  @author 韩工, 16-01-21 21:01:51
 *
 *  @brief 初始化大小时调用,xib上直接调用
 *
 *  @param frame
 *
 *  @return
 *
 *  @since 1.0
 */
- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self setup];
  }
  return self;
}

/**
 *  @author 韩工, 16-01-21 21:01:21
 *
 *  @brief nsbundle 调用
 *
 *  @since 1.0
 */
- (void)awakeFromNib {
  [self setup];
}

/**
 *  @author 韩工, 16-01-21 21:01:38
 *
 *  @brief 初始化
 *
 *  @since 1.0
 */
- (void)setup {
  [[NSNotificationCenter defaultCenter]
      addObserver:self
         selector:@selector(beginEditing)
             name:UITextViewTextDidBeginEditingNotification
           object:self];
  [[NSNotificationCenter defaultCenter]
      addObserver:self
         selector:@selector(endEditing)
             name:UITextViewTextDidEndEditingNotification
           object:self];
  [[NSNotificationCenter defaultCenter]
      addObserver:self
         selector:@selector(textDidChanged)
             name:UITextViewTextDidChangeNotification
           object:self];

  self.userTextColor = [UIColor blackColor];
  self.hintTextColor = [UIColor grayColor];
  self.limitFont = [UIFont systemFontOfSize:10.0f];
  self.limitTextColor = [UIColor blackColor];
  self.textColor = self.userTextColor;
}

- (void)useLimit {
  if (_limitTextCount || _limitTextCount == 0) {
    _limitTextCount = 100; // 默认 100
  }

  _limitLable = [[UILabel alloc]
      initWithFrame:CGRectMake(self.frame.size.width - 90.0f,
                               self.frame.size.height - 30.0f, 80.0f, 20.0f)];
  _limitLable.text =
      [NSString stringWithFormat:@"还可以输入%zd字", _limitTextCount];
  _limitLable.font = _limitFont;
  _limitLable.textColor = _limitTextColor;
  [self addSubview:_limitLable];
}

#pragma mark - Editing
- (void)setUserTextColor:(UIColor *)realTextColor {
  _userTextColor = realTextColor;
  self.textColor = self.userTextColor;
}

- (void)beginEditing {

  if (![self.text isEqualToString:self.hintText]) {
    [super setText:self.userText];
    self.textColor = self.userTextColor;
  }

  // 之前显示的是 placeholder
  if ([self.text isEqualToString:self.hintText]) {
    // 设置文字
    [super setText:self.userText];

    // 设置颜色
    self.textColor = self.userTextColor;
  }

  // 之前显示的是正常的文字
  else if ([self.userText isEqualToString:@""] || self.userText == nil) {
    [super setText:@""];
  }
}

- (void)endEditing {
  if (![self.userText isEqualToString:@""] && self.userText != nil) {
    [super setText:self.userText];
    self.textColor = self.userTextColor;
  } else {
    [super setText:self.hintText];
    self.textColor = self.hintTextColor;
  }
}

- (void)textDidChanged {

  if ([self.userText length] >= _limitTextCount) {
    [self setText:self.userText];
    return;
  }

  self.userText = [super text];
  _limitLable.text =
      [NSString stringWithFormat:@"还可以输入%zd字",
                                 (_limitTextCount - [self.userText length])];
}

#pragma mark - Setter / Getter
- (void)setText:(NSString *)text {
  self.userText = text;
  [super setText:text];
}

- (void)setHintText:(NSString *)hintText {
  _hintText = hintText;

  // 没有用户输入的文字
  if ([self.realText isEqualToString:@""] || self.realText == nil) {
    [super setText:hintText];
    self.textColor = self.hintTextColor;
  }
}

- (void)setHintTextColor:(UIColor *)hintTextColor {
  _hintTextColor = hintTextColor;

  if ([self.userText isEqualToString:@""] || self.userText == nil) {
    self.textColor = hintTextColor;
  }
}

- (NSString *)text {
  return self.userText;
}

- (NSString *)realText {
  return [super text];
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
