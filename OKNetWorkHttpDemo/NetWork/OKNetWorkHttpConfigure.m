//
//  OKNetWorkHttpConfigure.m
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/10/30.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#import "OKNetWorkHttpConfigure.h"
#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif
@implementation OKNetWorkHttpConfigure

+ (OKNetWorkHttpConfigure *)sharedConfig {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
- (instancetype)init {
    self = [super init];
    if (self) {
#ifdef DEBUG
        _baseUrl = @"http://appapi.jiemian.com";//测试环境地址
#else
        _baseUrl = @"http://appapi.jiemian.com"; //线上环境地址
#endif
        
        _securityPolicy = [AFSecurityPolicy defaultPolicy];
        
        _httpHeadDictionary = nil;
        
        //key == HeaderField
       // _httpHeadDictionary = @{@"token":@"11111"};
      
    }
    return self;
}
@end
