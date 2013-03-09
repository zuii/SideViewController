//
//  SVCenterContainerController.m
//  SideViewController
//
//  Created by harperzhang on 13-3-10.
//  Copyright (c) 2013年 harperzhang. All rights reserved.
//

#import "SVCenterContainerController.h"

@interface SVCenterContainerController ()
{
    UIViewController*    _rootViewController;
}

@end

@implementation SVCenterContainerController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    NSAssert(rootViewController != nil, @"rootViewController could not be nil.");
    if (rootViewController == nil) return nil;
    
    self = [super init];
    if (self) {
        // Custom initialization
        _rootViewController = rootViewController;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // setup root view controller
    if (_currentViewController == nil)
    {
        [self setupRootViewController];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup Root View Controller
-(void)setupRootViewController
{
    [self addChildViewController:_rootViewController];
    
    _rootViewController.view.frame = self.view.bounds;
    [self.view addSubview:_rootViewController.view];
    
    [_rootViewController didMoveToParentViewController:self];
    
    // let rootVC to be the current VC
    _currentViewController = _rootViewController;
}

#pragma mark - Present Current View Controller
-(void)setCurrentViewController:(UIViewController *)currentViewController
{
    [self setCurrentViewController:currentViewController animated:NO];
}

-(void)setCurrentViewController:(UIViewController *)currentViewController
                       animated:(BOOL)animated
{
    NSAssert(currentViewController != nil, @"currentViewController could not be nil.");
    if (currentViewController == nil
        || currentViewController == _currentViewController)
    {
        return;
    }
    
    //
    _currentViewController = currentViewController;
}

@end
