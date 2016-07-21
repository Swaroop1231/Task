//
//  ServiceHelper.h
//  Task
//
//  Created by Satya Swaroop Basangi on 16/07/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServiceDelegate <NSObject>

@required
-(void)reloadTableWithFeeds:(NSDictionary*)data;

@end


@interface ServiceHelper : NSObject
@property(nonatomic,weak) id<ServiceDelegate> delegate;
-(void)getFeeds;

@end
