//
//  SBExampleViewController.m
//  JDStatusBarNotificationExample
//
//  Created by Markus on 29.10.13.
//  Copyright (c) 2013 Markus. All rights reserved.
//

#import "SBExampleViewController.h"

#import "SBStyleEditorViewController.h"

#if IS_SCENE_BASED_EXAMPLE
  #import "JDSBN_WindowSceneExample-Swift.h"
#else
  #import "JDSBN_ClassicExample-Swift.h"
#endif

@implementation SBExampleViewController

- (void)loadView {
  [super loadView];

  self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"ExampleViewControllerTitle"];
  self.view.backgroundColor = [UIColor systemGray6Color];

  if (@available(iOS 15.0, *)) {
    __weak __typeof(self) weakSelf = self;
    UIViewController *hostingController = [ExamplesViewFactory createExamplesViewWithPresentationHandler:^{
      [weakSelf.navigationController pushViewController:[[SBStyleEditorViewController alloc] init] animated:YES];
    }];
    [hostingController willMoveToParentViewController:self];
    [self addChildViewController:hostingController];
    [self.view addSubview:hostingController.view];
    hostingController.view.frame = self.view.bounds;
    hostingController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  }
}

@end
