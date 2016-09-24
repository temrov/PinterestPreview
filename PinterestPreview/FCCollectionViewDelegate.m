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

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset
{
    CGSize contentSize = scrollView.contentSize;
    
    CGRect viewBounds = scrollView.bounds;
    CGFloat delta = 200;
    if (contentSize.height - viewBounds.origin.y < viewBounds.size.height + delta) {
        UICollectionView* collectionView = (UICollectionView*)scrollView;
        [self.itemProvider loadMoreItemsInTailForSelection:FEATURED_ITEMS_PATH AndNotify:collectionView];
    }
}
@end
