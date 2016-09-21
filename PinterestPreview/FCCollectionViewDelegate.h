//
//  FCCollectionViewDelegate.h
//  PinterestPreview
//
//  Created by user01 on 21.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "FCItemProvider.h"

@interface FCCollectionViewDelegate : NSObject<UICollectionViewDelegate>

-(id)initWithDataProvider:(FCItemProvider*) itemProvider;

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate;
@end
