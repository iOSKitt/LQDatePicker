//
//  LQViewController.m
//  LQDatePicker
//
//  Created by sniper on 11/19/2018.
//  Copyright (c) 2018 sniper. All rights reserved.
//

#import "LQViewController.h"
#import <LQDatePicker/LQDatePicker.h>

@interface LQViewController ()<LQDatePickerDelegate>

@property (nonatomic, strong) LQDatePicker *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation LQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _pickerView = [LQDatePicker showInView:self.view];
    _pickerView.delegate = self;
}

- (IBAction)getTime:(UIButton *)sender {
    [_pickerView showView];
}

- (void)datePicker:(LQDatePicker *)picker selectedDate:(NSString *)date {
    _label.text = date;
}

@end
