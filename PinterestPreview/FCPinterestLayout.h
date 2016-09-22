//
//  FCPinterestLayout.h
//  PinterestPreview
//
//  Created by user01 on 18.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCPinterestLayoutDelegate.h"
#import "FCItemProvider.h"

@interface FCPinterestLayout : UICollectionViewLayout

@property (assign, nonatomic) id<FCPinterestLayoutDelegate> layoutDelegate;
@property (weak, nonatomic) FCItemProvider* itemProvider;


// Configurable properties
@property(nonatomic) NSInteger numberOfColumns;
@property(nonatomic) CGFloat cellPadding;

// Array to keep a cache of attributes.
@property(nonatomic) NSMutableArray* cashe;
@property(nonatomic) CGFloat contentHeight;

- (CGFloat)getContentWigth;
- (void)prepareLayout;
@end
