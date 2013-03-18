//
//  SVSideViewController.m
//  SideViewController
//
//  Created by harperzhang on 13-3-2.
//  Copyright (c) 2013年 harperzhang. All rights reserved.
//

#import "SVSideViewController.h"
#import <objc/runtime.h>

@interface SVSideViewController ()
{
    UIViewController*    _centerContainerController; // 用于包含所有center view controller的容器
    
    NSMutableDictionary* _viewControllersDictionary; // 保存所有需要持有的vc
}

@end

@implementation SVSideViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    NSAssert(rootViewController != nil, @"RootViewController could not be nil.");
    
    self = [super init];
    if (self) {
        
        _viewControllersDictionary = [[NSMutableDictionary alloc] init];
        
        [self setRootViewController];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
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
        _centerContainerController = [[UIViewController alloc] init];
        
        
    }
}

-(void)setRootViewController
{
    
}

#pragma mark - Left View Controller
-(void)setLeftViewController:(UIViewController *)leftViewController
{
    if (leftViewController == _leftViewController) return;
    
    if (_leftViewController)
    {
        // 已存在leftViewController，先移除
        
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
    
}

-(void)presentCenterViewController:(UIViewController *)viewControllerToPresent
{

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