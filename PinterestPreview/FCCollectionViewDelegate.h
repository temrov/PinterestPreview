//
//  FCCollectionViewDelegate.h
//  PinterestPreview
//
//  Created by user01 on 21.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface FCCollectionViewDelegate : NSObject<UICollectionViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate;
@end
