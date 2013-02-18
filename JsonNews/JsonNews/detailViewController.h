//
//  detailViewController.h
//  JsonNews
//
//  Created by soriyany on 2/17/13.
//  Copyright (c) 2013 soriyany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController{
     NSDictionary *newsArticle;
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *dateLabel;
    //__weak IBOutlet UITextView *detailLabel;
    __weak IBOutlet UIImageView *logo;
    __weak IBOutlet UILabel *city;
    __weak IBOutlet UILabel *state;
    __weak IBOutlet UILabel *phone;
}
@property (nonatomic, copy) NSDictionary *newsArticle;
@end
