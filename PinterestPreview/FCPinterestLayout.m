//
//  FCPinterestLayout.m
//  PinterestPreview
//
//  Created by user01 on 18.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import "FCPinterestLayout.h"
#import "FCCollectionViewCell.h"
#import "FCPinterestLayoutAttributes.h"
#import "FCJSonRequest.h"


@interface FCPinterestLayout()

@end


@implementation FCPinterestLayout

- (CGFloat)getContentWigth
{
    UIEdgeInsets insets = [self.collectionView contentInset];
    return CGRectGetWidth([self.collectionView bounds]) - (insets.left + insets.right);
}
- (void)initProps
{
    static BOOL firstCall = TRUE;
    if (firstCall) {
        self.numberOfColumns = 3;
        self.cellPadding = 2;
        self.cashe = [[NSMutableArray alloc] initWithCapacity:300];
        firstCall = FALSE;
    }
}
- (double)getColumnBottom:(double) xOffset
{
    if(self.cashe.count)
    {
        // find from the end
        for (int i = (int)self.cashe.count - 1; i >= 0; i--) {
            
            FCPinterestLayoutAttributes* attributes = [self.cashe objectAtIndex:i];
            if (attributes.frame.origin.x == xOffset)
            {
                // first item that was found
                return attributes.frame.origin.y + attributes.frame.size.height;
            }
        }
    }
    return 0;
}

- (CGPoint)getNextItemPosition
{
    CGFloat columnWidth = [self getContentWigth] / self.numberOfColumns;
    double xOffset[self.numberOfColumns];
    double yOffset[self.numberOfColumns];
    NSInteger column;
    for( column = 0; column < self.numberOfColumns; column++ )
    {
        xOffset[column] = column * columnWidth;
        yOffset[column] = [self getColumnBottom:xOffset[column] + self.cellPadding];
    }
    
    NSInteger minTallColumn = 0;
    // looking for the smallest column
    for (column = 1; column < self.numberOfColumns; column++) {
        if (yOffset[column] < yOffset[minTallColumn]) {
            minTallColumn = column;
        }
    }
    return CGPointMake(xOffset[minTallColumn], yOffset[minTallColumn]);
}
- (void)prepareLayout
{
    [self initProps];
   
    //Pre-Calculates the X Offset for every column and adds an array to increment the currently max Y Offset for each column
    CGFloat columnWidth = [self getContentWigth] / self.numberOfColumns;
    
    // is there any loaded objects, that are not in cashe?
    while(self.cashe.count < self.itemProvider.count)
    {
        CGPoint cellPosition = [self getNextItemPosition];
        size_t i = self.cashe.count;
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // Asks the delegate for the height of the picture and the annotation and calculates the cell frame.
       
        CGFloat width = columnWidth - self.cellPadding;
       
        CGFloat photoHeight;
        photoHeight = [self.layoutDelegate cellHeightInCollectionView:self.collectionView AtIndexPath:indexPath WithWidth:width];
       
        CGFloat height = self.cellPadding + photoHeight + self.cellPadding;
       
        CGRect frame = CGRectMake(cellPosition.x, cellPosition.y,width, height);
        CGRect insetFrame = CGRectInset(frame, self.cellPadding, self.cellPadding);
        
        // Creates an UICollectionViewLayoutItem with the frame and add it to the cache
        FCPinterestLayoutAttributes* attributes = [FCPinterestLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        attributes.itemHeight = photoHeight;
        attributes.frame = insetFrame;

        [self.cashe addObject:attributes];
        
        //  Updates the collection view content height
        self.contentHeight = MAX(self.contentHeight, CGRectGetMaxY(frame));
    }
    CGPoint bottomPosition = [self getNextItemPosition];
    
    CGRect viewBounds = self.collectionView.bounds;
    CGSize contentSize = self.collectionView.contentSize;
    CGFloat delta = 300;
    if (self.collectionView.frame.origin.y + self.collectionView.frame.size.height > bottomPosition.y) {
        [self.itemProvider loadMoreItemsInTailForSelection:POPULAR_ITEMS_PATH AndNotify:self.collectionView];
        
    }
    /*
     else if (bottomPosition.y - viewBounds.origin.y < viewBounds.size.height + delta )
     {
         
         [self.itemProvider loadMoreItemsInTailForSelection:POPULAR_ITEMS_PATH AndNotify:self.collectionView];
     }
    */
    
 
    
}

- (CGSize) collectionViewContentSize
{
    return CGSizeMake([self getContentWigth], self.contentHeight);
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* attributeList = [[NSMutableArray alloc] init];
    for (FCPinterestLayoutAttributes* attributes in self.cashe) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            [attributeList addObject:attributes];
        }
    }
    return attributeList;
}


@end
