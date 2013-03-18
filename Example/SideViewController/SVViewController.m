//
//  SVViewController.m
//  SideViewController
//
//  Created by harperzhang on 13-3-2.
//  Copyright (c) 2013年 harperzhang. All rights reserved.
//

#import "SVViewController.h"
#import "SVSideViewController.h"

@interface SVViewController ()
{
    SVSideViewController* _svc;
}

- (IBAction)testButtonAction:(id)sender;


@end

@implementation SVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    if (_svc == nil)
    {
        _svc = [[SVSideViewController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testButtonAction:(id)sender
{
    [_svc presentCenterViewControllerWithTag:@"homeVC" preparation:^UIViewController *(UIViewController *viewController) {
        if (viewController == nil)
        {
           viewController = [[UIViewController alloc] init];
           viewController.title = @"hello world";
        }

        return viewController;
    }];
}
@end
