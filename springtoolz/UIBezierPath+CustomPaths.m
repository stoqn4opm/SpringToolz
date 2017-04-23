//
//  UIBezierPath+CustomPaths.m
//  SpringToolzSampleProject
//
//  Created by Stoyan Stoyanov on 4/19/17.
//  Copyright © 2017 Stoyan Stoyanov. All rights reserved.
//

#import "UIBezierPath+CustomPaths.h"

@implementation UIBezierPath (CustomPaths)

+ (UIBezierPath *)gearPathWithNumberOfSides:(NSUInteger)sides radiusDeviation:(CGFloat)radDeviation iconSize:(CGRect)iconSize {

    if (sides == 0) {
        return nil;
    }
    
    CGFloat baseRadius = iconSize.size.height / 2.0;
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    
    for (NSInteger i = 1; i <= sides; i++) {
        
        CGFloat startAngle = ((i - 1) * 2 * M_PI / sides) - M_PI_2;
        CGFloat endAngle = (i * 2 * M_PI / sides) - M_PI_2;
        CGFloat radius = i % 2 == 0 ? baseRadius - radDeviation / 2.0 : baseRadius + radDeviation / 2.0;
        [bPath addArcWithCenter:CGPointZero radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    }
    [bPath closePath];
    [bPath applyTransform:CGAffineTransformMakeTranslation(baseRadius + iconSize.origin.x, baseRadius + iconSize.origin.y)];
    return bPath;
}

@end