//
//  ViewController.h
//  CinderellaPass
//
//  Created by Nelson Widjaya on 10/5/15.
//  Copyright © 2015 Starty International. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAPagesContainer.h"
#import "Constant.h"
#import "ContentWithFooterViewController.h"
#import "MultiSlideParentViewController.h"
@class ViewController;
@interface ViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) DAPagesContainer *pagesContainer;
@property (readwrite) int categoryId;
@property (readwrite) MultiSlideParentViewController *parentController;

@property NSString *baseLink;

- (void)refresh;


@end

