//
//  FCCollectionViewCell.h
//  PinterestPreview
//
//  Created by user01 on 18.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHeightLayoutConstraint;

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes;
@end
