//
//  Facts.h
//  Task
//
//  Created by Satya Swaroop Basangi on 16/07/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Facts : NSObject
@property(nonatomic,strong)NSString *factTitle;
@property(nonatomic,strong)NSString *factDescription;
@property(nonatomic,strong)NSString *factImageUrl;
-(Facts*)didReceiveGroups:(NSDictionary*)receivedObjects;

@end
