//
//  FCItemProvider.h
//  PinterestPreview
//
//  Created by user01 on 21.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#ifndef FCItemProvider_h
#define FCItemProvider_h

#import "FCVisualItem.h"


@interface FCItemProvider : NSObject
-(id) init;
-(void)loadMoreItemsInTailForSelection:(NSString*) selectionPath AndNotify:(UICollectionView*) collectionView;
-(FCVisualItem*)getByIndex:(NSInteger) index;
-(NSInteger)count;

@end

#endif /* FCItemProvider_h */
