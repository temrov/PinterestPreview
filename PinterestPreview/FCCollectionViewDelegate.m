//
//  FCCollectionViewDelegate.m
//  PinterestPreview
//
//  Created by user01 on 21.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import "FCCollectionViewDelegate.h"
#import "FCJSonRequest.h"
#import "FCPinterestLayout.h"


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
    
    CGRect viewBounds = scrollView.bounds;
    CGFloat delta = 50;

    UICollectionView* collectionView = (UICollectionView*)scrollView;
    
    FCPinterestLayout* layout = (FCPinterestLayout*)collectionView.collectionViewLayout;
    CGPoint bottomPosition = [layout getNextItemPosition];

    if (bottomPosition.y - targetContentOffset->y < viewBounds.size.height + delta )
    {
        [self.itemProvider loadMoreItemsInTailForSelection:POPULAR_ITEMS_PATH AndNotify:collectionView];
    }
}
@end
