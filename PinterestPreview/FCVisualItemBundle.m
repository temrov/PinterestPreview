//
//  FCVisualItemBundle.m
//  PinterestPreview
//
//  Created by user01 on 22.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import "FCVisualItemBundle.h"
#import "FCImage.h"

@implementation FCVisualItemBundle

@end


@implementation FCVisualItemBundleMapping

+(RKMapping*)get
{
 
    RKObjectMapping* bundleMapping = [RKObjectMapping mappingForClass:[FCVisualItemBundle class]];
 
    [bundleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"items" toKeyPath:@"items" withMapping:[FCImageMapping get]]];
    
    [bundleMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"paging" toKeyPath:@"paging" withMapping:[FCBundlePagingMapping get]]];
    return bundleMapping;
}
@end