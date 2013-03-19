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
        _currentViewController = rootViewController;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // resume current view controller
    [self addCurrentViewControllerToContainer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Current View Controller
-(void)addCurrentViewControllerToContainer
{
    [self addChildViewController:_currentViewController];
    
    _currentViewController.view.frame = self.view.bounds;
    [self.view addSubview:_currentViewController.view];
    
    [_currentViewController didMoveToParentViewController:self];
}

-(void)transitionToViewController:(UIViewController*)toViewController animated:(BOOL)animated
{
    if (toViewController == nil) return;
    
    if (self.currentViewController)
    {
        [self addChildViewController:toViewController];
        [self transitionFromViewController:_currentViewController toViewController:toViewController duration:0.25 options:0 animations:^{
            
        } completion:^(BOOL finished) {
            [_currentViewController didMoveToParentViewController:self];
            
            [_currentViewController willMoveToParentViewController:nil];
            [_currentViewController removeFromParentViewController];
        }];
    }
    else
    {
        _currentViewController = toViewController;
        [self addCurrentViewControllerToContainer];
    }
}

#pragma mark - Present Current View Controller
-(void)setCurrentViewController:(UIViewController *)currentViewController
{
    if (_currentViewController == currentViewController) return;
    
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
    if ([self isViewLoaded])
    {
        [self transitionToViewController:currentViewController animated:animated];
    }
}

@end
