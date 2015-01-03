//
//  DataBase.m
//  SnowPush
//
//  Created by Manisha panse on 9/25/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "DataBase.h"

#import <sqlite3.h>

static DataBase *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;


@implementation DataBase

#pragma mark - get shared instance method

+(DataBase*)getSharedInstance
{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance findDBPath];
    }
    return sharedInstance;
}

#pragma mark - find dbpath method

- (NSString*)findDBPath
{
    NSString *databaseName = @"ResolveDb.sqlite";
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    databasepath = [[NSString alloc] initWithFormat:@"%@", [documentsDir stringByAppendingPathComponent:databaseName]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success = [fileManager fileExistsAtPath:databasepath];
    NSError *err;
    if(!success) {
        NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
        [fileManager copyItemAtPath:databasePathFromApp toPath:databasepath error:&err];
    }
    return databasepath;
    
}


#pragma mark - coupon methods

- (BOOL) SaveClientDetail:(ResolveInfo*)client{
    //[self findDBPath];
    const char *dbpath = [databasepath UTF8String];
    // NSLog(@"DBPATH:%s",dbpath);
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
       //CREATE TABLE "Resolutions" ("resolveName" TEXT, "OftenType" TEXT, "HowOften" TEXT, "Points" INTEGER, "date" TEXT, "status" INTEGER)
//        CREATE TABLE "Rewards" ("rewardName" TEXT, "rewardPoint" INTEGER, "status" INTEGER)
        NSString *insertSQL = [NSString stringWithFormat:@"insert into Resolutions (resolveName,OftenType,HowOften,Points,date,status) values(\"%@\",\"%@\",\"%@\",%i,\"%@\",%i)",client.ResolveName,client.ResolveType,client.HowOfen,client.RsolvePoint,client.Resolvedate,client.Rsolvesatus];
        
    //    NSString *insertSQL = [NSString stringWithFormat:@"insert into Reward (Rewardpoint,rewardstatus,Rewardname, values(\"%@\",\"%@\",\"%@\",%i,\"%@\",%i)",client.ResolveName,client.ResolveType,client.HowOfen,client.RsolvePoint,client.Resolvedate,client.Rsolvesatus];
        //  NSLog(@"%@",insertSQL);
        const char *insert_stmt = [insertSQL UTF8String];
        // NSLog(@"%i",sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL));
        
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        
        //  NSLog(@"%i",sqlite3_step(statement));
         NSLog(@"error %s.",sqlite3_errmsg(database));
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        { sqlite3_finalize(statement);
            sqlite3_close(database);
            return YES;
        }
        else { sqlite3_finalize(statement);
            sqlite3_close(database);
            return NO;
        }
        sqlite3_reset(statement);
    }
    return NO;
}




-(NSMutableArray*)receiveAllData
{
    //[self findDBPath];
    NSMutableArray *record = [[NSMutableArray alloc]init];
    //  NSLog(@"%@",databasepath);
    //  NSLog(@"%s",[databasepath UTF8String]);
    const char *dbpath=[databasepath UTF8String];
    //NSLog(@"DBPATH:%s",dbpath);
    if (sqlite3_open(dbpath, &database)==SQLITE_OK) {
        NSString *selectSQL=[NSString stringWithFormat:@"select * from Resolutions"];
        const char *select_stmt=[selectSQL UTF8String];
        // NSLog(@"%i",sqlite3_prepare_v2(database, select_stmt, -1, &statement, NULL));
        int res = sqlite3_prepare_v2(database, select_stmt, -1, &statement, NULL);
        if (res!=SQLITE_OK){
             NSLog(@"Problem with prepare statement. %s",sqlite3_errmsg(database));
        }
        else{
            //NSInteger temp=0,num=0;
            
            while(sqlite3_step(statement)==SQLITE_ROW){
                mInfo = [[ResolveInfo alloc]init];
                
                // medInfo.ID=[[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 0)]intValue];
                
                mInfo.ResolveName=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 0)];
                mInfo.ResolveType=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 1)];
                mInfo.HowOfen=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 2)];
                mInfo.RsolvePoint=[[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 3)]intValue];
                mInfo.Resolvedate=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 4)];
                mInfo.Rsolvesatus=[[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 5)]intValue];

                
                [record addObject:mInfo];
            }
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    }
    
    sqlite3_close(database);
    return record;
    
}
-(NSMutableArray*)receiveSpecificClientfromClientsList:(NSString*)Client
{
    //[self findDBPath];
    NSMutableArray *record = [[NSMutableArray alloc]init];
    //  NSLog(@"%@",databasepath);
    //  NSLog(@"%s",[databasepath UTF8String]);
    const char *dbpath=[databasepath UTF8String];
    //NSLog(@"DBPATH:%s",dbpath);
    if (sqlite3_open(dbpath, &database)==SQLITE_OK) {
       
        NSString *selectSQL=[NSString stringWithFormat:@"select * from Resolutions where resolveName=\"%@\"",Client];
        const char *select_stmt=[selectSQL UTF8String];
        // NSLog(@"%i",sqlite3_prepare_v2(database, select_stmt, -1, &statement, NULL));
        int res = sqlite3_prepare_v2(database, select_stmt, -1, &statement, NULL);
        if (res!=SQLITE_OK){
            // NSLog(@"Problem with prepare statement.");
        }
        else{
            
            
            while(sqlite3_step(statement)==SQLITE_ROW){
                mInfo = [[ResolveInfo alloc]init];
                
                // medInfo.ID=[[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 0)]intValue];
//                
                mInfo.ResolveName=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 0)];
                mInfo.ResolveType=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 1)];
                mInfo.HowOfen=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 2)];

                [record addObject:mInfo];
            }
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    }
    
    sqlite3_close(database);
    return record;
    
}

