//
//  FavoriteScaleView.m
//  FavoriteScale-OC
//
//  Created by liangqi on 15/12/16.
//  Copyright © 2015年 dailyios. All rights reserved.
//

#import "FavoriteScaleView.h"

#define kFavoriteScaleDefaultSize CGRectMake(0, 0, 80, 80)


@interface FavoriteScaleView()

@property(nonatomic,strong) UIImageView* selectedView;
@property(nonatomic,strong) UIImageView* unSelectedView;

@property(nonatomic,assign) BOOL animating;

@property(nonatomic,assign) NSInteger count;

@end

@implementation FavoriteScaleView

+ (instancetype)instance{
    return [[self alloc] initWithFrame:kFavoriteScaleDefaultSize];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (!self.animating) {
        [self startAnimate];
    }
}

- (void)setSelected:(BOOL)selected{
    _selected = selected;
    _count = _selected ? 1 : 0;
    [self resetUI];
}

- (void) resetUI{
    if (_selected) {
        _selectedView.transform = CGAffineTransformMakeScale(1, 1);
        _unSelectedView.transform = CGAffineTransformMakeScale(0, 0);
    } else {
        _unSelectedView.transform = CGAffineTransformMakeScale(1, 1);
        _selectedView.transform = CGAffineTransformMakeScale(0, 0);
    }
}

- (void) startAnimate{
    if (_count % 2 == 0) {
        _selectedView.transform = CGAffineTransformMakeScale(0, 0);
        [UIView animateWithDuration:0.6f delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _selectedView.transform = CGAffineTransformMakeScale(1, 1);
        } completion:nil];
        
        [UIView animateWithDuration:0.3f animations:^{
            _unSelectedView.transform = CGAffineTransformMakeScale(0, 0);
        }];
    }else{
        [UIView animateWithDuration:0.3f animations:^{
            _selectedView.transform = CGAffineTransformMakeScale(0, 0);
        }];
        _unSelectedView.transform = CGAffineTransformMakeScale(0, 0);
        [UIView animateWithDuration:0.6f delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _unSelectedView.transform = CGAffineTransformMakeScale(1, 1);
        } completion:nil];
    }
    _count++;
}

- (void) setup{
    _count = 0;
    
    _selectedView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header-icon-selected"]];
    _selectedView.frame = self.bounds;
    _selectedView.contentMode = UIViewContentModeScaleToFill;
    
    _unSelectedView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header-icon-unselected"]];
    _unSelectedView.frame = self.bounds;
    _unSelectedView.contentMode = UIViewContentModeScaleToFill;
    
    // 默认未选中状态
    _selectedView.transform = CGAffineTransformMakeScale(0, 0);
    [self addSubview:_selectedView];
    [self addSubview:_unSelectedView];
}


@end
