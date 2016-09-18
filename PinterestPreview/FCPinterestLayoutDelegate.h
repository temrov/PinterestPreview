//
//  FCPinterestLayoutDelegate.h
//  PinterestPreview
//
//  Created by user01 on 18.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#ifndef FCPinterestLayoutDelegete_h
#define FCPinterestLayoutDelegete_h

#import <UIKit/UIKit.h>

@protocol FCPinterestLayoutDelegate

- (CGFloat) cellHeightInCollectionView : (UICollectionView*) collectionView
                           AtIndexPath : (NSIndexPath*) indexPath
                              WithWidth: (CGFloat) width;

@end

#endif /* FCPinterestLayoutDelegete_h */
