//
//  BoardViewerCell.h
//  Aphasia
//
//  Created by Pedro Figueiredo on 4/1/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardStructureNode.h"

@interface BoardViewerCell : UICollectionViewCell

@property (readonly, strong, nonatomic) BoardStructureNode *correspondingNode;
@property (strong, nonatomic) IBOutlet UIImageView *image;

- (void)setCorrespondingNode:(BoardStructureNode *)correspondingNode;

- (BoardStructureNode *)getCorrespondingNode;

@end
