
//
//  SZLoginButton.m
//  SZLoginButton
//
//  Created by Zahi on 2018/5/21.
//  Copyright © 2018年 Sideny. All rights reserved.
//

#import "SZLoadingButton.h"
#import "Masonry.h"


@interface SZLoadingButton ()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@end

@implementation SZLoadingButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonSetup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self commonSetup];
}

- (void)commonSetup {
    [self defaultSetup];
    [self addSubview: self.activityIndicator];
    if (@available(iOS 6.0, *)) {
        [self setNeedsUpdateConstraints];
    } else {
        // Fallback on earlier versions
    }
}
- (void)updateConstraints {
    [self.activityIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    [super updateConstraints];
}

- (void)defaultSetup {
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.backgroundColor = UIColor.blueColor;
    [self setTitle:NSLocalizedString(@"登陆", nil) forState:UIControlStateNormal];
}
- (UIActivityIndicatorView *)activityIndicator
{
    if (_activityIndicator == nil) {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _activityIndicator.hidesWhenStopped = YES;
    }
    return _activityIndicator;
}

#pragma mark - Public
- (void)startLoadingAnimation {
    self.enabled = NO;
    [self.activityIndicator startAnimating];
    [self setTitle:@"" forState:UIControlStateNormal];
}

- (void)stopLoadingAnimation {
    self.enabled = YES;
    [self.activityIndicator stopAnimating];
    [self setTitle:@"登录" forState:UIControlStateNormal];
}



@end
