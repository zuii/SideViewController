//
//  SVSideViewController.h
//  SideViewController
//
//  Created by harperzhang on 13-3-2.
//  Copyright (c) 2013年 harperzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 SVSideViewController，类Path侧滑式UI实现
 */
@interface SVSideViewController : UIViewController

/**
 当前显示在中间的View Controller
 
 @see leftViewController
 @see rightViewController
 */
@property(nonatomic, readonly) UIViewController*  centerViewController;

/**
 左侧边View Controller
 
 @see centerViewController
 @see rightViewController
 */
@property(nonatomic) UIViewController*  leftViewController;

/**
 右侧边View Controller
 
 @see centerViewController
 @see leftViewController
 */
@property(nonatomic) UIViewController*  rightViewController;

/**
 初始化并返回SVSideViewController对象
 
 本方法将rootViewController设置为centerViewController
 
 @param rootViewController 初始化显示的View Controller
 @return SVSideViewController对象
 */
-(id)initWithRootViewController:(UIViewController*)rootViewController;

@end
