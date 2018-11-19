//
//  LQDatePicker.m
//  LQDatePicker
//
//  Created by Mini-LuoQiang on 2018/11/19.
//

#import "LQDatePicker.h"
#define TEXT_COLOR   COLOR_RGBA(61, 147, 236, 1)
#define COLOR_RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

@interface LQDatePicker ()

@property (strong, nonatomic) UIView *maskView;
@property (strong, nonatomic) UIView *pickerConten;
@property (strong, nonatomic) UIDatePicker *picker;
@property (strong, nonatomic) UIView *toolBar;
@property (strong, nonatomic) UIButton *sure;
@property (strong, nonatomic) UIButton *cancle;
@property (assign, nonatomic) NSInteger dateType;

@end

@implementation LQDatePicker

//初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat toolH = 50;
        CGFloat pickerH = 220;
        
        self.maskView = [[UIView alloc] init];
        self.maskView.frame = self.bounds;
        self.maskView.backgroundColor = COLOR_RGBA(0, 0, 0, 0.5);
        [self addSubview:self.maskView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
        [self.maskView addGestureRecognizer:tap];
        
        
        self.pickerConten = [[UIView alloc] init];
        self.pickerConten.frame = CGRectMake(0, frame.size.height - toolH - pickerH, frame.size.width,toolH + pickerH);
        self.pickerConten.layer.cornerRadius = 5;
        [self addSubview:self.pickerConten];
        
        self.toolBar = [[UIView alloc] init];
        self.toolBar.frame = CGRectMake(0, 0, frame.size.width, toolH);
        self.toolBar.backgroundColor = [UIColor whiteColor];
        [self.pickerConten addSubview:self.toolBar];
        
        self.picker = [[UIDatePicker alloc] init];
        self.picker.frame = CGRectMake(0, toolH, frame.size.width, pickerH);
        self.picker.datePickerMode = UIDatePickerModeDate;
        self.picker.date = [NSDate date];
        self.picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
        self.picker.backgroundColor = [UIColor whiteColor];
        [self.pickerConten addSubview:self.picker];
        
        self.cancle = [UIButton buttonWithType:UIButtonTypeSystem];
        self.cancle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.cancle.tag = 20180;
        [self.cancle setTitleEdgeInsets:UIEdgeInsetsMake(0, 16, 0, 0)];
        [self.cancle setTitle:@"取消" forState:UIControlStateNormal];
        self.cancle.frame = CGRectMake(0, 0, frame.size.width * 0.5, toolH);
        [self.toolBar addSubview:self.cancle];
        
        
        self.sure = [UIButton buttonWithType:UIButtonTypeSystem];
        self.sure.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        self.sure.titleLabel.font = [UIFont systemFontOfSize:16];;
        self.sure.tag = 20181;
        [self.sure setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 16)];
        [self.sure setTitle:@"确定" forState:UIControlStateNormal];
        self.sure.frame = CGRectMake(frame.size.width * 0.5, 0,frame.size.width * 0.5,toolH);
        [self.toolBar addSubview:self.sure];
        
        
        UIView *lineV = [UIView new];
        lineV.backgroundColor = [UIColor lightGrayColor];
        lineV.frame = CGRectMake(0, toolH - 0.5, frame.size.width, 0.5);
        [self.pickerConten addSubview:lineV];
        
        
        [self.cancle addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.sure addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

+ (LQDatePicker *)showInView:(UIView *)view {
    LQDatePicker *datePicker = [[LQDatePicker alloc] initWithFrame:view.bounds];
    [view addSubview:datePicker];
    datePicker.hidden = YES;
    return datePicker;
}

+ (LQDatePicker *)showInView:(UIView *)view selectedCallBack:(ChooseCallBack)callBack {
    LQDatePicker *datePicker = [[LQDatePicker alloc] initWithFrame:view.bounds];
    datePicker.dateChooseCallBack = callBack;
    [view addSubview:datePicker];
    datePicker.hidden = YES;
    return datePicker;
}

- (void)showView {
    self.hidden = NO;
    self.pickerConten.transform = CGAffineTransformMakeTranslation(0, 270);
    self.maskView.alpha = 0;
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.pickerConten.transform = CGAffineTransformIdentity;
        self.maskView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hideView {
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.pickerConten.transform = CGAffineTransformMakeTranslation(0, 270);
        self.maskView.alpha = 0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
    
}

- (void)buttonDidClick:(UIButton *)button {
    if (button.tag == 20181){
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        NSString *dateString =  [formatter stringFromDate:self.picker.date];
        if ([self.delegate respondsToSelector:@selector(datePicker:selectedDate:)]) {
            [self.delegate datePicker:self selectedDate:dateString];
        }
        
        if (self.dateChooseCallBack) {
            
            self.dateChooseCallBack(dateString);
        }
    }
    [self hideView];
}

- (void)dealloc
{
    NSLog(@"%@ -- %@", [self class],NSStringFromSelector(_cmd));
}


@end
