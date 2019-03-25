//
//  ViewController.m
//  testBtnCategory
//
//  Created by 福利郑 on 2019/3/15.
//  Copyright © 2019 福利郑. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Extension.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.btn.backgroundColor = [UIColor redColor];
    self.btn.checkLogin = YES;
    [self.btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.btn];
}

-(void)btnClick:(id)sender{
    NSLog(@"btnClick:");
}

@end
