//
//  DetailsViewController.m
//  Aphasia
//
//  Created by Elias Ayache on 29/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _TitleLabel.text = _DetailModal[0];
    _DescriptionLabel.text = _DetailModal[1];
    _ImageView.image = [UIImage imageNamed:_DetailModal[2]];
    
    self.navigationItem.title = _DetailModal[0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
