//
//  FCItemProvider.m
//  PinterestPreview
//
//  Created by user01 on 21.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCItemProvider.h"
#import "FCJSonRequest.h"
#import "FCVisualItemBundle.h"

@interface FCItemProvider()

@property (nonatomic) NSMutableArray* items;
@property (nonatomic) NSString* tailCursor;

@end

@implementation FCItemProvider
- (id) init
{
    if (self != [super init]) {
        return  nil;
    }
    self.items = [[NSMutableArray alloc] initWithCapacity:100];
    return self;
}

-(void)loadMoreItemsInTailForSelection:(NSString*) selectionPath AndNotify:(UICollectionView*) collectionView
{
    // Do any additional setup after loading the view, typically from a nib.
    FCJSonRequest* req = [[FCJSonRequest alloc] init];
    [req configure];
    //RecipeCollectionViewController* weakSelf = self;
    [req loadItemsAtPath:selectionPath
              Parameters:self.tailCursor
               OnSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                   FCVisualItemBundle* res = mappingResult.dictionary[@"content"];
                   [self.items addObjectsFromArray:res.items];
                   /*
                   for (FCVisualItem* visualItem in res.items)
                   {
                       NSURL* url = [[NSURL alloc] initWithString:visualItem.url];
                       NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
                       visualItem.content =  [[UIImage alloc] initWithData:imageData];
                       [self.items addObject:visualItem];
                   }
                    */
                   self.tailCursor = res.paging.cursors.next;
                   [collectionView reloadData];
               }
               OnFailure:^(RKObjectRequestOperation *operation, NSError *error) {
                   NSLog(@"Error getting pictures");
               }];
    
}
-(FCVisualItem*)getByIndex:(NSInteger) index
{
    if (index >= [self count]) {
        return nil;
    }
    return self.items[index];
}
-(NSInteger)count
{
    return self.items.count;
}

@end