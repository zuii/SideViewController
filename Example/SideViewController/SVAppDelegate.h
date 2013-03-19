//
//  SVAppDelegate.h
//  SideViewController
//
//  Created by harperzhang on 13-3-2.
//  Copyright (c) 2013年 harperzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SVViewController;
@class SVSideViewController;
@interface SVAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SVViewController *viewController;
@property (nonatomic, strong) SVSideViewController* sideViewController;

@end
