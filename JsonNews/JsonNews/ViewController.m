//
//  ViewController.m
//  JsonNews
//
//  Created by soriyany on 2/17/13.
//  Copyright (c) 2013 soriyany. All rights reserved.
//

#import "ViewController.h"
#import "detailViewController.h"
#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.title = @"Stores";
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
   // NSURL *url = [NSURL URLWithString:@"http://zacandcatie.com/YouTube/json.php"];
    NSURL *url = [NSURL URLWithString:@"http://strong-earth-32.heroku.com/stores.aspx"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    data = [[NSMutableData alloc] init];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData
{
    [data appendData:theData];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
   // NSArray *temperationArray =[NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
    //news = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
    storesInfo=[jsonObject objectForKey:@"stores"];
    [mainTableView reloadData];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The download could not complete - please make sure you're connected to either 3G or Wi-Fi." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [errorView show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [storesInfo count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
   
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MainCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *tem = @"";
    NSString *title = @"";
    NSString *address=@"";
    for (NSDictionary *data in storesInfo)
    {
        tem=[[storesInfo objectAtIndex:indexPath.row] objectForKey:@"storeLogoURL"];
        title=[[storesInfo objectAtIndex:indexPath.row] objectForKey:@"phone"];
        address=[[storesInfo objectAtIndex:indexPath.row] objectForKey:@"address"];
    }
    //cell.textLabel.text =title;
    
    //line
    CGRect lineRecText = CGRectMake(10, 35, 325, 18);
    UILabel *lineLabelText = [[UILabel alloc] initWithFrame:lineRecText];
    //lineLabelText.textAlignment = UITextAlignmentRight;
    lineLabelText.backgroundColor = [UIColor clearColor];
    //lineLabelText.text=@"______________________________________";
    lineLabelText.text=@"........................................";
    
    //phone
    CGRect phoneRectText = CGRectMake(10, 60, 120, 18);
    UILabel *phoneLabelText = [[UILabel alloc] initWithFrame:phoneRectText];
    phoneLabelText.backgroundColor = [UIColor clearColor];
    phoneLabelText.text=title;
    [phoneLabelText setNumberOfLines:0];
    [phoneLabelText sizeToFit];
    
    //address
    CGRect addressRectText = CGRectMake(150, 60, 150, 100);
    UILabel *addressLabelText = [[UILabel alloc] initWithFrame:addressRectText];
    //addressLabelText.textAlignment = UITextAlignmentRight;
    //[addressLabelText sizeToFit];
    addressLabelText.backgroundColor = [UIColor clearColor];
    addressLabelText.text=address;
    [addressLabelText setNumberOfLines:0];
    [addressLabelText sizeToFit];
    
    //imagview
    NSURL * imageURL = [NSURL URLWithString:tem];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
    UIImage * image = [[UIImage alloc] initWithData:imageData];
    UIImageView *m_imageView = [[UIImageView alloc] initWithImage:image];
    m_imageView.frame = CGRectMake(5, 5,80,40);
    
    UIView* backgroundView = [[ UIView alloc ] initWithFrame:CGRectZero ];
    backgroundView.backgroundColor = [ UIColor grayColor ];
    //cell.backgroundView = backgroundView;
    
    [cell.contentView addSubview:m_imageView];
    [cell.contentView addSubview:lineLabelText];
    [cell.contentView addSubview:phoneLabelText];
    [cell.contentView addSubview:addressLabelText];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    detailViewController *dViewController = [[detailViewController alloc]initWithNibName:@"detailViewController" bundle:nil];
    dViewController.title = [[storesInfo objectAtIndex:indexPath.row] objectForKey:@"name"];
    dViewController.newsArticle = [storesInfo objectAtIndex:indexPath.row];
    //NSLog([news objectAtIndex:indexPath.row]);
    [self.navigationController pushViewController:dViewController animated:YES];
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return 120;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
