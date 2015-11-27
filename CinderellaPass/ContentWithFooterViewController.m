//
//  ContentWithFooterViewController.m
//  CinderellaPass
//
//  Created by Nelson Widjaya on 10/29/15.
//  Copyright © 2015 Starty International. All rights reserved.
//

#import "ContentWithFooterViewController.h"

@interface ContentWithFooterViewController ()

@end

@implementation ContentWithFooterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [self webView].delegate = self;
    // Do any additional setup after loading the view.
    [self loadWebView:self.url];
    [self processHeaderFooter];
}

//-(void)viewDidAppear:(BOOL)animated{
//    [self processHeaderFooter];
//}

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


- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [[ProgressHUD defaultHUD] showInView:self.view];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [[ProgressHUD defaultHUD] hideActivityIndicator];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    bool returnValue = YES;
    
    NSString *urlRequest = [[request URL]absoluteString];
    NSLog(@"inside startload %@",urlRequest);
    NSRange rangeValue = [urlRequest rangeOfString:@"index.php" options:NSCaseInsensitiveSearch];
    
    if (rangeValue.length > 0){
        NSLog(@"current url DOES include index.php");
        returnValue = NO;
        

            
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
    else{
        NSLog(@"current url DOESNOT include index.php OKOK");
        returnValue = YES;
    }
    
    
    return returnValue;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"========error kampang code: %d",[error code]);
    NSLog(@"========error kampang: %@",error);
    
    if ([error code] != NSURLErrorCancelled) {
        
        
    }
}

- (void)loadWebView:(NSString*)urlString
{
    NSLog(@"url: %@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [[self webView] loadRequest:requestObj];
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
