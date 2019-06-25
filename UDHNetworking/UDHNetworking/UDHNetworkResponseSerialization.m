//
//  UDHNetworkResponseSerialization.m
//  UDHNetworking
//
//  Created by hcy on 2019/6/24.
//  Copyright © 2019 yd. All rights reserved.
//

#import "UDHNetworkResponseSerialization.h"
#import <AFNetworking.h>
#pragma clang diagnostic ignored "-Wincomplete-implementation"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
#pragma clang diagnostic ignored "-Wprotocol"
@interface UDHNetworkResponseSerialization()
@property(strong,nonatomic)AFHTTPResponseSerializer *af_responseSerializer;
@end
@implementation UDHNetworkResponseSerialization
+(instancetype)serializer{
    return  [self new];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.af_responseSerializer=[AFHTTPResponseSerializer new];
    }
    return self;
}


@end


@implementation UDHNetworkJSONResponseSerializer
+(instancetype)serializerWithReadingOptions:(NSJSONReadingOptions)readingOptions{
    AFJSONResponseSerializer *afjson=[AFJSONResponseSerializer new];
    UDHNetworkJSONResponseSerializer *udhjson=[UDHNetworkJSONResponseSerializer new];
    udhjson.af_responseSerializer=afjson;
    return udhjson;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.af_responseSerializer=[AFJSONResponseSerializer new];
    }
    return self;
}
@end

@implementation UDHNetworkXMLParserResponseSerializer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.af_responseSerializer=[AFXMLParserResponseSerializer new];
    }
    return self;
}

@end

@implementation UDHNetworkPropertyListResponseSerializer
+(instancetype)serializerWithFormat:(NSPropertyListFormat)format readOptions:(NSPropertyListReadOptions)readOptions{
    
    AFPropertyListResponseSerializer *plresp=[AFPropertyListResponseSerializer serializerWithFormat:format readOptions:readOptions];
    
    UDHNetworkPropertyListResponseSerializer *udhpl=[UDHNetworkPropertyListResponseSerializer new];
    udhpl.af_responseSerializer=plresp;
    
    return udhpl;
}

@end

@implementation UDHNetworkImageResponseSerializer

@end
@implementation UDHNetworkCompoundResponseSerializer
+(instancetype)compoundSerializerWithResponseSerializers:(NSArray<id<UDHNetworkResponseSerialization>> *)responseSerializers{
    AFCompoundResponseSerializer *afcomp=[AFCompoundResponseSerializer compoundSerializerWithResponseSerializers:responseSerializers];
    
    UDHNetworkCompoundResponseSerializer *udhcomp=[UDHNetworkCompoundResponseSerializer new];
    udhcomp.af_responseSerializer=afcomp;
    
    return udhcomp;
}

@end

