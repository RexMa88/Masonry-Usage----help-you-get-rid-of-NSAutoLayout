//
//  ViewController.m
//  HowToUseMasony
//
//  Created by Rex Ma on 15/8/17.
//  Copyright (c) 2015年 Rex Ma. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

#define padding 10
#define topMargin 70

@interface ViewController ()

@property (strong, nonatomic) UIView *sv;

@property (strong, nonatomic) UIView *sv1;

@property (strong, nonatomic) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    //create superView sv in our project
    self.sv = [UIView new];
    self.sv.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.sv];
    
    [self.sv mas_makeConstraints:^(MASConstraintMaker *make) {
        //let the sv center in superView center;
//        make.center.equalTo(self.view);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).with.offset(topMargin);
//        make.size.mas_equalTo(CGSizeMake(300, 300));
        make.left.equalTo(self.view.mas_left).with.offset(padding);
        make.right.equalTo(self.view.mas_right).with.offset(-padding);
        make.height.equalTo(@300);
    }];
    
    //Make a subView that distance the border of superView 10.
    
    self.sv1 = [UIView new];
    self.sv1.backgroundColor = [UIColor redColor];
    
    [self.sv addSubview:self.sv1];
    
    [self.sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    self.button = [UIButton new];
    self.button.backgroundColor = [UIColor orangeColor];
    [self.button setTitle:@"切换" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(translateState:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(padding);
        make.right.equalTo(self.view.mas_right).with.offset(-padding);
        make.height.equalTo(@50);
        make.top.equalTo(self.sv.mas_bottom).with.offset(padding);
    }];
    //Make a two subViews
//    UIView *redViewOne = [[UIView alloc] init];
//    UIView *redViewTwo = [[UIView alloc] init];
//    
//    redViewOne.backgroundColor = [UIColor redColor];
//    redViewTwo.backgroundColor = [UIColor redColor];
//    
//    [self.sv addSubview:redViewOne];
//    [self.sv addSubview:redViewTwo];
//    
//    [redViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.sv.mas_centerY);
//        make.left.equalTo(self.sv.mas_left).with.offset(padding);
//        make.right.equalTo(redViewTwo.mas_left).with.offset(-padding);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(redViewTwo);
//    }];
//    
//    [redViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.sv.mas_centerY);
//        make.left.equalTo(redViewOne.mas_right).with.offset(padding);
//        make.right.equalTo(self.sv.mas_right).with.offset(-padding);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(redViewOne);
//    }];


self.subViewOne = [UIView new];
    self.subViewOne.backgroundColor = [UIColor redColor];
    [self.sv addSubview:self.subViewOne];
    
    [self.subViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sv.mas_left).with.offset(padding);
        make.top.equalTo(self.sv.mas_top).with.offset(padding);
        make.height.mas_equalTo(@30);
        make.width.mas_equalTo(@30);
    }];
    
    self.subViewTwo = [UIView new];
    self.subViewTwo.backgroundColor = [UIColor redColor];
    [self.sv addSubview:self.subViewTwo];
    
    [self.subViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sv.mas_right).with.offset(padding);
        make.top.equalTo(self.sv.mas_top).with.offset(60);
        make.height.mas_equalTo(@100);
        make.width.mas_equalTo(@100);
    }];
}

- (void)translateState:(UIButton *)button{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
