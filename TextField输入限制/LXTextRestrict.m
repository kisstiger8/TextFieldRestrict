//
//  LXTextRestrict.m
//  TextField输入限制
//
//  Created by 雷馨 on 16/9/28.
//  Copyright © 2016年 雷馨. All rights reserved.
//

#import "LXTextRestrict.h"
#import "LXNumberTextRestrict.h"
#import "LXDecimalTextRestrict.h"
#import "LXCharacterTextRestrict.h"

@interface LXTextRestrict()

@property (nonatomic, readwrite)LXRestrictType restrictType;

@end

@implementation LXTextRestrict

+(instancetype)textRestrictWithRestrictType:(LXRestrictType)restrictType {
    LXTextRestrict *textRestrict;
    switch (restrictType) {
        case LXRestrictTypeOnlyNumber:
            textRestrict = [[LXNumberTextRestrict alloc]init];
            break;
            
        case LXRestrictTypeOnlyDecimal:
            textRestrict = [[LXDecimalTextRestrict alloc]init];
            break;
        
        case LXRestrictTypeOnlyCharacter:
            textRestrict = [[LXCharacterTextRestrict alloc]init];
            break;
            
        default:
            break;
    }
    textRestrict.maxLength = NSUIntegerMax;
    textRestrict.restrictType = restrictType;
    return textRestrict;
}

- (void)textDidChanged: (UITextField *)textField {
    
}

@end
