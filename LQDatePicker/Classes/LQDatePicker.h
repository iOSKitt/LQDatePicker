//
//  LQDatePicker.h
//  LQDatePicker
//
//  Created by Mini-LuoQiang on 2018/11/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LQDatePicker;

@protocol LQDatePickerDelegate <NSObject>
@required
-(void)datePicker:(LQDatePicker *)picker selectedDate:(NSString *)date;

@end

typedef void(^ChooseCallBack)(NSString *date);

@interface LQDatePicker : UIView

@property (nonatomic, weak) id<LQDatePickerDelegate> delegate;

@property (nonatomic, copy) ChooseCallBack dateChooseCallBack;


+ (LQDatePicker *)showInView:(UIView *)view;

+ (LQDatePicker *)showInView:(UIView *)view selectedCallBack:(ChooseCallBack)callBack;

- (void)showView;
@end

NS_ASSUME_NONNULL_END
