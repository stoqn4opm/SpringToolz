//
//  UIView+Round.h
//  IconsWithShadowsTestProject
//
//  Created by Stoyan Stoyanov on 4/12/17.
//  Copyright © 2017 Stoyan Stoyanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBIconView: UIView
- (void)applyIconOptionsInRegardsToSuperView:(UIView *)superView andWindow:(UIWindow *)window;
- (BOOL)isInDock;
@end


@interface SBIconImageView: UIImageView
@end


@interface SBRootIconListView: UIView
@end

@interface SBIconImageCrossfadeView: UIView
@end
