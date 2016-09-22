//
//  FCCollectionViewDelegate.m
//  PinterestPreview
//
//  Created by user01 on 21.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import "FCCollectionViewDelegate.h"
#import "FCJSonRequest.h"


@interface FCCollectionViewDelegate()
@property (weak,  nonatomic) FCItemProvider* itemProvider;
@end

@implementation FCCollectionViewDelegate

-(id)initWithDataProvider:(FCItemProvider*) itemProvider
{
    if (self != [super init]) {
        return nil;
    }
    self.itemProvider = itemProvider;
    return self;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate
{
    if (decelerate) {
        UICollectionView* collectionView = (UICollectionView*)scrollView;
        [self.itemProvider loadMoreItemsInTailForSelection:FEATURED_ITEMS_PATH AndNotify:collectionView];
    }
}
@end
