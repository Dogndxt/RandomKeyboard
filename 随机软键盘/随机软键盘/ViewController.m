//
//  ViewController.m
//  随机软键盘
//
//  Created by qingling_yang on 17/3/16.
//  Copyright © 2017年 qianxx. All rights reserved.
//

#import "ViewController.h"
#import "YQLTextField.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet YQLTextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.delegate = self;
    self.textField.maxNumberInput = 11;
}

- (IBAction)clickOn:(id)sender {
    
    NSLog(@"密码:%@", self.textField.text);

}


#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        self.testView.transform = CGAffineTransformMakeTranslation(0, -100.0);
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        self.testView.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
