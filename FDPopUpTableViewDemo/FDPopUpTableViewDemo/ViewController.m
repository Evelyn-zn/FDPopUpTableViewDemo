//
//  ViewController.m
//  FDPopUpTableViewDemo
//
//  Created by sino on 2017/7/6.
//  Copyright © 2017年 Evelyn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL flag;
}

@property (nonatomic, copy) NSString *selecStr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selecStr = @"";
    flag = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *popBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    popBtn.frame = CGRectMake(0, 64, 100, 50);
    [popBtn setTitle:@"pop-up" forState:UIControlStateNormal];
    popBtn.backgroundColor = [UIColor orangeColor];
    [popBtn addTarget:self action:@selector(popBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popBtn];
}


- (void)popBtnAction:(UIButton *)sender {
    flag = !flag;
    if (flag) {
        // 1、带有确定取消按钮的弹出视图
        self.popTableView = [[FDPopUpTableView alloc] initWithFrame:CGRectMake(40, 100, self.view.frame.size.width-80, 400) withTitle:@"请选择城市"];
        __weak ViewController *weakSelf = self;
        self.popTableView.cancelBlock = ^(UIButton *button) {
            [weakSelf.popTableView.backView removeFromSuperview];
        };
        self.popTableView.defaultBlock = ^(UIButton *button) {
            NSLog(@"------%@", weakSelf.selecStr);
            [weakSelf.popTableView.backView removeFromSuperview];
        };
    }else {
        // 2、无确定取消按钮的弹出视图
        self.popTableView = [[FDPopUpTableView alloc] initNOButtonWithFrame:CGRectMake(40, 100, self.view.frame.size.width-80, 400) withTitle:@"请选择"];
    }
    
    self.popTableView.layer.masksToBounds = YES;
    self.popTableView.layer.cornerRadius = 10;
    self.popTableView.tableView.dataSource = self;
    self.popTableView.tableView.delegate = self;
    [[UIApplication sharedApplication].keyWindow addSubview:self.popTableView.backView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cityName %ld", indexPath.row];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (flag) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        self.selecStr = cell.textLabel.text;
    }else {
        NSString *result = [NSString stringWithFormat:@"cityName %ld", indexPath.row];
        NSLog(@"%@", result);
        [self.popTableView.backView removeFromSuperview];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
