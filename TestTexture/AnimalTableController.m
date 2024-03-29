/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "AnimalTableController.h"
#import "RainforestCardInfo.h"
#import "CardNode.h"
#import "CardCell.h"


@interface AnimalTableController ()<ASTableDelegate,ASTableDataSource>
@property (strong, nonatomic) ASTableNode *tableNode;
@property (strong, nonatomic) NSMutableArray<RainforestCardInfo *> *animals;
@end


@implementation AnimalTableController

#pragma mark - Lifecycle

- (instancetype)initWithAnimals:(NSArray<RainforestCardInfo *> *)animals {
    _tableNode = [[ASTableNode alloc]initWithStyle:UITableViewStylePlain];
    _animals = animals.mutableCopy;
    if (!(self = [super init])) { return nil; }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self wireDelegation];
    [self applyStyle];
    [self.view addSubnode:self.tableNode];
    self.tableNode.leadingScreensForBatching = 1.0;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableNode.frame = self.view.bounds;
}

#pragma mark - Delegation

- (void)wireDelegation {
    self.tableNode.dataSource = self;
    self.tableNode.delegate = self;
}

#pragma mark - Appearance

- (void)applyStyle {
    self.view.backgroundColor = [UIColor blackColor];
    self.tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - ASTableDataSource
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return  self.animals.count;
}
- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    RainforestCardInfo *animal = self.animals[indexPath.row];
    return ^{
        CardNode *cardNode = [[CardNode alloc]initWithAnimal:animal];
        return cardNode;
    };
}

#pragma mark -ASTableDelegate
- (ASSizeRange)tableNode:(ASTableNode *)tableNode constrainedSizeForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGSize min = CGSizeMake(width, ([UIScreen mainScreen].bounds.size.height/3) * 2);
    CGSize max = CGSizeMake(width, [UIScreen mainScreen].bounds.size.height);
    return ASSizeRangeMake(min, max);
}
//
//- (BOOL)shouldBatchFetchForTableNode:(ASTableNode *)tableNode {
//    return YES;
//}

//- (void)tableNode:(ASTableNode *)tableNode willBeginBatchFetchWithContext:(ASBatchContext *)context {
//    //1
//    [self retrieveNextPageWithCompletion:^(NSArray *animals) {
//        //2
//        [self insertNewRowsInTableNode:animals];
//        //3
//        [context completeBatchFetching:YES];
//    }];
//}

#pragma mark -helpers
//- (void)retrieveNextPageWithCompletion:(void (^)(NSArray *))block {
//    NSArray *moreAnimals = [[NSArray alloc] initWithArray:[self.animals subarrayWithRange:NSMakeRange(0, 5)] copyItems:NO];
//
//    // Important: this block must run on the main thread
//    dispatch_async(dispatch_get_main_queue(), ^{
//        block(moreAnimals);
//    });
//}
//
//- (void)insertNewRowsInTableNode:(NSArray *)newAnimals {
//    NSInteger section = 0;
//    NSMutableArray *indexPaths = [NSMutableArray array];
//
//    NSUInteger newTotalNumberOfPhotos = self.animals.count + newAnimals.count;
//    for (NSUInteger row = self.animals.count; row < newTotalNumberOfPhotos; row++) {
//        NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:section];
//        [indexPaths addObject:path];
//    }
//
//    [self.animals addObjectsFromArray:newAnimals];
//    [self.tableNode insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
//}
@end
