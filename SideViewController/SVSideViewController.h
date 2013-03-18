//
//  SVSideViewController.h
//  SideViewController
//
//  Created by harperzhang on 13-3-2.
//  Copyright (c) 2013年 harperzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 使用tag显示view controller之前回掉到调用者的block
 
 使用此block可以做两件事：1、创建被显示的viewController；2、对将要显示的viewController进行必要的设置
 
 @param viewController 如果为nil，则需要由调用者创建并return，若不为nil则可直接返回
 @return 将要被显示的viewController
 */
typedef UIViewController*(^svcPresentingPreparation)(UIViewController* viewController);

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

#pragma mark Presenting
/**
 显示tag对应的中间的view controller
 
 使用此方法显示的vc将被持有，第一次使用时需要调用者在prepare block中创建并返回
 
 @param tag 使用tag对应view controller
 @param prepare 用于方便调用者对被显示vc的创建和修改
 */
-(void)presentCenterViewControllerWithTag:(NSString*)tag
                              preparation:(svcPresentingPreparation)prepare;

/**
 显示中间的view controller
 
 使用此方法显示的vc不会被持有，默认动画方式过渡

 @param viewControllerToPresent 将要被显示的view controller
 
 @see presentCenterViewController:animated:
 */
-(void)presentCenterViewController:(UIViewController*)viewControllerToPresent;

/**
 显示中间的view controller
 
 使用此方法显示的vc不会被持有
 
 @param viewControllerToPresent 将要被显示的view controller
 @param animated 指定是否动画方式打开
 
 @see presentCenterViewController:
 */
-(void)presentCenterViewController:(UIViewController*)viewControllerToPresent
                          animated:(BOOL)animated;

@end


#pragma mark - UIViewController SVSideViewController Category
/**
 sideViewController category for UIViewController
 */
@interface UIViewController (SVSideViewController)

/**
 If the view controller has a side view controller as its ancestor, return it. Returns nil otherwise.
 */
@property(nonatomic, readonly, strong) SVSideViewController*  sideViewController;

@end
