//
//  SVSideViewController.m
//  SideViewController
//
//  Created by harperzhang on 13-3-2.
//  Copyright (c) 2013年 harperzhang. All rights reserved.
//

#import "SVSideViewController.h"
#import <objc/runtime.h>
#import "SVCenterContainerController.h"

@interface SVSideViewController ()
{
    SVCenterContainerController*   _centerContainerController; // 用于包含所有center view controller的容器
    UIViewController*              _rootViewController; // center view controller
    
    NSMutableDictionary*           _viewControllersDictionary; // 保存所有需要持有的vc
}

@end

@implementation SVSideViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    NSAssert(rootViewController != nil, @"RootViewController could not be nil.");
    
    self = [super init];
    if (self) {
        _viewControllersDictionary = [[NSMutableDictionary alloc] init];
        
        _rootViewController = rootViewController;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self addLeftViewControllerToSVC];
    [self addRightViewControllerToSVC];
    
    [self setupCenterContainerController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Center View Controller
-(void)setupCenterContainerController
{
    if (_centerContainerController == nil)
    {
        _centerContainerController = [[SVCenterContainerController alloc] initWithRootViewController:_rootViewController];
        
        // add to svc
        [self addChildViewController:_centerContainerController];
        _centerContainerController.view.frame = self.view.bounds;
        [self.view addSubview:_centerContainerController.view];
        [_centerContainerController didMoveToParentViewController:self];
    }
}

-(UIViewController*)centerViewController
{
    return _centerContainerController.currentViewController;
}

#pragma mark Left View Controller
-(void)setLeftViewController:(UIViewController *)leftViewController
{
    if (leftViewController == _leftViewController) return;
    
    _leftViewController = leftViewController;
    if ([self isViewLoaded])
    {
        //  add to svc
        [self addLeftViewControllerToSVC];
    }
}

-(void)addLeftViewControllerToSVC
{
    if (_leftViewController)
    {
        [self addChildViewController:_leftViewController];
        
        _leftViewController.view.frame = self.view.bounds;
        [self.view addSubview:_leftViewController.view];
        [self.view sendSubviewToBack:_leftViewController.view];
        
        [_leftViewController didMoveToParentViewController:self];
    }
}

#pragma mark Right View Controller
-(void)setRightViewController:(UIViewController *)rightViewController
{
    if (rightViewController == _rightViewController) return;
    
    _rightViewController = rightViewController;
    if ([self isViewLoaded])
    {
        // add to svc
        [self addRightViewControllerToSVC];
    }
}

-(void)addRightViewControllerToSVC
{
    if (_rightViewController)
    {
        [self addChildViewController:_rightViewController];
        
        _rightViewController.view.frame = self.view.bounds;
        [self.view addSubview:_rightViewController.view];
        [self.view sendSubviewToBack:_rightViewController.view];
        
        [_rightViewController didMoveToParentViewController:self];
    }
}

#pragma mark Presenting
-(void)presentCenterViewControllerWithTag:(NSString *)tag
                              preparation:(svcPresentingPreparation)prepare
{
    NSAssert(tag.length > 0, @"tag must not be empty or nil.");
    if (tag.length == 0) return;
    
    UIViewController* vc = [_viewControllersDictionary objectForKey:tag];
    vc = prepare(vc); // prepare
    NSAssert(vc != nil, @"view controller whitch is presenting must not be nil.");
    if (vc == nil) return;
    
    // save new view controller again
    [_viewControllersDictionary setObject:vc forKey:tag];
    
    // to presenting
    [self presentCenterViewController:vc];
}

-(void)presentCenterViewController:(UIViewController *)viewControllerToPresent
{
    [self presentCenterViewController:viewControllerToPresent animated:YES];
}

-(void)presentCenterViewController:(UIViewController *)viewControllerToPresent
                          animated:(BOOL)animated
{

}

@end


#pragma mark - UIViewController SVSideViewController Category

@implementation UIViewController (SVSideViewController)
@dynamic sideViewController;

static const char* kSideViewControllerKey = "sideViewController";
-(SVSideViewController*)sideViewController
{
    return objc_getAssociatedObject(self, kSideViewControllerKey);
}

-(void)setSideViewController:(SVSideViewController *)sideViewController
{
    objc_setAssociatedObject(self, kSideViewControllerKey, sideViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end