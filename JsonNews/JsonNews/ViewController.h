//
//  ViewController.h
//  JsonNews
//
//  Created by soriyany on 2/17/13.
//  Copyright (c) 2013 soriyany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UITableView *mainTableView;
    NSArray *news;
    NSMutableData *data;
}
@end
