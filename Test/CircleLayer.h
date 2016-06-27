//
//  CircleLayer.h
//  Test
//
//  Created by LiuFeifei on 16/6/22.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CircleLayer : CAShapeLayer

/**
 *  Wobble group animation
 */
- (void)wobbleAnimation;

/**
 *  Expend animation for circle layer
 */
- (void)expand;

/**
 *  Contract animation for circle layer
 */
- (void)contract;

@end
