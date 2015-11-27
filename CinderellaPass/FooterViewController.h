//
//  FooterViewController.h
//  CinderellaPass
//
//  Created by Nelson Widjaya on 10/29/15.
//  Copyright © 2015 Starty International. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentWithFooterViewController.h"
#import "MultiSlideParentViewController.h"

@interface FooterViewController : UIViewController
- (IBAction)homeBtnPressedAction:(id)sender;
- (IBAction)favouriteBtnPressedAction:(id)sender;
- (IBAction)searchBtnPressedAction:(id)sender;
- (IBAction)loginBtnPressedAction:(id)sender;

@property (readwrite) UIStoryboard* storyBoard;

@end
