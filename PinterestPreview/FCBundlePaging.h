//
//  FCBundlePaging.h
//  PinterestPreview
//
//  Created by user01 on 22.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface FCPagingCursor : NSObject
@property (nonatomic) NSString* prev;
@property (nonatomic) NSString* next;
@end

@interface FCBundlePaging : NSObject

//@property (nonatomic) Boolean hasNext;
//@property (nonatomic) Boolean hasPrev;
@property (nonatomic) FCPagingCursor* cursors;
@end

@interface FCBundlePagingMapping : RKObjectMapping
+(RKMapping*)get;
@end

