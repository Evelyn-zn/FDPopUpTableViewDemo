//
//  FDPopUpTableView.h
//  FDPopUpTableViewDemo
//
//  Created by sino on 2017/7/6.
//  Copyright © 2017年 Evelyn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CancelBtnAction)(UIButton *);
typedef void(^DefaultBtnAction)(UIButton *);

@interface FDPopUpTableView : UIView<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *backView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;


@property (nonatomic, copy) CancelBtnAction cancelBlock;
@property (nonatomic, copy) DefaultBtnAction defaultBlock;
@property (nonatomic, strong) UIView *footerView;
- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title;


// 没有确定、取消按钮
- (instancetype)initNOButtonWithFrame:(CGRect)frame withTitle:(NSString *)title;

@end
