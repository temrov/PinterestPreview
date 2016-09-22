//
//  FCCollectionViewController.m
//  PinterestPreview
//
//  Created by user01 on 18.09.16.
//  Copyright © 2016 temrov. All rights reserved.
//

#import "FCCollectionViewController.h"
#import "FCPinterestLayoutAttributes.h"
#import "FCPinterestLayout.h"
#import "FCImage.h"
#import "FCItemProvider.h"

#import "FCCollectionViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import "FCCollectionViewDelegate.h"

@interface FCCollectionViewController ()
@property (nonatomic) FCItemProvider *itemProvider;
@property (nonatomic) FCCollectionViewDelegate* scrollDelegate;
@end

@implementation FCCollectionViewController

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
static NSString * const reuseIdentifier = @"FCCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set the PinterestLayout delegate
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.contentInset = UIEdgeInsetsMake(23, 5, 10, 5);
    
    self.itemProvider = [[FCItemProvider alloc] init];
    FCPinterestLayout* layout = (FCPinterestLayout* ) self.collectionView.collectionViewLayout;
    layout.layoutDelegate = self;
    layout.itemProvider = self.itemProvider;

    self.scrollDelegate =[[FCCollectionViewDelegate alloc] initWithDataProvider:self.itemProvider];
    self.collectionView.delegate = self.scrollDelegate;
    //[self.itemProvider loadMoreItemsInTailForSelection:FEATURED_ITEMS_PATH AndNotify:self.collectionView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    // the only collection
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.itemProvider count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FCCollectionViewCell *cell = (FCCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    // Configure the cell
    UIImageView *recipeImageView = cell.imageView;
    FCVisualItem* viewingElement = [self.itemProvider getByIndex:indexPath.row];
    NSURL* url = [[NSURL alloc] initWithString:viewingElement.url];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
    recipeImageView.image = [[UIImage alloc] initWithData:imageData];
    return cell;
}

#pragma mark <FCPinterestLayoutDelegete>

- (CGFloat) cellHeightInCollectionView : (UICollectionView*) collectionView
                           AtIndexPath : (NSIndexPath*) indexPath
                              WithWidth: (CGFloat) width
{
    if (indexPath.row >= [self.itemProvider count]) {
        NSLog(@"getting invalid image by index %ld", (long)indexPath.row);
        return 0;
    }
    FCVisualItem* viewingElement = [self.itemProvider getByIndex:indexPath.row];
    CGRect boundingRect= CGRectMake(0, 0, width, MAXFLOAT);
    CGRect rect = AVMakeRectWithAspectRatioInsideRect([viewingElement.size asCGSize], boundingRect);
    return rect.size.height;
}

@end
