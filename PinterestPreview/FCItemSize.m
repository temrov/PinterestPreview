//
//  FCItemSize.m
//  PinterestPreview
//
//  Created by user01 on 20.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import "FCItemSize.h"

@implementation FCItemSize

-(CGSize)asCGSize{
    return CGSizeMake(self.width.floatValue, self.height.floatValue);
}

@end

@implementation FCItemSizeMapping

+ (RKObjectMapping*)get{
    RKObjectMapping* visualItemMapping = [RKObjectMapping mappingForClass:[FCItemSize class]];
    [visualItemMapping addAttributeMappingsFromDictionary:
     @{
       @"w" : @"width",
       @"h" : @"height"
       }];
    return visualItemMapping;
}

@end