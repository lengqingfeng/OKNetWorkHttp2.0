//
//  OKNetWorkHttpConfigure.h
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/10/30.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFSecurityPolicy;

@interface OKNetWorkHttpConfigure : NSObject

+ (OKNetWorkHttpConfigure *)sharedConfig;

@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic, strong) NSDictionary *httpHeadDictionary;
@property (nonatomic, strong) AFSecurityPolicy *securityPolicy;

@end
