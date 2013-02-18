//
//  detailViewController.m
//  JsonNews
//
//  Created by soriyany on 2/17/13.
//  Copyright (c) 2013 soriyany. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController
@synthesize newsArticle;
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
    titleLabel.text = [newsArticle objectForKey:@"name"];
    dateLabel.text = [newsArticle objectForKey:@"address"];
    city.text=[newsArticle objectForKey:@"city"];
    state.text=[newsArticle objectForKey:@"state"];
    phone.text=[newsArticle objectForKey:@"phone"];
    //detailLabel.text = [newsArticle objectForKey:@"city"];
    NSURL * imageURL = [NSURL URLWithString:[newsArticle objectForKey:@"storeLogoURL"]];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
    UIImage * image = [[UIImage alloc] initWithData:imageData];
    logo.image=image;
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
