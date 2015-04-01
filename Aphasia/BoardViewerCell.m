//
//  BoardViewerCell.m
//  Aphasia
//
//  Created by Pedro Figueiredo on 4/1/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "BoardViewerCell.h"

@interface BoardViewerCell ()

@property (strong, nonatomic) BoardStructureNode *correspondingNode;

@end

@implementation BoardViewerCell

- (void)setCorrespondingNode:(BoardStructureNode *)correspondingNode {
    _correspondingNode = correspondingNode;
}

- (BoardStructureNode *)getCorrespondingNode {
    return self.correspondingNode;
}

@end
