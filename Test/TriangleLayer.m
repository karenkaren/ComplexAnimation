//
//  TriangleLayer.m
//  Test
//
//  Created by LiuFeifei on 16/6/22.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import "TriangleLayer.h"
#import "UIColor+LJ.h"

static const CGFloat paddingSpace = 30.0;

@interface TriangleLayer ()

@property (nonatomic, strong) UIBezierPath * smallTrianglePath;
@property (strong, nonatomic) UIBezierPath * leftTrianglePath;
@property (strong, nonatomic) UIBezierPath * rightTrianglePath;
@property (strong, nonatomic) UIBezierPath * topTrianglePath;

@end

@implementation TriangleLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fillColor = [UIColor lj_colorWithHexString:@"#da70d6"].CGColor;
        self.strokeColor = [UIColor lj_colorWithHexString:@"#da70d6"].CGColor;
        self.lineWidth = 7.0;
        self.lineCap = kCALineCapRound;
        self.lineJoin = kCALineJoinRound;
        self.path = self.smallTrianglePath.CGPath;
    }
    return self;
}

- (UIBezierPath *)smallTrianglePath
{
    if (!_smallTrianglePath) {
        _smallTrianglePath = [[UIBezierPath alloc] init];
        [_smallTrianglePath moveToPoint:CGPointMake(5.0 + paddingSpace, 95.0)];
        [_smallTrianglePath addLineToPoint:CGPointMake(50.0, 12.5 + paddingSpace)];
        [_smallTrianglePath addLineToPoint:CGPointMake(95.0 - paddingSpace, 95.0)];
        [_smallTrianglePath closePath];
    }
    return _smallTrianglePath;
}

- (void)triangleAnimate
{
    // left
    CABasicAnimation * triangleAnimationLeft = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationLeft.fromValue = (__bridge id _Nullable)(self.smallTrianglePath.CGPath);
    triangleAnimationLeft.toValue = (__bridge id _Nullable)(self.leftTrianglePath.CGPath);
    triangleAnimationLeft.beginTime = 0.0;
    triangleAnimationLeft.duration = 0.3;
    
    // right
    CABasicAnimation * triangleAnimationRight = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationRight.fromValue = (__bridge id _Nullable)(self.leftTrianglePath.CGPath);
    triangleAnimationRight.toValue = (__bridge id _Nullable)(self.rightTrianglePath.CGPath);
    triangleAnimationRight.beginTime = triangleAnimationLeft.beginTime + triangleAnimationLeft.duration;
    triangleAnimationRight.duration = 0.3;
    
    // top
    CABasicAnimation * triangleAnimationTop = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationTop.fromValue = (__bridge id _Nullable)(self.rightTrianglePath.CGPath);
    triangleAnimationTop.toValue = (__bridge id _Nullable)(self.topTrianglePath.CGPath);
    triangleAnimationTop.beginTime = triangleAnimationRight.beginTime + triangleAnimationRight.duration;
    triangleAnimationTop.duration = 0.3;
    
    // group
    CAAnimationGroup * triangleAnimationGroup = [[CAAnimationGroup alloc] init];
    triangleAnimationGroup.animations = @[triangleAnimationLeft, triangleAnimationRight, triangleAnimationTop];
    triangleAnimationGroup.duration = triangleAnimationTop.beginTime + triangleAnimationTop.duration;
    triangleAnimationGroup.fillMode = kCAFillModeForwards;
    triangleAnimationGroup.removedOnCompletion = NO;
    
    [self addAnimation:triangleAnimationGroup forKey:nil];
}

- (UIBezierPath *)leftTrianglePath
{
    if (!_leftTrianglePath) {
        _leftTrianglePath = [[UIBezierPath alloc] init];
        [_leftTrianglePath moveToPoint:CGPointMake(5.0, 95.0)];
        [_leftTrianglePath addLineToPoint:CGPointMake(50.0, 12.5 + paddingSpace)];
        [_leftTrianglePath addLineToPoint:CGPointMake(95.0 - paddingSpace, 95.0)];
        [_leftTrianglePath closePath];
    }
    return _leftTrianglePath;
}

- (UIBezierPath *)rightTrianglePath
{
    if (!_rightTrianglePath) {
        _rightTrianglePath = [[UIBezierPath alloc] init];
        _rightTrianglePath = [[UIBezierPath alloc] init];
        [_rightTrianglePath moveToPoint:CGPointMake(5.0, 95.0)];
        [_rightTrianglePath addLineToPoint:CGPointMake(50.0, 12.5 + paddingSpace)];
        [_rightTrianglePath addLineToPoint:CGPointMake(95.0, 95.0)];
        [_rightTrianglePath closePath];
    }
    return _rightTrianglePath;
}

- (UIBezierPath *)topTrianglePath
{
    if (!_topTrianglePath) {
        _topTrianglePath = [[UIBezierPath alloc] init];
        _topTrianglePath = [[UIBezierPath alloc] init];
        [_topTrianglePath moveToPoint:CGPointMake(5.0, 95.0)];
        [_topTrianglePath addLineToPoint:CGPointMake(50.0, 12.5)];
        [_topTrianglePath addLineToPoint:CGPointMake(95.0, 95.0)];
        [_topTrianglePath closePath];
    }
    return _topTrianglePath;
}

@end
