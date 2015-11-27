//
//  ViewController.m
//  CinderellaPass
//
//  Created by Nelson Widjaya on 10/5/15.
//  Copyright © 2015 Starty International. All rights reserved.
//

#import "ViewController.h"
#import "ProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSLog(@"wat");
    
    [self webView].delegate = self;
    
    self.baseLink = [NSString stringWithFormat:@"%@%@?cid=%d",DOMAIN_NAME,WEB_LINK_TOP,[self categoryId]];
    
    [self loadWebView:self.baseLink];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) refresh{
    [self loadWebView:self.baseLink];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [[ProgressHUD defaultHUD] showInView:self.view];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [[ProgressHUD defaultHUD] hideActivityIndicator];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    bool returnValue = YES;
    
    NSString *urlRequest = [[request URL]absoluteString];
    //NSLog(@"inside startload %@",urlRequest);
    NSRange rangeValue = [urlRequest rangeOfString:@"index.php" options:NSCaseInsensitiveSearch];
    
    if (rangeValue.length <= 0){
        NSLog(@"current VIEWCONTROLLER url DOESNOT include index.php");
        returnValue = NO;
        ContentWithFooterViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentWithFooterViewController"];
        controller.url = urlRequest;
        [self.parentController.navigationController pushViewController:controller animated:YES];
    }
    else{
         //NSLog(@"current url include index.php OKOK");
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

@end
