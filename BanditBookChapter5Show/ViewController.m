//
//  ViewController.m
//  BanditBookChapter5Show
//
//  Created by holmes on 2023/4/21.
//

#import "ViewController.h"
#import <Masonry.h>
#import <GameplayKit/GameplayKit.h>
#import <GameplayKit/GameplayKitBase.h>
#import <GameplayKit/GKGameModel.h>


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSTextField *labelTitle = [NSTextField labelWithString:@"This version only support gaussian distribution"];
    NSTextField *labelMu = [NSTextField labelWithString:@"Epsilon"];
    NSTextField *labelDiscription = [NSTextField labelWithString:@"Probability"];
    NSTextField *labelAEsti = [NSTextField labelWithString:@"mu"];
    NSTextField *labelBEsti = [NSTextField labelWithString:@"sigma^2"];
    NSTextField *labelNEsti = [NSTextField labelWithString:@"n"];
    NSTextField *labelDiscriptionEsti = [NSTextField labelWithString:@"Estimation"];
    NSTextField *labelResultLeft = [NSTextField labelWithString:@"Left side"];
    NSTextField *labelResultRight = [NSTextField labelWithString:@"right side"];

    _showResultLeft = [[NSTextField alloc] init];
    _showResultRight = [[NSTextField alloc] init];
    _TextMu = [[NSTextView alloc] init];
    _TextA = [[NSTextView alloc] init];
    _TextB = [[NSTextView alloc] init];
    _TextN = [[NSTextView alloc] init];

    _showResultLeft.stringValue = @"";
    _showResultRight.stringValue = @"";
    
    [self.view addSubview:labelTitle];
    [self.view addSubview:labelMu];
    [self.view addSubview:labelDiscription];
    [self.view addSubview:labelAEsti];
    [self.view addSubview:labelBEsti];
    [self.view addSubview:labelNEsti];
    [self.view addSubview:labelDiscriptionEsti];
    [self.view addSubview:_TextA];
    [self.view addSubview:_TextB];
    [self.view addSubview:_TextN];
    [self.view addSubview:_TextMu];
    [self.view addSubview:labelResultLeft];
    [self.view addSubview:labelResultRight];

    [self.view addSubview:_showResultLeft];
    [self.view addSubview:_showResultRight];

    
    
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
    [_TextMu mas_makeConstraints:^(MASConstraintMaker *make) {
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
    [_TextA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelBEsti.mas_right).offset(10);
        make.centerY.equalTo(labelAEsti);
        make.width.equalTo(labelMu.mas_width);
        make.height.equalTo(labelMu.mas_height);
    }];
    [_TextB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelBEsti.mas_right).offset(10);
        make.centerY.equalTo(labelBEsti);
        make.width.equalTo(labelMu.mas_width);
        make.height.equalTo(labelMu.mas_height);
    }];
    [_TextN mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelBEsti.mas_right).offset(10);
        make.centerY.equalTo(labelNEsti);
        make.width.equalTo(labelMu.mas_width);
        make.height.equalTo(labelMu.mas_height);
    }];
    
    NSButton *decideButton = [[NSButton alloc] init];
    
    [self.view addSubview:decideButton];
//    decideButton.title = @"Check it!";
    [decideButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(labelNEsti.mas_bottom).offset(50);
        make.width.equalTo(labelMu.mas_width);
        make.height.equalTo(labelMu.mas_height);
    }];
    
    [labelResultLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(labelDiscription);
        make.top.equalTo(decideButton.mas_bottom).offset(20);
    }];
    
    [labelResultRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(labelAEsti);
        make.top.equalTo(decideButton.mas_bottom).offset(20);
    }];
    
    [_showResultLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(labelResultLeft);
        make.top.equalTo(labelResultLeft.mas_bottom).offset(20);
        make.width.equalTo(labelMu.mas_width);
        make.height.equalTo(labelMu.mas_height);
    }];
    
    [_showResultRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(labelResultRight);
        make.top.equalTo(labelResultRight.mas_bottom).offset(20);
        make.width.equalTo(labelMu.mas_width);
        make.height.equalTo(labelMu.mas_height);
    }];
    
    [decideButton setTitle:@"Check!"];
    [decideButton setTarget:self];
    [decideButton setAction:@selector(Calculation:)];
    
}

