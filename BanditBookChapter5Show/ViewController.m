//
//  ViewController.m
//  BanditBookChapter5Show
//
//  Created by holmes on 2023/4/21.
//

#import "ViewController.h"

#import <Masonry.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSTextField *labelTitle = [NSTextField labelWithString:@"This version only support uniform distribution"];
    NSTextField *labelMu = [NSTextField labelWithString:@"Expectation"];
    NSTextField *labelDiscription = [NSTextField labelWithString:@"Real distribution"];
    NSTextField *labelAEsti = [NSTextField labelWithString:@"a"];
    NSTextField *labelBEsti = [NSTextField labelWithString:@"b"];
    NSTextField *labelNEsti = [NSTextField labelWithString:@"n"];
    NSTextField *labelDiscriptionEsti = [NSTextField labelWithString:@"Estimation"];
    NSTextField *labelResult = [NSTextField labelWithString:@"Result"];
    NSTextField *showResult = [[NSTextField alloc] init];
    
    NSTextView *TextMu = [[NSTextView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    NSTextView *TextA = [[NSTextView alloc] initWithFrame:CGRectMake(10, 0, 60, 30)];
    NSTextView *TextB = [[NSTextView alloc] initWithFrame:CGRectMake(0, 10, 60, 30)];
    NSTextView *TextN = [[NSTextView alloc] initWithFrame:CGRectMake(20, 0, 60, 30)];
    
    
    [self.view addSubview:labelTitle];
    [self.view addSubview:labelMu];
    [self.view addSubview:labelDiscription];
    [self.view addSubview:labelAEsti];
    [self.view addSubview:labelBEsti];
    [self.view addSubview:labelNEsti];
    [self.view addSubview:labelDiscriptionEsti];
    [self.view addSubview:TextA];
    [self.view addSubview:TextB];
    [self.view addSubview:TextN];
    [self.view addSubview:TextMu];
    [self.view addSubview:labelResult];
    [self.view addSubview:showResult];
    
    
    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(20);
    }];
    [labelDiscription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(30);
        make.top.equalTo(labelTitle.mas_bottom).offset(20);
    }];
    [labelMu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(labelDiscription);
        make.top.equalTo(labelDiscription.mas_bottom).offset(40);
    }];
    [TextMu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(labelMu);
        make.left.equalTo(labelMu.mas_right).offset(10);
        make.width.equalTo(labelMu.mas_width);
        make.height.equalTo(labelMu.mas_height);
    }];
    [labelDiscriptionEsti mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(labelDiscription);
        make.left.equalTo(self.view.mas_centerX).offset(50);
    }];
    [labelAEsti mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelDiscriptionEsti);
        make.top.equalTo(labelDiscription.mas_bottom).offset(15);
    }];
    [labelBEsti mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelDiscriptionEsti);
        make.top.equalTo(labelAEsti.mas_bottom).offset(15);
    }];
    [labelNEsti mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelDiscriptionEsti);
        make.top.equalTo(labelBEsti.mas_bottom).offset(15);
    }];
    [TextA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelAEsti.mas_right).offset(10);
        make.centerY.equalTo(labelAEsti);
        make.width.equalTo(labelMu.mas_width);
        make.height.equalTo(labelMu.mas_height);
    }];
    [TextB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelBEsti.mas_right).offset(10);
        make.centerY.equalTo(labelBEsti);
        make.width.equalTo(labelMu.mas_width);
        make.height.equalTo(labelMu.mas_height);
    }];
    [TextN mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelNEsti.mas_right).offset(10);
        make.centerY.equalTo(labelNEsti);
        make.width.equalTo(labelMu.mas_width);
        make.height.equalTo(labelMu.mas_height);
    }];
    
    NSButton *decideButton = [[NSButton alloc] initWithFrame:CGRectMake(10, 10, 50, 30)];
    [self.view addSubview:decideButton];
    decideButton.title = @"Check it!";
    [decideButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(labelNEsti.mas_bottom).offset(50);
        make.width.equalTo(labelMu.mas_width);
        make.height.equalTo(labelMu.mas_height);
    }];
    
    [labelResult mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(decideButton.mas_bottom).offset(20);
    }];
    [showResult mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(labelResult);
        make.top.equalTo(labelResult).offset(20);
    }];
    
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
