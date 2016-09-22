//
//  FCBundlePaging.m
//  PinterestPreview
//
//  Created by user01 on 22.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import "FCBundlePaging.h"

@implementation FCPagingCursor

@end

@implementation FCBundlePaging


@end


@implementation FCBundlePagingMapping

+(RKMapping*)get
{
    RKObjectMapping *cursorMapping = [RKObjectMapping mappingForClass:[FCPagingCursor class]];
    [cursorMapping addAttributeMappingsFromArray:@[@"prev", @"next"]];
    
    RKObjectMapping* pagingMapping = [RKObjectMapping mappingForClass:[FCBundlePaging class]];
   // [pagingMapping addAttributeMappingsFromArray:@[@"hasNext", @"hasPrev"]];
    
    [pagingMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"cursors" toKeyPath:@"cursors" withMapping:cursorMapping]];
    return pagingMapping;
}

@end