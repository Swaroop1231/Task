//
//  Facts.m
//  Task
//
//  Created by Satya Swaroop Basangi on 16/07/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

#import "Facts.h"

@implementation Facts


-(Facts*)didReceiveGroups:(NSDictionary*)receivedObjects
{
    self.factTitle= [self checkEmptyString:[receivedObjects valueForKey:@"title"]];
    self.factDescription=[self checkEmptyString:[receivedObjects valueForKey:@"description"]];
    self.factImageUrl=[self checkEmptyString:[receivedObjects valueForKey:@"imageHref"]];


    return self;
    
}

#pragma mark check empty string

-(NSString *)checkEmptyString:(NSString*)value
{
    
    if ([value isKindOfClass:[NSNull class]] || value.length==0)
    {
        return @"";
    }
    else
    {
        return value;
    }
    
}


@end
