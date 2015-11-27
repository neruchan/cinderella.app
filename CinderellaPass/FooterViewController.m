//
//  FooterViewController.m
//  CinderellaPass
//
//  Created by Nelson Widjaya on 10/29/15.
//  Copyright © 2015 Starty International. All rights reserved.
//

#import "FooterViewController.h"

@interface FooterViewController ()

@end

@implementation FooterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)homeBtnPressedAction:(id)sender {
    UIViewController *currentViewController = [self.navigationController.viewControllers lastObject];
    NSLog(@"%@",currentViewController.restorationIdentifier);
    if([currentViewController.restorationIdentifier isEqualToString:@"MultiSlideParentViewController"]){
        MultiSlideParentViewController *controller = (MultiSlideParentViewController*)currentViewController;
        [controller refreshWeb];
    }
    else{
        
        BOOL isFound = NO;
        id foundObject;
        NSArray *viewControllers = [[self navigationController] viewControllers];
        for( int i=0;i<[viewControllers count];i++){
            id obj=[viewControllers objectAtIndex:i];
            if([obj isKindOfClass:[MultiSlideParentViewController class]]){
                foundObject = obj;
                isFound = YES;
            }
        }
        if(isFound && foundObject){
            [[self navigationController] popToViewController:foundObject animated:YES];
            MultiSlideParentViewController *controller = (MultiSlideParentViewController*) foundObject;
            [controller refreshWeb];
        }
        else{
            MultiSlideParentViewController *controller = [self.storyBoard instantiateViewControllerWithIdentifier:@"MultiSlideParentViewController"];
            [self.navigationController pushViewController:controller animated:YES];
        }
        
    }

}

- (IBAction)favouriteBtnPressedAction:(id)sender {
    UIViewController *currentViewController = [self.navigationController.viewControllers lastObject];
    if([currentViewController.restorationIdentifier isEqualToString:@"MultiSlideParentViewController"]){
        MultiSlideParentViewController *controller = (MultiSlideParentViewController*)currentViewController;
        [controller refreshWeb];
    }
    else{
        
        BOOL isFound = NO;
        id foundObject;
        NSArray *viewControllers = [[self navigationController] viewControllers];
        for( int i=0;i<[viewControllers count];i++){
            id obj=[viewControllers objectAtIndex:i];
            if([obj isKindOfClass:[MultiSlideParentViewController class]]){
                foundObject = obj;
                isFound = YES;
            }
        }
        if(isFound && foundObject){
            [[self navigationController] popToViewController:foundObject animated:YES];
            MultiSlideParentViewController *controller = (MultiSlideParentViewController*) foundObject;
            [controller refreshWeb];
        }
        else{
            MultiSlideParentViewController *controller = [self.storyBoard instantiateViewControllerWithIdentifier:@"MultiSlideParentViewController"];
            [self.navigationController pushViewController:controller animated:YES];
        }
        
    }
    NSLog(@"fav dr footer");
}

- (IBAction)searchBtnPressedAction:(id)sender {
    UIViewController *currentViewController = [self.navigationController.viewControllers lastObject];
    if([currentViewController.restorationIdentifier isEqualToString:@"ContentWithFooterViewController"]){
        ContentWithFooterViewController *controller = (ContentWithFooterViewController*)currentViewController;
        controller.url = [NSString stringWithFormat:@"%@%@",DOMAIN_NAME,WEB_LINK_SEARCH];
        [controller loadWebView:controller.url];
    }
    else{
        
        BOOL isFound = NO;
        id foundObject;
        NSArray *viewControllers = [[self navigationController] viewControllers];
        for( int i=0;i<[viewControllers count];i++){
            id obj=[viewControllers objectAtIndex:i];
            if([obj isKindOfClass:[ContentWithFooterViewController class]]){
                foundObject = obj;
                isFound = YES;
            }
        }
        if(isFound && foundObject){
            [[self navigationController] popToViewController:foundObject animated:YES];
            ContentWithFooterViewController *controller = (ContentWithFooterViewController*) foundObject;
            controller.url = [NSString stringWithFormat:@"%@%@",DOMAIN_NAME,WEB_LINK_SEARCH];
            [controller loadWebView:controller.url];
        }
        else{
            ContentWithFooterViewController *controller = [self.storyBoard instantiateViewControllerWithIdentifier:@"ContentWithFooterViewController"];
            controller.url = [NSString stringWithFormat:@"%@%@",DOMAIN_NAME,WEB_LINK_SEARCH];
            [controller loadWebView:controller.url];
            [self.navigationController pushViewController:controller animated:YES];
        }
        
    }

    NSLog(@"search dr footer");
}

- (IBAction)loginBtnPressedAction:(id)sender {
    UIViewController *currentViewController = [self.navigationController.viewControllers lastObject];
    if([currentViewController.restorationIdentifier isEqualToString:@"ContentWithFooterViewController"]){
        ContentWithFooterViewController *controller = (ContentWithFooterViewController*)currentViewController;
        controller.url = [NSString stringWithFormat:@"%@%@",DOMAIN_NAME,WEB_LINK_MYPAGE];
        [controller loadWebView:controller.url];
    }
    else{
        
        BOOL isFound = NO;
        id foundObject;
        NSArray *viewControllers = [[self navigationController] viewControllers];
        for( int i=0;i<[viewControllers count];i++){
            id obj=[viewControllers objectAtIndex:i];
            if([obj isKindOfClass:[ContentWithFooterViewController class]]){
                foundObject = obj;
                isFound = YES;
            }
        }
        if(isFound && foundObject){
            [[self navigationController] popToViewController:foundObject animated:YES];
            ContentWithFooterViewController *controller = (ContentWithFooterViewController*) foundObject;
            controller.url = [NSString stringWithFormat:@"%@%@",DOMAIN_NAME,WEB_LINK_MYPAGE];
            [controller loadWebView:controller.url];
        }
        else{
            ContentWithFooterViewController *controller = [self.storyBoard instantiateViewControllerWithIdentifier:@"ContentWithFooterViewController"];
            controller.url = [NSString stringWithFormat:@"%@%@",DOMAIN_NAME,WEB_LINK_MYPAGE];
            [controller loadWebView:controller.url];
            [self.navigationController pushViewController:controller animated:YES];
        }
        
    }
    NSLog(@"login dr footer");
}
@end
