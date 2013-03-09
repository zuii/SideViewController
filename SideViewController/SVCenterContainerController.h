//
//  SVCenterContainerController.h
//  SideViewController
//
//  Created by harperzhang on 13-3-10.
//  Copyright (c) 2013年 harperzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Containter for center view controllers of SVC
 */
@interface SVCenterContainerController : UIViewController

/**
 Current presented view controller
 */
@property(nonatomic) UIViewController*  currentViewController;

/**
 初始化并返回SVCenterContainerController对象
 
 @param rootViewController root view controller
 */
-(id)initWithRootViewController:(UIViewController*)rootViewController;

/**
 Set current view controller
 
 @param currentViewController view controller to be presented
 @param animated Pass YES to animate the transition 
 */
-(void)setCurrentViewController:(UIViewController *)currentViewController
                       animated:(BOOL)animated;

@end
