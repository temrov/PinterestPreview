//
//  FCVisualItemBundle.h
//  PinterestPreview
//
//  Created by user01 on 22.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCBundlePaging.h"
#import <RestKit/RestKit.h>

@interface FCVisualItemBundle : NSObject

@property (nonatomic) NSArray* items;
@property (nonatomic) FCBundlePaging* paging;
@end


@interface FCVisualItemBundleMapping : RKObjectMapping
+(RKMapping*)get;
@end
