//
//  FCVisualItem.h
//  JSonTest
//
//  Created by user01 on 14.09.16.
//  Copyright © 2016 user01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "FCItemSize.h"

/**
 * Base class of viewing object.
 */
@interface FCVisualItem : NSObject

@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSString* identifier;
@property (strong, nonatomic) FCItemSize* size;
@property (strong, nonatomic) NSString* type;

@property (strong, nonatomic) UIImage* content;
@end

