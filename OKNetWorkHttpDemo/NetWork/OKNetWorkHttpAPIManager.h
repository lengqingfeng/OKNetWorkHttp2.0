//
//  OKNetWorkHttpAPIManager.h
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/4/10.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,EErrorType) {
    EErrorTypeWithSystem,
    EErrorTypeWithServer
};

typedef void (^SuccessResponseObject)(id responseObject);
typedef void (^ErrorResponseObject)(NSDictionary *error);

@interface OKNetWorkHttpAPIManager : NSObject

+ (instancetype)sharedInstance;

- (void)requestHomeListWithParams:(NSDictionary *)params Success:(SuccessResponseObject)success failure:(ErrorResponseObject)failure;

@end
