//
//  ContentWithFooterViewController.h
//  CinderellaPass
//
//  Created by Nelson Widjaya on 10/29/15.
//  Copyright © 2015 Starty International. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FooterViewController.h"
#import "Constant.h"
#import "ProgressHUD.h"

@interface ContentWithFooterViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (readwrite) NSString* url;
@property (readwrite) UIStoryboard* storyBoard;
- (void)loadWebView:(NSString*)urlString;
@end
