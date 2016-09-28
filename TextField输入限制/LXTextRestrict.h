//
//  LXTextRestrict.h
//  TextField输入限制
//
//  Created by 雷馨 on 16/9/28.
//  Copyright © 2016年 雷馨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef BOOL(^LXStringFilter) (NSString *aString);
static inline NSString *kFilterString(NSString *handleString, LXStringFilter subStringFilter) {
    NSMutableString *modifyString = handleString.mutableCopy;
    for (NSInteger idx = 0; idx < modifyString.length; ) {
        NSString *subString = [modifyString substringWithRange:NSMakeRange(idx, 1)];
        if (subStringFilter(subString)) {
            idx++;
        } else {
            [modifyString deleteCharactersInRange:NSMakeRange(idx, 1)];
        }
    }
    return modifyString;
}

static inline BOOL kMatchStringFormat(NSString * aString, NSString * matchFormat)
{
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", matchFormat];
    return [predicate evaluateWithObject: aString];
}

typedef NS_ENUM(NSInteger, LXRestrictType)
{
    LXRestrictTypeOnlyNumber = 1, ///只允许输入数字
    LXRestrictTypeOnlyDecimal = 2, ///只允许输入实数 包括.
    LXRestrictTypeOnlyCharacter = 3, ///只允许非中文输入
};

@interface LXTextRestrict : NSObject

@property (nonatomic, assign)NSUInteger maxLength;
@property (nonatomic, readonly)LXRestrictType restrictType;

+(instancetype)textRestrictWithRestrictType:(LXRestrictType)restrictType;
- (void)textDidChanged: (UITextField *)textField;

@end
