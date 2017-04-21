//
//  CustomMasksAnimationManager.m
//  SpringToolzSampleProject
//
//  Created by Stoyan Stoyanov on 4/19/17.
//  Copyright © 2017 Stoyan Stoyanov. All rights reserved.
//

#import "CustomMasksAnimationManager.h"
#import "UIBezierPath+CustomPaths.h"

@interface CustomMasksAnimationManager()

@property (nonatomic, assign) BOOL isIconSizeSet;

@property (nonatomic, strong) NSMutableArray<UIView *> *masks;

@property (nonatomic, strong) UIBezierPath *pageIconsShape;
@property (nonatomic, strong) UIBezierPath *dockIconsShape;

@end

@implementation CustomMasksAnimationManager

#pragma mark - Singleton Refference

+ (instancetype)sharedInstance {
    static CustomMasksAnimationManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CustomMasksAnimationManager alloc] init];
        sharedInstance.masks = [NSMutableArray new];
    });
    return sharedInstance;
}

#pragma mark - Public Methods

- (void)setIconSize:(CGRect)iconSize {
    CGFloat newLenght = iconSize.size.width * 0.9;
    CGFloat xDelta = iconSize.size.width - newLenght;
    CGFloat yDelta = iconSize.size.height - newLenght;
    
    _iconSize = CGRectMake( xDelta / 2.0, yDelta / 2.0, newLenght, newLenght);
    self.isIconSizeSet = YES;
}

- (void)addMaskView:(UIView *)mask {
    [self.masks addObject:mask];
}

- (void)animateIfNeeded {
    
//    if (!self.shouldAnimate) {
//        return;
//    }
//    
    [UIView animateWithDuration:5 delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionShowHideTransitionViews | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionBeginFromCurrentState animations:^{
        
        for (UIView *mask in self.masks) {
            mask.transform = CGAffineTransformMakeRotation(M_PI);
        }
        [self.masks removeAllObjects];
        
    } completion:nil];
}

- (void)setPageIconsShapeName:(NSString *)pageIconsShapeName {
    self.pageIconsShape = [self shapeForName:pageIconsShapeName];
}

- (void)setDockIconsShapeName:(NSString *)dockIconsShapeName {
    self.dockIconsShape = [self shapeForName:dockIconsShapeName];
}

- (UIBezierPath *)shapeForPageIcons {
    return self.pageIconsShape;
}

- (UIBezierPath *)shapeForDockIcons {
    return self.dockIconsShape;
}

/*
 supported icon shapes:
 default
 circle
 gear_wheel_1
 gear_wheel_2
 gear_wheel_3
 circle_radius_deviation
 */

- (UIBezierPath *)shapeForName:(NSString *)name {
    
    if ([name isEqualToString:@"default"]) {
        return nil;
    } else if ([name isEqualToString:@"circle"]) {
        return [UIBezierPath bezierPathWithOvalInRect:self.iconSize];
    } else if ([name isEqualToString:@"gear_wheel_1"]) {
        return [UIBezierPath gearPathWithNumberOfSides:4 radiusDeviation:5 iconSize:self.iconSize];
    } else if ([name isEqualToString:@"gear_wheel_2"]) {
        return [UIBezierPath gearPathWithNumberOfSides:12 radiusDeviation:2 iconSize:self.iconSize];
    } else if ([name isEqualToString:@"gear_wheel_3"]) {
        return [UIBezierPath gearPathWithNumberOfSides:100 radiusDeviation:6 iconSize:self.iconSize];
    } else if ([name isEqualToString:@"circle_radius_deviation"]) {
        return [UIBezierPath gearPathWithNumberOfSides:3 radiusDeviation:5 iconSize:self.iconSize];
    }
    
    return nil;
}

/*
 supported color names:
 - black
 - green
 - blue
 - yellow
 - white
 - gray
 */

- (UIColor *)shadowColorForName:(NSString *)name {
    
    if ([name isEqualToString:@"black"]) {
        return [UIColor blackColor];
    } else if ([name isEqualToString:@"green"]) {
        return [UIColor greenColor];
    } else if ([name isEqualToString:@"blue"]) {
        return [UIColor blueColor];
    } else if ([name isEqualToString:@"yellow"]) {
        return [UIColor yellowColor];
    } else if ([name isEqualToString:@"white"]) {
        return [UIColor whiteColor];
    } else if ([name isEqualToString:@"gray"]) {
        return [UIColor grayColor];
    }
    return nil;
}
@end
