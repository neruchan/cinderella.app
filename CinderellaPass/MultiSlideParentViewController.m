//
//  MultiSlideParentViewController.m
//  CinderellaPass
//
//  Created by Nelson Widjaya on 10/21/15.
//  Copyright © 2015 Starty International. All rights reserved.
//

#import "MultiSlideParentViewController.h"
#import "ViewController.h"

@interface MultiSlideParentViewController ()

@end

@implementation MultiSlideParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    // Do any additional setup after loading the view.
    
    self.pagesContainer = [[DAPagesContainer alloc] init];
    
    int bounds = 0;
    
    if(isIOS7){
        bounds = 10;
    }
    
    self.pagesContainer.pageIndicatorImage = [UIImage imageNamed:@"top"];
    self.pagesContainer.topBarBackgroundColor = [UIColor whiteColor];
//    self.pagesContainer.pageItemsTitleColor = [UIColor grayColor];
    self.pagesContainer.selectedPageItemTitleColor = [UIColor grayColor];
    
    [self.pagesContainer willMoveToParentViewController:self];
    self.pagesContainer.view.frame = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y+bounds, self.view.bounds.size.width, self.view.bounds.size.height-55);
    self.pagesContainer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.pagesContainer.view];
    [self.pagesContainer didMoveToParentViewController:self];
    
    self.category1View = (ViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
    self.category1View.title = TITLE_FOR_VIEW1;
    self.category1View.categoryId = CATEGORY_FOR_VIEW1;
    self.category1View.parentController = self;
    
    self.category2View = (ViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
    self.category2View.title = TITLE_FOR_VIEW2;
    self.category2View.categoryId = CATEGORY_FOR_VIEW2;
    self.category2View.parentController = self;
    
    self.category3View  = (ViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
    self.category3View.title = TITLE_FOR_VIEW3;
    self.category3View.categoryId = CATEGORY_FOR_VIEW3;
    self.category3View.parentController = self;
    
    self.category4View  = (ViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
    self.category4View.title = TITLE_FOR_VIEW4;
    self.category4View.categoryId = CATEGORY_FOR_VIEW4;
    self.category4View.parentController = self;
    
    //self.pagesContainer.pageIndicatorViewSize = CGSizeMake(108.0f, 25.0f);
    //self.pagesContainer.topBarBackgroundImage = [UIImage imageNamed:@"top"];
    
    self.pagesContainer.viewControllers = @[self.category1View , self.category2View , self.category3View ,self.category4View];
    
    [self processHeaderFooter];
    //[self refreshWeb];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




-(void)refreshWeb{
    [self.category1View refresh];
    [self.category2View refresh];
    [self.category3View refresh];
    [self.category4View refresh];
}

-(void)processHeaderFooter{
    UIView *footerFrame;
    for (UIView *subview in self.view.subviews)
    {
        if([[subview restorationIdentifier] isEqualToString:@"footer_id"]){
            footerFrame = subview;
            break;
        }
    }
    
    if(footerFrame){
        //FOOTER SETUP
        FooterViewController *footer = [[FooterViewController alloc] initWithNibName:@"FooterViewController" bundle:nil];
        footer.view.autoresizingMask = footerFrame.autoresizingMask;
        footer.view.frame = CGRectMake(footerFrame.frame.origin.x
                                       , footerFrame.frame.origin.y, footerFrame.frame.size.width, footerFrame.frame.size.height);
        
        
        [self addChildViewController:footer];
        [self.view addSubview:footer.view];
    }
}



@end
