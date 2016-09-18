//
//  FCPinterestLayoutAttributes.m
//  PinterestPreview
//
//  Created by user01 on 18.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import "FCPinterestLayoutAttributes.h"

@implementation FCPinterestLayoutAttributes

- (id)copyWithZone:(nullable NSZone *)zone
{
    FCPinterestLayoutAttributes* copy = [super copyWithZone:zone];
    copy.itemHeight = self.itemHeight;
    return copy;
}

- (BOOL)isEqual:(id)object
{
    if (!object) {
        return FALSE;
    }
    FCPinterestLayoutAttributes* attrObj =  (FCPinterestLayoutAttributes*)object;
    if (attrObj.itemHeight == self.itemHeight) {
        return [super isEqual:object];
    }
    return FALSE;
}

@end
