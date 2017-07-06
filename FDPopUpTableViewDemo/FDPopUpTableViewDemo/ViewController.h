//
//  ViewController.h
//  FDPopUpTableViewDemo
//
//  Created by sino on 2017/7/6.
//  Copyright © 2017年 Evelyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDPopUpTableView.h"
@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) FDPopUpTableView *popTableView;

@end

