//
//  FDPopUpTableView.m
//  FDPopUpTableViewDemo
//
//  Created by sino on 2017/7/6.
//  Copyright © 2017年 Evelyn. All rights reserved.
//

#import "FDPopUpTableView.h"

@implementation FDPopUpTableView


// 包括确定取消按钮
- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        self.backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.backView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [self.backView addSubview:self];
        
        // header
        self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 60)];
        self.headerView.backgroundColor = [UIColor whiteColor];
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:self.headerView.frame];
        headerLabel.text = title;
        headerLabel.font = [UIFont systemFontOfSize:17];
        headerLabel.textColor = [UIColor blackColor];
        headerLabel.textAlignment = NSTextAlignmentCenter;
        [self.headerView addSubview:headerLabel];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerView.frame)+1, frame.size.width, frame.size.height-112) style:UITableViewStyleGrouped];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        // footer
        self.footerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame)+1, frame.size.width, 50)];
        self.footerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.backgroundColor = [UIColor whiteColor];
        cancelBtn.frame = CGRectMake(0, 0, frame.size.width/2, self.footerView.frame.size.height);
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        cancelBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancelBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *defaultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        defaultBtn.backgroundColor = [UIColor whiteColor];
        defaultBtn.frame = CGRectMake(CGRectGetMaxX(cancelBtn.frame)+1, 0, frame.size.width/2-1, self.footerView.frame.size.height);
        [defaultBtn setTitle:@"确定" forState:UIControlStateNormal];
        [defaultBtn setTitleColor:[UIColor colorWithRed:0/255.0 green:118/255.0 blue:255/255.0 alpha:1/1.0] forState:UIControlStateNormal];
        defaultBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [defaultBtn addTarget:self action:@selector(defaultBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.footerView addSubview:cancelBtn];
        [self.footerView addSubview:defaultBtn];
        
        [self addSubview:self.headerView];
        [self addSubview:self.footerView];
        [self addSubview:self.tableView];
        self.backgroundColor = [UIColor lightGrayColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backViewHidden:)];
        tap.delegate = self;
        [self.backView addGestureRecognizer:tap];
    }
    return  self;
}

- (instancetype)initNOButtonWithFrame:(CGRect)frame withTitle:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        self.backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.backView.backgroundColor =  [UIColor colorWithRed:40/255.0 green:67/255.0 blue:87/255.0 alpha:0.4/1.0];
        [self.backView addSubview:self];
        
        // header
        self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 44)];
        self.headerView.backgroundColor = [UIColor whiteColor];
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:self.headerView.frame];
        headerLabel.font = [UIFont systemFontOfSize:17];
        headerLabel.textColor = [UIColor colorWithRed:43/255.0 green:136/255.0 blue:229/255.0 alpha:1/1.0];
        headerLabel.text = title;
        headerLabel.textAlignment = NSTextAlignmentCenter;
        [self.headerView addSubview:headerLabel];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerView.frame)+0.5, frame.size.width, frame.size.height-44) style:UITableViewStyleGrouped];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:self.headerView];
        [self addSubview:self.tableView];
        self.backgroundColor = [UIColor lightGrayColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backViewHidden:)];
        tap.delegate = self;
        [self.backView addGestureRecognizer:tap];
    }
    return  self;
}


- (void)cancelBtnAction:(UIButton *)sender {
    self.cancelBlock(sender);
}

- (void)defaultBtnAction:(UIButton *)sender {
    self.defaultBlock(sender);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    if ([touch.view isDescendantOfView:self.tableView]) {
        return NO;
    }
    return YES;
}


- (void)backViewHidden:(UIGestureRecognizer *)gesture {
    [self.backView removeFromSuperview];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
