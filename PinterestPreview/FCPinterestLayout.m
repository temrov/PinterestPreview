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

@interface FCPinterestLayout()


@end


@implementation FCPinterestLayout

- (CGFloat)getContentWigth
{
    UIEdgeInsets insets = [self.collectionView contentInset];
    return CGRectGetWidth([self.collectionView bounds]) - (insets.left + insets.right);
}
- (id)init
{
    static BOOL firstCall = TRUE;
    if (firstCall) {
        self.numberOfColumns = 2;
        self.cellPadding = 0.6;
        self.cashe = [[NSMutableArray alloc] initWithCapacity:10];
        firstCall = FALSE;
    }
    
    return self;
}

- (void)prepareLayout
{
    [self init];
    if (self.cashe.count == 0) {
        
        if (0 == [self.collectionView numberOfItemsInSection:0]) {
            return;
        }
        //Pre-Calculates the X Offset for every column and adds an array to increment the currently max Y Offset for each column
        CGFloat columnWidth = [self getContentWigth] / self.numberOfColumns;
        double xOffset[self.numberOfColumns];
        double yOffset[self.numberOfColumns];
        NSInteger column;
        for( column = 0; column < self.numberOfColumns; column++ )
        {
            xOffset[column] = column * columnWidth;
            yOffset[column] = 0;
        }
        
        
        column = 0;
        
        for(int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++)
        {
            NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            // Asks the delegate for the height of the picture and the annotation and calculates the cell frame.
           
            CGFloat width = columnWidth - self.cellPadding;
           
            CGFloat photoHeight = 500 ;
            photoHeight = [self.layoutDelegate cellHeightInCollectionView:self.collectionView AtIndexPath:indexPath WithWidth:width];
           
            CGFloat height = self.cellPadding + photoHeight + self.cellPadding;
           
            CGRect frame = CGRectMake(xOffset[column], yOffset[column],width, height);
            CGRect insetFrame = CGRectInset(frame, self.cellPadding, self.cellPadding);
            
            // Creates an UICollectionViewLayoutItem with the frame and add it to the cache
            
            FCPinterestLayoutAttributes* attributes = [FCPinterestLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            
            attributes.itemHeight = photoHeight;
            attributes.frame = insetFrame;
    
            [self.cashe addObject:attributes];
            
            //  Updates the collection view content height
            self.contentHeight = MAX(self.contentHeight, CGRectGetMaxY(frame));
            
            yOffset[column] = yOffset[column] + height;
            
            column = column >= (self.numberOfColumns - 1) ? 0 : ++column;
        }
         
    }
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
