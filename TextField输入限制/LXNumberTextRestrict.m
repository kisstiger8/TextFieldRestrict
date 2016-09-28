//
//  LXNumberTextRestrict.m
//  TextField输入限制
//
//  Created by 雷馨 on 16/9/28.
//  Copyright © 2016年 雷馨. All rights reserved.
//

#import "LXNumberTextRestrict.h"

@implementation LXNumberTextRestrict

- (void)textDidChanged: (UITextField *)textField {
    textField.text = kFilterString(textField.text, ^BOOL(NSString *aString) {
        return kMatchStringFormat(aString, @"^\\d$");
    });
}

@end
