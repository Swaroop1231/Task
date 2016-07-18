//
//  ViewController.m
//  Task
//
//  Created by Satya Swaroop Basangi on 16/07/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "ServiceHelper.h"
#import "Facts.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,ServiceDelegate>
{
    UITableView *mainTable;
    NSMutableArray *factsArray;
    UIActivityIndicatorView *activityIndicator;
    UIRefreshControl *refreshControl;
}
@end

@implementation ViewController

#pragma mark Loading View

- (void)loadView
{
    CGRect rect = [UIScreen mainScreen].applicationFrame;
    self.view = [[UIView alloc] initWithFrame:rect];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    mainTable = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    mainTable.delegate=self;
    mainTable.dataSource=self;
    mainTable.translatesAutoresizingMaskIntoConstraints = NO;
    [mainTable registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cell"];

    [self.view addSubview:mainTable];
    
    NSDictionary *views =
    NSDictionaryOfVariableBindings(mainTable);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                               @"H:|[mainTable]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                               @"V:|[mainTable]|" options:0 metrics:nil views:views]];
    
    
}

#pragma mark View Life Cycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    factsArray = [[NSMutableArray alloc]init];
    
    
    mainTable.estimatedRowHeight = 44;
    mainTable.rowHeight = UITableViewAutomaticDimension;
    
    
    
    [self addPullToRefersh];
    [self callFeedsService];
    
}
#pragma mark pull to refresh


-(void)addPullToRefersh
{
    
    refreshControl = [[UIRefreshControl alloc]init];
    [mainTable addSubview:refreshControl];
    [refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
}

- (void)refreshTable {
    //TODO: refresh your data
    [self callFeedsService];
    [refreshControl endRefreshing];
    [mainTable reloadData];
}

#pragma mark TableView

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return factsArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Facts *facts = [factsArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = facts.factTitle;
    cell.descriptionLabel.text = facts.factDescription;

    
    
    cell.displayImageView.image = [UIImage imageNamed:@"no_image_s8.png"];
    
    // download the image asynchronously
    [self downloadImageWithURL:[NSURL URLWithString:facts.factImageUrl] completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            // change the image in the cell
             cell.displayImageView.image = image;
            
            // cache the image for use later (when scrolling up)
            //contact.imgProfile = image;
        }
    }];
    // Make sure the constraints have been added to this cell, since it may have just been created from scratch
    [cell updateConstraints];
    
    
    
    
    return cell;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    return 500;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 44;
//}

#pragma mark Activity Indicator

-(void)createActivityIndicator
{
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityIndicator];
    activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    [self startStopActivitiyIndicator:YES];
    
}

-(void)startStopActivitiyIndicator:(BOOL)state
{
    if (state==YES)
    {
        [activityIndicator startAnimating];
 
    }
    else
    {
        [activityIndicator stopAnimating];

    }
}


#pragma mark Calling Service

-(void)callFeedsService
{
    [self createActivityIndicator];

    ServiceHelper *serviceHelper=  [[ServiceHelper alloc]init];
    serviceHelper.delegate=self;
    [serviceHelper getFeeds];
}


#pragma mark reload Table with feeds

-(void)reloadTableWithFeeds:(NSDictionary *)receivedData
{
    

    NSArray *dataArray=[receivedData objectForKey:@"rows"];
    
    
    for (NSDictionary *subDictionary in dataArray )
    {
        Facts *facts = [[Facts alloc]init];
        [facts  didReceiveGroups:subDictionary];
        [factsArray addObject:facts];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.navigationItem.title =[receivedData objectForKey:@"title"];

        [mainTable reloadData];
        [self startStopActivitiyIndicator:NO];
        
    });

   


}
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
