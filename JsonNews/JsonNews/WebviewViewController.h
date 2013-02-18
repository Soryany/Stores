//
//  WebviewViewController.h
//  JsonNews
//
//  Created by soriyany on 2/17/13.
//  Copyright (c) 2013 soriyany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebviewViewController : UIViewController<UIWebViewDelegate>
{
    __weak UIWebView* mWebView;
    __weak UIToolbar* mToolbar;
    __weak UIBarButtonItem* mBack;
    __weak UIBarButtonItem* mNext;
    __weak UIBarButtonItem* mRefresh;
    __weak UIBarButtonItem* mStop;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *next;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *stopLoading;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refresh;

- (void)updateButtons;
@end
