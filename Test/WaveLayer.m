//
//  WaveLayer.m
//  Test
//
//  Created by LiuFeifei on 16/6/24.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "WaveLayer.h"
#import "UIColor+LJ.h"

static const NSTimeInterval kAnimationDuration = 0.5;

@interface WaveLayer ()

@property (strong, nonatomic) UIBezierPath * wavePathPre;
@property (strong, nonatomic) UIBezierPath * wavePathStart;
@property (strong, nonatomic) UIBezierPath * wavePathLow;
@property (strong, nonatomic) UIBezierPath * wavePathMid;
@property (strong, nonatomic) UIBezierPath * wavePathHigh;
@property (strong, nonatomic) UIBezierPath * wavePathComplete;

@end

@implementation WaveLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fillColor = [UIColor lj_colorWithHexString:@"40e0b0"].CGColor;
        self.path = self.wavePathStart.CGPath;
    }
    return self;
}

- (UIBezierPath *)wavePathPre
{
    if (!_wavePathPre) {
        _wavePathPre = [UIBezierPath bezierPath];
        [_wavePathPre moveToPoint:CGPointMake(0, 100)];
        [_wavePathPre addLineToPoint:CGPointMake(0, 99)];
        [_wavePathPre addLineToPoint:CGPointMake(100, 99)];
        [_wavePathPre addLineToPoint:CGPointMake(100, 100)];
        [_wavePathPre closePath];
    }
    return _wavePathPre;
}

- (UIBezierPath *)wavePathStart
{
    if (!_wavePathStart) {
        _wavePathStart = [UIBezierPath bezierPath];
        [_wavePathStart moveToPoint:CGPointMake(0, 100)];
        [_wavePathStart addLineToPoint:CGPointMake(0, 80)];
        [_wavePathStart addCurveToPoint:CGPointMake(100, 80) controlPoint1:CGPointMake(30, 70) controlPoint2:CGPointMake(40, 90)];
        [_wavePathStart addLineToPoint:CGPointMake(100, 100)];
        [_wavePathStart closePath];
    }
    return _wavePathStart;
}

- (UIBezierPath *)wavePathLow
{
    if (!_wavePathLow) {
        _wavePathLow = [UIBezierPath bezierPath];
        [_wavePathLow moveToPoint:CGPointMake(0, 100)];
        [_wavePathLow addLineToPoint:CGPointMake(0, 60)];
        [_wavePathLow addCurveToPoint:CGPointMake(100, 60) controlPoint1:CGPointMake(30, 65) controlPoint2:CGPointMake(40, 50)];
        [_wavePathLow addLineToPoint:CGPointMake(100, 100)];
        [_wavePathLow closePath];
    }
    return _wavePathLow;
}

- (UIBezierPath *)wavePathMid
{
    if (!_wavePathMid) {
        _wavePathMid = [UIBezierPath bezierPath];
        [_wavePathMid moveToPoint:CGPointMake(0, 100)];
        [_wavePathMid addLineToPoint:CGPointMake(0, 40)];
        [_wavePathMid addCurveToPoint:CGPointMake(100, 40) controlPoint1:CGPointMake(30, 30) controlPoint2:CGPointMake(40, 50)];
        [_wavePathMid addLineToPoint:CGPointMake(100, 100)];
        [_wavePathMid closePath];
    }
    return _wavePathMid;
}

- (UIBezierPath *)wavePathHigh
{
    if (!_wavePathHigh) {
        _wavePathHigh = [UIBezierPath bezierPath];
        [_wavePathHigh moveToPoint:CGPointMake(0, 100)];
        [_wavePathHigh addLineToPoint:CGPointMake(0, 20)];
        [_wavePathHigh addCurveToPoint:CGPointMake(100, 20) controlPoint1:CGPointMake(30, 25) controlPoint2:CGPointMake(40, 10)];
        [_wavePathHigh addLineToPoint:CGPointMake(100, 100)];
        [_wavePathHigh closePath];
    }
    return _wavePathHigh;
}

- (UIBezierPath *)wavePathComplete
{
    if (!_wavePathComplete) {
        _wavePathComplete = [UIBezierPath bezierPath];
        [_wavePathComplete moveToPoint:CGPointMake(0, 100)];
        [_wavePathComplete addLineToPoint:CGPointMake(0, 0)];
        [_wavePathComplete addLineToPoint:CGPointMake(100, 0)];
        [_wavePathComplete addLineToPoint:CGPointMake(100, 100)];
        [_wavePathComplete closePath];
    }
    return _wavePathComplete;
}

- (void)waveAnimate
{
    // 1
    CABasicAnimation * waveAnimationPre = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationPre.fromValue = (__bridge id _Nullable)(self.wavePathPre.CGPath);
    waveAnimationPre.toValue = (__bridge id _Nullable)(self.wavePathStart.CGPath);
    waveAnimationPre.beginTime = 0.0;
    waveAnimationPre.duration = kAnimationDuration;
    
    // 2
    CABasicAnimation * waveAnimationStart = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationStart.fromValue = (__bridge id _Nullable)(self.wavePathStart.CGPath);
    waveAnimationStart.toValue = (__bridge id _Nullable)(self.wavePathLow.CGPath);
    waveAnimationStart.beginTime = waveAnimationPre.beginTime + waveAnimationPre.duration;
    waveAnimationStart.duration = kAnimationDuration;
    
    // 3
    CABasicAnimation * waveAnimationLow = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationLow.fromValue = (__bridge id _Nullable)(self.wavePathLow.CGPath);
    waveAnimationLow.toValue = (__bridge id _Nullable)(self.wavePathMid.CGPath);
    waveAnimationLow.beginTime = waveAnimationStart.beginTime + waveAnimationStart.duration;
    waveAnimationLow.duration = kAnimationDuration;
    
    // 4
    CABasicAnimation * waveAnimationMid = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationMid.fromValue = (__bridge id _Nullable)(self.wavePathMid.CGPath);
    waveAnimationMid.toValue = (__bridge id _Nullable)(self.wavePathHigh.CGPath);
    waveAnimationMid.beginTime = waveAnimationLow.beginTime + waveAnimationLow.duration;
    waveAnimationMid.duration = kAnimationDuration;
    
    // 5
    CABasicAnimation * waveAnimationHigh = [CABasicAnimation animationWithKeyPath:@"path"];
    waveAnimationHigh.fromValue = (__bridge id _Nullable)(self.wavePathHigh.CGPath);
    waveAnimationHigh.toValue = (__bridge id _Nullable)(self.wavePathComplete.CGPath);
    waveAnimationHigh.beginTime = waveAnimationMid.beginTime + waveAnimationMid.duration;
    waveAnimationHigh.duration = kAnimationDuration;
    
    // 6
    CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[waveAnimationPre, waveAnimationStart, waveAnimationLow, waveAnimationMid, waveAnimationHigh];
    animationGroup.duration = waveAnimationHigh.beginTime + waveAnimationHigh.duration;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    [self addAnimation:animationGroup forKey:nil];
}

@end
