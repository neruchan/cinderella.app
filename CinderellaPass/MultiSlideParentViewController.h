//
//  MultiSlideParentViewController.h
//  CinderellaPass
//
//  Created by Nelson Widjaya on 10/21/15.
//  Copyright © 2015 Starty International. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAPagesContainer.h"
#import "FooterViewController.h"

@class ViewController;

#import "Constant.h"

@interface MultiSlideParentViewController : UIViewController

@property (strong, nonatomic) DAPagesContainer *pagesContainer;

@property (readwrite) ViewController *category1View;
@property (readwrite) ViewController *category2View;
@property (readwrite) ViewController *category3View;
@property (readwrite) ViewController *category4View;

-(void)refreshWeb;


@end
