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

@interface ViewController ()

@property (strong, nonatomic) UIView *sv;

@property (strong, nonatomic) UIView *sv1;

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
        make.center.equalTo(self.view);
        
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    //Make a subView that distance the border of superView 10.
    /**
    self.sv1 = [UIView new];
    self.sv1.backgroundColor = [UIColor redColor];
    
    [self.sv addSubview:self.sv1];
    
    [self.sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    **/
    //Make a two subViews
    UIView *redViewOne = [[UIView alloc] init];
    UIView *redViewTwo = [[UIView alloc] init];
    
    redViewOne.backgroundColor = [UIColor redColor];
    redViewTwo.backgroundColor = [UIColor redColor];
    
    [self.sv addSubview:redViewOne];
    [self.sv addSubview:redViewTwo];
    
    [redViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.sv.mas_centerY);
        make.left.equalTo(self.sv.mas_left).with.offset(padding);
//        make.top.equalTo(self.sv.mas_top).with.offset(padding);
        make.right.equalTo(redViewTwo.mas_left).with.offset(-padding);
        make.height.mas_equalTo(@150);
        make.width.equalTo(redViewTwo);
    }];
    
    [redViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.sv.mas_centerY);
        make.left.equalTo(redViewOne.mas_right).with.offset(padding);
        make.right.equalTo(self.sv.mas_right).with.offset(-padding);
        make.height.mas_equalTo(@150);
        make.width.equalTo(redViewOne);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
