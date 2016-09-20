//
//  FCImage.m
//  JSonTest
//
//  Created by user01 on 14.09.16.
//  Copyright © 2016 user01. All rights reserved.
//

#import "FCImage.h"
#import "FCItemSize.h"

@implementation FCImage

@end


@implementation FCImageMapping
+(RKMapping*)get{
    RKObjectMapping* visualItemMapping = [RKObjectMapping mappingForClass:[FCImage class]];
    [visualItemMapping addAttributeMappingsFromDictionary:
     @{
       @"id" : @"identifier",
       @"url" : @"url",
       @"type" : @"type"
       
       }];
    RKObjectMapping* sizeMapping = [FCItemSizeMapping get];
    [visualItemMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"size" toKeyPath:@"size" withMapping:sizeMapping]];

    RKDynamicMapping *mapping = [RKDynamicMapping new];
    [mapping addMatcher:[RKObjectMappingMatcher matcherWithKeyPath:@"type" expectedValue:@"pic" objectMapping:visualItemMapping]];
    return mapping;
}

@end