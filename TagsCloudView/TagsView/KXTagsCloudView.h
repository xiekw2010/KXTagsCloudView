//
//  ILSINSRandomTagsView.h
//  ILSINSInstaFollower
//
//  Created by Kaiwei.Xie on 4/11/13.
//  Copyright (c) 2013 Kaiwei Xie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonTappedWithTitle)(NSString *buttonTitle);

@interface KXTagsCloudView : UIView

- (id)initWithFrame:(CGRect)frame withTagsArray:(NSArray *)tagsArray;
- (void)customTheLayoutWithArray:(NSArray *)tagsArray;

@property (nonatomic, copy) ButtonTappedWithTitle buttonTappedBlock;

@end


@interface KXTagsButton : UIButton

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title;

@end