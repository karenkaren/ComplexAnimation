//
//  UIColor+LJ.h
//  LJKit
//
//  Created by LiuFeifei on 16/4/12.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LJ)

+ (UIColor *)lj_colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)lj_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
