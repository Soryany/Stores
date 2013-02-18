//
//  WebviewViewController.m
//  JsonNews
//
//  Created by soriyany on 2/17/13.
//  Copyright (c) 2013 soriyany. All rights reserved.
//

#import "WebviewViewController.h"

@interface WebviewViewController ()

@end

@implementation WebviewViewController
//@synthesize webView,toolbar,back,next,stopLoading,refresh;
@synthesize webView = mWebView;
@synthesize toolbar = mToolbar;
@synthesize back = mBack;
@synthesize next = mNext;
@synthesize refresh = mRefresh;
@synthesize stopLoading = mStop;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // self.title = @"WebView";
    NSAssert(self.back, @"Unconnected IBOutlet 'back'");
    NSAssert(self.next, @"Unconnected IBOutlet 'next'");
    NSAssert(self.refresh, @"Unconnected IBOutlet 'refresh'");
    NSAssert(self.stopLoading, @"Unconnected IBOutlet 'stopLoading'");
    NSAssert(self.webView, @"Unconnected IBOutlet 'webView'");
    
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    NSURL* url = [NSURL URLWithString:@"http://www.apple.com"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    [self updateButtons];
}
- (void)updateButtons
{
    self.next.enabled = self.webView.canGoForward;
    self.back.enabled = self.webView.canGoBack;
    self.stopLoading.enabled = self.webView.loading;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self updateButtons];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
}
- (NSString*)navigationTypeToString:(UIWebViewNavigationType)navigationType
{
    switch(navigationType)
    {
        case UIWebViewNavigationTypeFormSubmitted:
            return @"UIWebViewNavigationTypeFormSubmitted";
        case UIWebViewNavigationTypeBackForward:
            return @"UIWebViewNavigationTypeBackForward";
        case UIWebViewNavigationTypeReload:
            return @"UIWebViewNavigationTypeReload";
        case UIWebViewNavigationTypeFormResubmitted:
            return @"UIWebViewNavigationTypeReload";
        case UIWebViewNavigationTypeOther:
            return @"UIWebViewNavigationTypeOther";
            
    }
    return @"Unexpected/unknown";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidUnload
{
    self.webView = nil;
    self.toolbar = nil;
    self.back = nil;
    self.next = nil;
    self.refresh = nil;
    self.stopLoading = nil;
    [super viewDidUnload];
}
/*- (void)dealloc
{
    [mWebView release];
    [mToolbar release];
    [mBack release];
    [mForward release];
    [mRefresh release];
    [mStop release];
    [super dealloc];
}*/

@end
