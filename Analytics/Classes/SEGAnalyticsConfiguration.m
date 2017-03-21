//
//  SEGIntegrationsManager.h
//  Analytics
//
//  Created by Tony Xiao on 9/20/16.
//  Copyright © 2016 Segment. All rights reserved.
//

#import "SEGAnalyticsConfiguration.h"
#import "SEGCrypto.h"


@interface SEGAnalyticsConfiguration ()

@property (nonatomic, copy, readwrite) NSString *writeKey;
@property (nonatomic, copy, readwrite) NSString *endpoint;
@property (nonatomic, strong, readonly) NSMutableArray *factories;

@end


@implementation SEGAnalyticsConfiguration

+ (instancetype)configurationWithWriteKey:(NSString *)writeKey endpoint:(NSString *)endpoint
{
	return [[SEGAnalyticsConfiguration alloc] initWithWriteKey:writeKey endpoint:endpoint];
}

- (instancetype)initWithWriteKey:(NSString *)writeKey endpoint:(NSString *)endpoint
{
    if (self = [self init]) {
        self.writeKey = writeKey;
        self.endpoint = endpoint;
    }
    return self;
}

- (instancetype)initWithEndpoint:(NSString *)endpoint
{
    if (self = [self init]) {
        self.endpoint = endpoint;
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.shouldUseLocationServices = NO;
        self.enableAdvertisingTracking = YES;
        self.shouldUseBluetooth = NO;
        self.flushAt = 20;
        _factories = [NSMutableArray array];
    }
    return self;
}

- (void)use:(id<SEGIntegrationFactory>)factory
{
    [self.factories addObject:factory];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%p:%@, %@>", self, self.class, [self dictionaryWithValuesForKeys:@[ @"writeKey", @"shouldUseLocationServices", @"flushAt" ]]];
}

@end