-(BOOL)updateClientDetail:(ResolveInfo*)client whereCompName:(NSString*)CompName
{
    BOOL isSuccess=NO;
    
    const char *dbpath = [databasepath UTF8String];
    
    // NSLog(@"DBPATH:%s",dbpath);
    
    // BOOL isSuccess=NO;
    
    // NSLog(@"updateing contact");
    
    //sqlite3_stmt *statement;
    
    //const char*dbpath=[databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {//("resolveName" TEXT, "OftenType" TEXT, "HowOften" TEXT, "Points" INTEGER, "date" TEXT, "status" INTEGER)
        NSString *querySQL = [NSString stringWithFormat:@"update Resolutions set status=%i where resolveName=\"%@\" ",client.Rsolvesatus,client.ResolveName];
        
        //NSLog(@"%@",querySQL);
        
        const char *update_stmt = [querySQL UTF8String];
        
        // NSLog(@" error msg.%s",sqlite3_errmsg(database));
        
        // NSLog(@"%i",sqlite3_prepare_v2(database, update_stmt, -1, &statement, NULL));
        
        if(sqlite3_prepare_v2(database, update_stmt, -1, &statement, NULL)==SQLITE_OK)
            
        {
            
            //                        NSLog(@"---> %d",sqlite3_step(statement));
            
            //            //sqlite3_bind_text(statement,1,update_stmt,-1,SQLITE_TRANSIENT);
            
            //            NSLog(@"%i",sqlite3_step(statement));
            
            if (sqlite3_step(statement) == SQLITE_DONE)
                
            {
                
                isSuccess=YES;
                
                //  NSLog(@"Updated");
                
            }
            
            else
                
            {
                
                isSuccess=NO;
                
                //  NSLog(@"File to update");
                
            }
            
            sqlite3_finalize(statement);
            
        }
        
        sqlite3_close(database);
        
    }
    
    return isSuccess;
}

-(BOOL)isMsgTypeAvailble:(NSString*)type
{
    BOOL isRe=NO;
    const char *dbpath=[databasepath UTF8String];
    //NSLog(@"DBPATH:%s",dbpath);
    if (sqlite3_open(dbpath, &database)==SQLITE_OK) {
        
        NSString *selectSQL=[NSString stringWithFormat:@"select * from msgTab where msgType=\"%@\"",type];
        const char *select_stmt=[selectSQL UTF8String];
        // NSLog(@"%i",sqlite3_prepare_v2(database, select_stmt, -1, &statement, NULL));
        int res = sqlite3_prepare_v2(database, select_stmt, -1, &statement, NULL);
        if (res!=SQLITE_OK){
            // NSLog(@"Problem with prepare statement.");
            isRe=NO;
        }
        else{
            isRe=YES;
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
    }
    
    sqlite3_close(database);
    return isRe;
}

-(BOOL)deleteClientFromClientsList:(MsgInfo*)Client
{
    BOOL isSuccess=NO;
    //   [self findDBPath];
    //NSLog(@"%@",databasepath);
    
    const char *dbpath=[databasepath UTF8String];
    
    // NSLog(@"DBPATH:%s",dbpath);
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *deleteSQL = [NSString stringWithFormat:@"delete from msgTab where msgType=\"%@\"",Client.msgType];
        
        // NSLog(@"%@",deleteSQL);
        const char *delete_stmt = [deleteSQL UTF8String];
        sqlite3_prepare_v2(database, delete_stmt,-1, &statement, NULL);
        //NSLog(@"%d",sqlite3_step(statement));
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            sqlite3_close(database);
            isSuccess=YES;
        }
        else {
            sqlite3_close(database);
            
            isSuccess=NO;
        }
        sqlite3_reset(statement);
    }
    sqlite3_finalize(statement);
    sqlite3_close(database);
    return isSuccess;
}




- (BOOL) SaveRewardDetail:(ResolveInfo*)client{
    //[self findDBPath];
    const char *dbpath = [databasepath UTF8String];
    // NSLog(@"DBPATH:%s",dbpath);
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        //CREATE TABLE "Resolutions" ("resolveName" TEXT, "OftenType" TEXT, "HowOften" TEXT, "Points" INTEGER, "date" TEXT, "status" INTEGER)
        //        CREATE TABLE "Rewards" ("rewardName" TEXT, "rewardPoint" INTEGER, "status" INTEGER)
       // NSString *insertSQL = [NSString stringWithFormat:@"insert into Resolutions (resolveName,OftenType,HowOften,Points,date,status) values(\"%@\",\"%@\",\"%@\",%i,\"%@\",%i)",client.ResolveName,client.ResolveType,client.HowOfen,client.RsolvePoint,client.Resolvedate,client.Rsolvesatus];
        
            NSString *insertSQL = [NSString stringWithFormat:@"insert into Reward (Rewardname,Rewardpoint,rewardstatus) values(\"%@\",%i,%i)",client.Rewardname,client.Rewardpoint,client.rewardstatus];
        //  NSLog(@"%@",insertSQL);
        const char *insert_stmt = [insertSQL UTF8String];
        // NSLog(@"%i",sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL));
        
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        
        //  NSLog(@"%i",sqlite3_step(statement));
        NSLog(@"error %s.",sqlite3_errmsg(database));
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        { sqlite3_finalize(statement);
            sqlite3_close(database);
            return YES;
        }
        else { sqlite3_finalize(statement);
            sqlite3_close(database);
            return NO;
        }
        sqlite3_reset(statement);
    }
    return NO;
}


@end