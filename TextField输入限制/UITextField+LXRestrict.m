//
//  UITextField+LXRestrict.m
//  TextField输入限制
//
//  Created by 雷馨 on 16/9/28.
//  Copyright © 2016年 雷馨. All rights reserved.
//

#import "UITextField+LXRestrict.h"
#import <objc/runtime.h>

@implementation UITextField (LXRestrict)

//定义常量 必须是C字符串
static char *LXRestrictTypeKey = "LXRestrictTypeKey";
static char *LXTextRestrictKey = "LXTextRestrictKey";
static char *maxTextLengthKey = "maxTextLengthKey";

- (LXRestrictType)restrictType {
    return [objc_getAssociatedObject(self, LXRestrictTypeKey)integerValue];
}

- (void)setRestrictType:(LXRestrictType)restrictType {
    objc_setAssociatedObject(self, LXRestrictTypeKey, @(restrictType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.textRestrict = [LXTextRestrict textRestrictWithRestrictType:restrictType];
}

- (LXTextRestrict *)textRestrict {
    return objc_getAssociatedObject(self, LXTextRestrictKey);
}

- (void)setTextRestrict:(LXTextRestrict *)textRestrict {
    if (self.textRestrict) {
        [self removeTarget:self.text action:@selector(textDidChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    textRestrict.maxLength = self.maxTextLength;
    [self addTarget:textRestrict action:@selector(textDidChanged:) forControlEvents:UIControlEventEditingChanged];
    objc_setAssociatedObject(self, LXTextRestrictKey, textRestrict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSUInteger)maxTextLength {
    return [objc_getAssociatedObject(self, maxTextLengthKey)integerValue];
}

- (void)setMaxTextLength:(NSUInteger)maxTextLength {
    objc_setAssociatedObject(self, maxTextLengthKey, @(maxTextLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
