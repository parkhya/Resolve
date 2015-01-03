//
//  DataBase.h
//  SnowPush
//
//  Created by Manisha panse on 9/25/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MsgInfo.h"
#import "ResolveInfo.h"
@interface DataBase : NSObject
{
    NSString *databasepath;
    ResolveInfo *mInfo;
}

+(DataBase*)getSharedInstance;
- (NSString*)findDBPath;
#pragma mark - sms

- (BOOL) SaveClientDetail:(MsgInfo*)client;

-(NSMutableArray*)receiveAllData;

-(NSMutableArray*)receiveSpecificClientfromClientsList:(NSString*)Client;

-(BOOL)updateClientDetail:(MsgInfo*)client whereCompName:(NSString*)CompName;

-(BOOL)deleteClientFromClientsList:(MsgInfo*)Client;

-(BOOL)isMsgTypeAvailble:(NSString*)type;

@end
