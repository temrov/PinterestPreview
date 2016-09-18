//
//  FCCollectionViewCell.m
//  PinterestPreview
//
//  Created by user01 on 18.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import "FCCollectionViewCell.h"
#import "FCPinterestLayoutAttributes.h"


@implementation FCCollectionViewCell

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];

    FCPinterestLayoutAttributes* attributes = (FCPinterestLayoutAttributes*)layoutAttributes;
    if (nil == attributes) {
        return;
    }
    self.imageViewHeightLayoutConstraint.constant = attributes.itemHeight;
}
@end
