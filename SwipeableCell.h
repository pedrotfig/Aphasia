//
//  SwipeableCell.h
//  Aphasia
//
//  Created by Juliana Salgado on 27/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol CategorieCellDelegate <NSObject>
- (void)buttonOneActionForItemText:(NSString *)itemText;
- (void)buttonTwoActionForItemText:(NSString *)itemText;
- (void)cellDidOpen:(UITableViewCell *)cell;
- (void)cellDidClose:(UITableViewCell *)cell;
@end


@interface SwipeableCell : UITableViewCell

@property (nonatomic, strong) NSString *itemText;
@property (nonatomic, weak) id <CategorieCellDelegate> delegate;
- (void)openCell;

@end

