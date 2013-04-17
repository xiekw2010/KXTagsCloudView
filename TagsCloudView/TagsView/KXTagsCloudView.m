//
//  ILSINSRandomTagsView.m
//  ILSINSInstaFollower
//
//  Created by Kaiwei.Xie on 4/11/13.
//  Copyright (c) 2013 Kaiwei Xie. All rights reserved.
//

#import "KXTagsCloudView.h"

@interface KXTagsCloudView (){
    CGRect _middleRect;
    CGFloat _middleFont;
}
@end

@implementation KXTagsCloudView

- (id)initWithFrame:(CGRect)frame withTagsArray:(NSArray *)tagsArray {
    if (self = [super initWithFrame:frame]) {
        [self customTheLayoutWithArray:tagsArray];
    }
    return self;
}

- (void)customTheLayoutWithArray:(NSArray *)tagsArray{
    for (UIButton *btn in self.subviews) {
        [btn removeFromSuperview];
    }
    NSInteger padOrIphone = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 20 : 10;
    CGFloat randomFloat = arc4random() % padOrIphone;
    CGSize middleSize = CGSizeMake(self.bounds.size.width / 3, self.bounds.size.height / 7);
    CGRect button1Rect;
    CGRect button2Rect;
    CGRect button3Rect;
    CGRect button4Rect;
    CGRect button5Rect;
    CGRect button6Rect;
    CGRect button7Rect;
    CGRect button8Rect;
    
    _middleRect = CGRectMake((self.bounds.size.width - middleSize.width) / 2,
                             (self.bounds.size.height - middleSize.height) / 2, middleSize.width, middleSize.height);
    _middleFont = middleSize.height - 2;
    for (int i = 0; i < tagsArray.count; i++) {
        KXTagsButton *button = [[[KXTagsButton alloc] initWithFrame:CGRectZero withTitle:tagsArray[i]] autorelease];
        button.tag = i;
        if (i == 0) {
            button.frame = _middleRect;
            button.titleLabel.font = [UIFont boldSystemFontOfSize:_middleFont];
            [self addButtonEventWithButton:button];
        }else if (i == 1){
            CGSize button1Size = CGSizeMake(_middleRect.size.width / 2, _middleRect.size.height * 4 / 5);
            button1Rect = button.frame = CGRectMake(CGRectGetMinX(_middleRect) - button1Size.width + randomFloat, CGRectGetMinY(_middleRect) - button1Size.height, button1Size.width, button1Size.height);
            if ([self checkIfOutSideWithRect:button1Rect]) {
                continue;
            }
            button.titleLabel.font = [UIFont systemFontOfSize:button1Size.height];
            [self addButtonEventWithButton:button];
        }else if (i == 2){
            CGSize button2Size = CGSizeMake(_middleRect.size.width / 2, _middleRect.size.height / 2);
            button2Rect = button.frame = CGRectMake(CGRectGetMaxX(_middleRect) - randomFloat, CGRectGetMaxY(_middleRect) + randomFloat, button2Size.width, button2Size.height);
            if ([self checkIfOutSideWithRect:button2Rect]) {
                continue;
            }
            button.titleLabel.font = [UIFont systemFontOfSize:button2Size.height - 2];
            [self addButtonEventWithButton:button];
        }else if (i == 3){
            CGSize button3Size = CGSizeMake(_middleRect.size.width / 2, _middleRect.size.height * 4/5);
            button3Rect = button.frame = CGRectMake(CGRectGetMinX(button1Rect) - button3Size.width - 2 * randomFloat, CGRectGetMaxY(_middleRect) + randomFloat, button3Size.width, button3Size.height);
            if ([self checkIfOutSideWithRect:button3Rect]) {
                continue;
            }
            button.titleLabel.font = [UIFont boldSystemFontOfSize:button3Size.height];
            [self addButtonEventWithButton:button];
        }else if (i == 4){
            CGSize button4Size = CGSizeMake(_middleRect.size.width / 2, _middleRect.size.height * 4/5);
            button4Rect = button.frame = CGRectMake(CGRectGetMaxX(_middleRect) + randomFloat, CGRectGetMinY(button1Rect) - randomFloat, button4Size.width, button4Size.height);
            if ([self checkIfOutSideWithRect:button4Rect]) {
                continue;
            }
            button.titleLabel.font = [UIFont boldSystemFontOfSize:button4Size.height - 2];
            [self addButtonEventWithButton:button];
        }else if (i == 5){
            CGSize button5Size = CGSizeMake(_middleRect.size.width / 2, button1Rect.size.height);
            button5Rect = button.frame = CGRectMake(CGRectGetMaxX(button3Rect) + randomFloat, CGRectGetMaxY(button3Rect) + randomFloat, button5Size.width, button5Size.height);
            if ([self checkIfOutSideWithRect:button5Rect]) {
                continue;
            }
            button.titleLabel.font = [UIFont systemFontOfSize:button5Size.height];
            [self addButtonEventWithButton:button];
        }else if (i == 6){
            CGSize button6Size = CGSizeMake(_middleRect.size.width * 2 / 3, _middleRect.size.height * 5/4);
            button6Rect = button.frame = CGRectMake(CGRectGetMinX(button1Rect) - button1Rect.size.width + randomFloat, CGRectGetMinY(button1Rect) -  2 * randomFloat - button6Size.height, button6Size.width, button6Size.height);
            if ([self checkIfOutSideWithRect:button6Rect]) {
                continue;
            }
            button.titleLabel.font = [UIFont boldSystemFontOfSize:button6Size.height - 2];
            [self addButtonEventWithButton:button];
        }else if (i == 7){
            CGSize button7Size = CGSizeMake(_middleRect.size.width, _middleRect.size.height / 2);
            button7Rect = button.frame = CGRectMake(CGRectGetMinX(button4Rect) + 3 * randomFloat, CGRectGetMinY(button4Rect) - button7Size.height - 3 * randomFloat, button7Size.width, button7Size.height);
            if ([self checkIfOutSideWithRect:button7Rect]) {
                continue;
            }
            button.titleLabel.font = [UIFont boldSystemFontOfSize:button7Size.height];
            [self addButtonEventWithButton:button];
        }else if (i == 8){
            CGSize button8Size = CGSizeMake(button6Rect.size.width, _middleRect.size.height * 4/5);
            button8Rect = button.frame = CGRectMake(CGRectGetMinX(button2Rect) + randomFloat - button2Rect.size.width, CGRectGetMaxY(button2Rect) + 2 * randomFloat, button8Size.width, button8Size.height);
            if ([self checkIfOutSideWithRect:button8Rect]) {
                continue;
            }
            button.titleLabel.font = [UIFont boldSystemFontOfSize:button8Size.height - 2];
            [self addButtonEventWithButton:button];
        }
    }
}

- (BOOL)checkIfOutSideWithRect:(CGRect)checkRect {
    if (CGRectGetMinX(checkRect) < self.bounds.origin.x || CGRectGetMaxX(checkRect) > self.bounds.size.width
        || CGRectGetMinY(checkRect) < self.bounds.origin.y|| CGRectGetMaxY(checkRect) > self.bounds.size.height) {
        return YES;
    }else{
        return NO;
    }
}

- (void)addButtonEventWithButton:(KXTagsButton *)btn {
    [btn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    btn.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
    [UIView animateWithDuration:0.5 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        btn.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        nil;
    }];
}

- (void)btnTapped:(KXTagsButton *)tBtn {
    if (self.buttonTappedBlock != nil) {
        for (KXTagsButton *tagButton in self.subviews) {
            tagButton.selected = NO;
        }
        tBtn.selected = YES;
        self.buttonTappedBlock([tBtn titleForState:UIControlStateNormal]);
    }
}


@end

@implementation KXTagsButton

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title {
    if (self = [super initWithFrame:frame]) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
        self.titleLabel.shadowOffset = CGSizeMake(0, 1);
    }
    return self;
}


@end