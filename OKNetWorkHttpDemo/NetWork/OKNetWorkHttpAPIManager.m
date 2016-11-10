//
//  OKNetWorkHttpAPIManager.m
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/4/10.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#import "OKNetWorkHttpAPIManager.h"
#import "OKNetWorkHttpRequest.h"
static NSString *KErrorCode = @"errorCode";
static NSString *KErrorDescribe = @"errorDescribe";

@implementation OKNetWorkHttpAPIManager
+ (instancetype)sharedInstance{
    static OKNetWorkHttpAPIManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[OKNetWorkHttpAPIManager alloc]init];
    });
    
    return manager;
    
}
- (NSDictionary *)getErrorInfo:(id )errorInfo  type:(EErrorType)type{
    if (type == EErrorTypeWithServer) {
        return  @{KErrorCode:@([[errorInfo objectForKey:@"code"]integerValue]),KErrorDescribe:[errorInfo objectForKey:@"message"]};
    }
    NSError *error =(NSError *)errorInfo;
    return  @{KErrorCode:@(error.code),KErrorDescribe:error.description};
}

#pragma mark - 首页展示接口 V1.0
- (void)requestHomeListWithParams:(NSDictionary *)params Success:(SuccessResponseObject)success failure:(ErrorResponseObject)failure{
    
    NSString *url = @"/article/cate/123.json?appid=AGcCMAhmB2YBOQ%3D%3D&appType=iPhone&token=6eadc9f537435da3c453f028ada5d54a&version=2.3.1&page=1";

     [OKNetWorkHttpRequest postDataWithParameters:params interfaceUrlString:url success:^(id responseObject) {
         
         if ([[responseObject objectForKey:@"code"]integerValue] == 0) {
             if (success) {
                 success(responseObject);
             }
         }else{
             if (failure) {
                 failure([self getErrorInfo:responseObject type:EErrorTypeWithServer] );
             }
         }
         
     } failure:^(NSError *error) {
         if (failure) {
             failure([self getErrorInfo:error type:EErrorTypeWithServer] );
         }
     }];
}

@end
