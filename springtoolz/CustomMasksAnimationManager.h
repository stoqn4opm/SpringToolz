//
//  CustomMasksAnimationManager.h
//  SpringToolzSampleProject
//
//  Created by Stoyan Stoyanov on 4/19/17.
//  Copyright © 2017 Stoyan Stoyanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomMasksAnimationManager : NSObject

+ (CustomMasksAnimationManager *)sharedInstance;

@property (nonatomic, assign) CGRect iconSize;
@property (nonatomic, assign, readonly) BOOL isIconSizeSet;

- (void)setPageIconsShapeName:(NSString *)pageIconsShapeName;
- (void)setDockIconsShapeName:(NSString *)dockIconsShapeName;

- (UIBezierPath *)shapeForPageIcons;
- (UIBezierPath *)shapeForDockIcons;

- (void)addMaskView:(UIView *)mask;
- (void)animateIfNeeded;

- (UIColor *)shadowColorForName:(NSString *)name;
@end
