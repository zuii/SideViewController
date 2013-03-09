//
//  SVSideViewController.m
//  SideViewController
//
//  Created by harperzhang on 13-3-2.
//  Copyright (c) 2013年 harperzhang. All rights reserved.
//

#import "SVSideViewController.h"

@interface SVSideViewController ()
{
    UIViewController*    _centerContainerController; // 用于包含所有center view controller的容器
}

@end

@implementation SVSideViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    NSAssert(rootViewController != nil, @"RootViewController could not be nil.");
    
    self = [super init];
    if (self) {
        _centerViewController = rootViewController;
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

-(void)setupRootViewController
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

@end
