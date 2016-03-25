//
//  HLTextView.h
//  HLTextView
//
//  Created by Seven on 16/1/21.
//  Copyright © 2016年 韩工 email:handafa@126.com QQ:2229251338 承接APP开发. All
//  rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLTextView : UITextView {
  UILabel *_limitLable;
}

/**
 *  @author 韩工, 16-01-21 20:01:29
 *
 *  @brief 提示内容  Text
 *
 *  @since 1.0
 */
@property(copy, nonatomic) NSString *hintText;

/**
 *  @author 韩工, 16-01-21 20:01:21
 *
 *  @brief 提示字体颜色
 *
 *  @since 1.0
 */
@property(strong, nonatomic) UIColor *hintTextColor;

/**
 *  @author 韩工, 16-01-21 21:01:52
 *
 *  @brief 用户输入的文字
 *
 *  @since 1.0
 */
@property(strong, nonatomic) NSString *userText;

/**
 *  @author 韩工, 16-01-21 21:01:12
 *
 *  @brief 用户设置的文字颜色
 *
 *  @since 1.0
 */
@property(strong, nonatomic) UIColor *userTextColor;

/**
 *  @author 韩工, 16-01-21 20:01:19
 *
 *  @brief 限制字数
 *
 *  @since 1.0
 */
@property(assign, nonatomic) NSInteger limitTextCount;

/**
 *  @author 韩工, 16-01-21 21:01:25
 *
 *  @brief 限制字体
 *
 *  @since 1.0
 */
@property(strong, nonatomic) UIFont *limitFont;

/**
 *  @author 韩工, 16-01-21 21:01:58
 *
 *  @brief 限制字体的颜色
 *
 *  @since 1.0
 */
@property(strong, nonatomic) UIColor *limitTextColor;
/**
 *  @author 韩工, 16-01-21 20:01:37
 *
 *  @brief 使用字数限制这一条件
 *
 *  @since 1.0
 */
- (void)useLimit;
/**
 *  @author 韩工, 16-01-21 20:01:47
 *
 *  @brief 编辑开始时调用此方法
 *
 *  @since 1.0
 */
- (void)beginEditing;

/**
 *  @author 韩工, 16-01-21 20:01:41
 *
 *  @brief 编辑已经结束后调用此方法
 *
 *  @since 1.0
 */
- (void)endEditing;

@end
