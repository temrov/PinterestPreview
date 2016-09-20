//
//  FCItemSize.h
//  PinterestPreview
//
//  Created by user01 on 20.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface FCItemSize : NSObject
@property (nonatomic) NSNumber* width;
@property (nonatomic) NSNumber* height;

-(CGSize)asCGSize;
@end

@interface FCItemSizeMapping : RKObjectMapping
+(RKObjectMapping*)get;
@end