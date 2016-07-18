//
//  ServiceHelper.m
//  Task
//
//  Created by Satya Swaroop Basangi on 16/07/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

#import "ServiceHelper.h"

@implementation ServiceHelper

@synthesize delegate;

-(void)getFeeds
{
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/746330/facts.json"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
        {

            NSString *iso = [[NSString alloc] initWithData:data encoding:NSISOLatin1StringEncoding];
            NSData *dutf8 = [iso dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:dutf8 options:NSJSONReadingMutableContainers error:&error];
            
            [delegate reloadTableWithFeeds:jsonDict];

        }];
                                      
    [dataTask resume];
    
    
    
}


@end
