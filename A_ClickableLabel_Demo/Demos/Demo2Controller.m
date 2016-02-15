//
//  Demo2Controller.m
//  A_ClickableLabel_Demo
//
//  Created by Animax Deng on 2/13/16.
//  Copyright © 2016 Animax Deng. All rights reserved.
//

#import "Demo2Controller.h"
#import "A_ClickableLabel.h"
#import "A_AttributedStringBuilder.h"

@interface Demo2Controller ()

@property (weak, nonatomic) IBOutlet A_ClickableLabel *demoLabel;
@property (strong, nonatomic) UIView *explainArea;

@end

@implementation Demo2Controller {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _explainArea = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _explainArea.backgroundColor = [UIColor blackColor];
    _explainArea.layer.cornerRadius = 5.0f;
    
    [self.view addSubview:_explainArea];
    
    UILabel *noteLabel = [[UILabel alloc] init];
    noteLabel.text = @"Note...";
    noteLabel.textColor = [UIColor whiteColor];
    [_explainArea addSubview:noteLabel];
    
    
    
    aClickableLabelTouchEvent touchEvent = ^(A_ClickableElement *element, A_ClickableLabel *sender, A_ClickedAdditionalInformation *info) {
        
        self.explainArea.frame = CGRectMake(sender.frame.origin.x + info.clickedPoint.x , sender.frame.origin.y + info.clickedPoint.y, 100, 30);
    };
    
    A_ClickableElement *phenomenon = [A_ClickableElement create:@"phenomenon" withBuilder:[[A_AttributedStringBuilder createWithSystemFontSize:14] setUnderline:YES] andClick:touchEvent];
    
    A_ClickableElement *mathematical = [A_ClickableElement create:@"mathematical" withBuilder:[[A_AttributedStringBuilder createWithSystemFontSize:18] setUnderline:YES] andClick:touchEvent];
    
    A_ClickableElement *exhibits = [A_ClickableElement create:@"exhibits" withBuilder:[[A_AttributedStringBuilder createWithSystemFontSize:12] setUnderline:YES] andClick:touchEvent];
    
    A_ClickableElement *scale = [A_ClickableElement create:@"scale" withBuilder:[[A_AttributedStringBuilder createWithSystemFontSize:13] setUnderline:YES] andClick:touchEvent];
    
    [self.demoLabel setSentence:@"A fractal is a natural %@ or a %@ set that %@ a repeating pattern that displays at every %@." withBuilder:[A_AttributedStringBuilder createWithSystemFontSize:16] andElements: @[phenomenon, mathematical, exhibits, scale]];
    
}

- (IBAction)onClickBackgound:(id)sender {
        self.explainArea.frame = CGRectMake(0,0,0,0);
}

@end