- (BOOL)isPureInt:(NSString *)string{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int *num = NULL;
    return [scan scanInt:num] && [scan isAtEnd];
}

- (BOOL)isPureFloat:(NSString *)string{
    NSScanner *scan = [NSScanner scannerWithString:string];
    float *num = NULL;
    return [scan scanFloat:num] && [scan isAtEnd];
}

- (BOOL)isRangeFloat:(NSString *)string{
    NSScanner *scan = [NSScanner scannerWithString:string];
    float *num = NULL;
    if (![scan scanFloat:num] && [scan isAtEnd]){
        return [scan scanFloat:num] && [scan isAtEnd];
    } else {
        float num = [string floatValue];
        if (num >= 0 && num <= 1.0) return true;
        else return false;
    }
    return true;
}

- (void)Calculation:(NSButton *) sender {
    NSString *mu = _TextMu.string;
    NSString *a = _TextA.string;
    NSString *b = _TextB.string;
    NSString *n = _TextN.string;
    NSLog(@"%@", mu);
    NSLog(@"%@", a);
    NSLog(@"%@", b);
    NSLog(@"%@", n);
    
    float muInt = mu.floatValue;
    float AInt = a.floatValue;
    float BInt = b.floatValue;
    int NInt = n.intValue;
    float ResultLeft = 0;
    float ResultRight  ;
    
    if([self isPureFloat:mu] && [self isPureFloat:a] && [self isPureFloat:b] && [self isPureInt:n]) {
        if([self isRangeFloat:mu]) {
        if(NInt >= 0 && BInt >= 0) {
            float delta = 0.01;
            float NFloat = NInt;
            int Interation = NInt;
            ResultRight = exp((-2) * ( (Interation * Interation * muInt * muInt)
                              /(NFloat * (2 * muInt + 2 * delta * Interation * 100 ) * (2 * muInt + 2 * delta * Interation * 1000))));

            float tildeMu = 0;
            for(int i = 0;i < NInt ; i++){
                tildeMu += [self getRandomFloat:AInt to:BInt];
            }
            tildeMu = tildeMu / NInt;
            
            float absDifferTildeMuMu = tildeMu - AInt > 0 ? tildeMu-AInt : AInt - tildeMu;
            
            float X = absDifferTildeMuMu  + AInt;
            ResultLeft = 0.5 * erfcf(((muInt - X) / sqrt(BInt * 2))) * delta;
            
            ResultLeft *= 2;
            
            ResultLeft = 1 - ResultLeft;

            _showResultLeft.stringValue = [NSString stringWithFormat:@"%f", ResultLeft];
            
            _showResultRight.stringValue = [NSString stringWithFormat:@"%f", ResultRight];
            
            NSLog(@"%@", _showResultLeft.stringValue);
            NSLog(@"%@", _showResultRight.stringValue);

            self.view.needsDisplay = true;
                
        } else [self showWaringRela:@"nothing"];
        } else [self showWaringRelaAB:@"nothing"];
    } else
        [self showWaring:@"nothing"];
}

- (void)showWaring:(NSString *) msg {
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleCritical;
    alert.messageText = @"Invaild input!!";
    [alert addButtonWithTitle:@"OK"];
    [alert runModal];
}

- (void)showWaringRela:(NSString *) msg {
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleCritical;
    alert.messageText = @"Require positive n and sigma^2!";
    [alert addButtonWithTitle:@"OK"];
    [alert runModal];
}

- (void)showWaringRelaAB:(NSString *) msg {
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSAlertStyleCritical;
    alert.messageText = @"epsilon should be [0, 1]!";
    [alert addButtonWithTitle:@"OK"];
    [alert runModal];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}

- (float)getRandomFloat: (float)mu to :(float) sigmaSqure {
    
    float u =(float)(random() %1000 + 1)/1000;
    float v =(float)(random() %1000 + 1)/1000;
    float x = sqrt(-2*log(u))*cos(2* M_PI *v);
    float y = x * sqrt(sigmaSqure) + mu;
    return y;
    
}


@end
