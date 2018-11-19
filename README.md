# LQDatePicker

[![CI Status](https://img.shields.io/travis/sniper/LQDatePicker.svg?style=flat)](https://travis-ci.org/sniper/LQDatePicker)
[![Version](https://img.shields.io/cocoapods/v/LQDatePicker.svg?style=flat)](https://cocoapods.org/pods/LQDatePicker)
[![License](https://img.shields.io/cocoapods/l/LQDatePicker.svg?style=flat)](https://cocoapods.org/pods/LQDatePicker)
[![Platform](https://img.shields.io/cocoapods/p/LQDatePicker.svg?style=flat)](https://cocoapods.org/pods/LQDatePicker)

## Example


To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LQDatePicker is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LQDatePicker'
```
```ruby
//init methods
+ (LQDatePicker *)showInView:(UIView *)view;

+ (LQDatePicker *)showInView:(UIView *)view selectedCallBack:(ChooseCallBack)callBack;
```

```ruby
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
```


## License

LQDatePicker is available under the MIT license. See the LICENSE file for more info.
