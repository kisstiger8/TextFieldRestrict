//
//  ViewController.m
//  TextField输入限制
//
//  Created by 雷馨 on 16/9/28.
//  Copyright © 2016年 雷馨. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+LXRestrict.h"
#import "UITextField+LXAdjust.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textField.restrictType = LXRestrictTypeOnlyDecimal;
    [self.textField3 setAutoAdjust: true];
    [self.textField4 setAutoAdjust:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
