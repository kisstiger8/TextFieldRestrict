//
//  UITextField+LXRestrict.h
//  TextField输入限制
//
//  Created by 雷馨 on 16/9/28.
//  Copyright © 2016年 雷馨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXTextRestrict.h"

@interface UITextField (LXRestrict)

@property (nonatomic, assign)LXRestrictType restrictType;

@property (nonatomic, assign)NSUInteger maxTextLength;

@property (nonatomic, strong)LXTextRestrict *textRestrict;

@end
